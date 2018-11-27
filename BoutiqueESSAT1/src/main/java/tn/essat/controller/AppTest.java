package tn.essat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tn.essat.dao.IClientDao;
import tn.essat.dao.ICommandeDao;
import tn.essat.dao.ILigneCdeDao;
import tn.essat.model.Categorie;
import tn.essat.model.Client;
import tn.essat.model.Commande;
import tn.essat.model.LigneCde;
import tn.essat.model.LignePanier;
import tn.essat.model.Panier;
import tn.essat.model.Produit;
import tn.essat.service.IService;

@Controller
public class AppTest {
	@Autowired
	IService gestion;
	
	@Autowired 
	ICommandeDao cdedao;
	@Autowired
	IClientDao clientDao;
	@Autowired
	ILigneCdeDao ligneCdeDao;
	public void setGestion(IService gestion) {
		this.gestion = gestion;
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET )
	public String page1(Model m) {
		List<Produit> liste1 = gestion.getAllProduit();
		List<Categorie> liste2 = gestion.getAllCategories();
		m.addAttribute("listep", liste1);
		m.addAttribute("listec", liste2);
		return "acceuil";
	}
	
	
	@RequestMapping(value="/produits/cat/{id}", method=RequestMethod.GET )
	public String fnct2(Model m, @PathVariable("id") int id) {
		List<Produit> liste1=gestion.getAllProduitByCat(id);
		List<Categorie> liste2 = gestion.getAllCategories();
		m.addAttribute("listep", liste1);
		m.addAttribute("listec", liste2);
		return "acceuil";
	}
	
	@RequestMapping(value="/ajoutPanier/{id}", method=RequestMethod.GET)
	public String fnct3(Model m, @PathVariable("id") int id, HttpSession session) {
		Panier pan=(Panier) session.getAttribute("pan");
		if(pan==null) {
			Panier pan1= new Panier();
			Produit p= gestion.getProduitById(id);
			pan1.addLignes(new LignePanier(p, 1));
			session.setAttribute("pan", pan1);			
		}else {
			
			boolean test=false;
			for(int i=0;i<pan.getLignes().size();i++) {
				if(pan.getLignes().get(i).getProd().getId()==id) {
					pan.getLignes().get(i).setQuantite(pan.getLignes().get(i).getQuantite()+1);
					test=true;
				}
			}
			
			if(test==false) {
				Produit p= gestion.getProduitById(id);
				pan.addLignes(new LignePanier(p, 1));
			}
			
			session.setAttribute("pan", pan);				
		}
		
		return "redirect:/panier";
	}
	
	@RequestMapping(value="/panier", method=RequestMethod.GET)
	public String fnct4(Model m) {
		List<Categorie> liste2 = gestion.getAllCategories();
		m.addAttribute("listec", liste2);
		return "monpanier";
	}
	
	
	
	@RequestMapping(value="/deletepanier/{id}", method=RequestMethod.GET)
	public String fnt5(Model m, HttpSession session, @PathVariable("id") int id) {
		
		Panier p= (Panier) session.getAttribute("pan");
		LignePanier li1=null;
		for(LignePanier li:p.getLignes()) {
			if(li.getProd().getId()==id) {
				li1=li;
			}
		}
		p.getLignes().remove(li1);
		
		session.setAttribute("pan", p);
		
		return "redirect:/panier";
		
	}
	
	@RequestMapping(value="/commander",method=RequestMethod.GET)
	public String fnt6(Model m, HttpSession session) {
		
		Client clt=(Client) session.getAttribute("clt");
		if(clt == null) {
			return "redirect:/connexion";
		}else {
			Panier pan=(Panier)session.getAttribute("pan");
			Commande cde=new Commande();
			cde.setClt(clt);
			cde.setDateCde("10/10/2018");
			for(LignePanier p:pan.getLignes()) {
				LigneCde licde=new LigneCde();
				licde.setProd(p.getProd());
				licde.setQuantite(p.getQuantite());
				cde.addLignes(licde);
			}
			cdedao.save(cde);
			session.removeAttribute("pan");
			return "fincde";
		}}
		
		
	@RequestMapping(value="/connexion", method=RequestMethod.GET)
	public String fnt7(Model m) {
		Client client=new Client();
		m.addAttribute("clt", client);
		return "connexion";
	}
	
	@RequestMapping(value="/verif", method=RequestMethod.POST)
	public String fnct8(Model m, HttpServletRequest request,HttpSession session) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Client clt=clientDao.verif(email, password);
		if(clt==null) {
			return "redirect:/connexion";
		}else {
			
			session.setAttribute("clt", clt);
			return "redirect:/commander";
		}
	}
		
		@RequestMapping(value="/ajouterClient", method=RequestMethod.POST)
		public String fnct9(Model m, HttpSession session, @ModelAttribute("clt")Client clt) {
			clientDao.save(clt);
			session.setAttribute("clt", clt);
			return "redirect:/commander";
		
	}
		@RequestMapping(value="/dec", method=RequestMethod.GET)
		public String fnct10(Model m, HttpSession session) {
			
			session.removeAttribute("clt");
			return "redirect:/home";
		
	}
	
	
		@RequestMapping(value="/mescommandes", method=RequestMethod.GET)
		public String fnct11(Model m, HttpSession session) {
	
			Client clt=(Client) session.getAttribute("clt");
			List<Commande> liste1=cdedao.getListeCdes(clt.getId());
			m.addAttribute("listecde",liste1);
			return"mescommandes";
			
			
			

	
		}
	
	

}
