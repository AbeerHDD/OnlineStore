package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Categorie {
	
	@Id
	@GeneratedValue
	private Integer id;
	private String description;
	private int etat;
	
	public Categorie(Integer id, String description, int etat) {
		super();
		this.id = id;
		this.description = description;
		this.etat = etat;
	}
	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	
	
	

}
