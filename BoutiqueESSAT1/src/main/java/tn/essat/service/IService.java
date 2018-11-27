package tn.essat.service;

import java.util.List;

import tn.essat.model.Categorie;
import tn.essat.model.Produit;

public interface IService {
	public List<Categorie> getAllCategories();
	public List<Produit> getAllProduit();
	public List<Produit> getAllProduitByCat(int cat);
	public Produit getProduitById(int id);
	public Categorie getCategorieById(int id);
}
