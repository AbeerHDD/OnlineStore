package tn.essat.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Commande {
	@Id @GeneratedValue
	private Integer id;
	private String dateCde;
	@ManyToOne @JoinColumn(name="ct_id")
	private Client clt;
	@OneToMany(cascade=CascadeType.ALL,mappedBy="cde") /* 1 mappe par 2*/
	List<LigneCde> lignes;
	public Commande(Integer id, String dateCde, Client clt) {
		super();
		this.id = id;
		this.dateCde = dateCde;
		this.clt = clt;
		this.lignes=new ArrayList<LigneCde>();
	}
	public Commande() {
		super();
		// TODO Auto-generated constructor stub
		this.lignes=new ArrayList<LigneCde>();
	}
	
	public boolean addLignes(LigneCde li) {
		li.setCde(this);
		return lignes.add(li);
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDateCde() {
		return dateCde;
	}
	public void setDateCde(String dateCde) {
		this.dateCde = dateCde;
	}
	public Client getClt() {
		return clt;
	}
	public void setClt(Client clt) {
		this.clt = clt;
	}
	public List<LigneCde> getLignes() {
		return lignes;
	}
	public void setLignes(List<LigneCde> lignes) {
		this.lignes = lignes;
	}
	
	
	
	
	
}
