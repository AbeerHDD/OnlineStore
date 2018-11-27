package tn.essat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tn.essat.dao.ICategorieDao;
import tn.essat.dao.IProduitDao;
import tn.essat.model.Categorie;
import tn.essat.model.Produit;

@Service
public class ServiceImp implements IService{
	
	@Autowired
	ICategorieDao daocat;
	@Autowired
	IProduitDao daoprod;
	
	public void setDaocat(ICategorieDao daocat) {
		this.daocat = daocat;
	}
	
	public void setDaoprod(IProduitDao daoprod) {
		this.daoprod = daoprod;
	}
	
	public List<Categorie> getAllCategories() {
		return (List<Categorie>) daocat.findAll();
	}

	public List<Produit> getAllProduit() {
		return (List<Produit>) daoprod.findAll();
	}

	public List<Produit> getAllProduitByCat(int cat) {
		return daoprod.getAllProduitsByCat(cat);
	}

	public Produit getProduitById(int id) {		
		return daoprod.findOne(id);
	}

	public Categorie getCategorieById(int id) {
		return daocat.findOne(id);
	}

}
