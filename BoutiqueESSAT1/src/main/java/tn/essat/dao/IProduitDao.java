package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Produit;

@Repository
public interface IProduitDao extends CrudRepository<Produit, Integer> {
	
	@Query("select p from Produit p where p.cat.id = :x ")
	public List<Produit> getAllProduitsByCat(@Param("x") int id);
	
	public List<Produit> findByDescription(String s);
	

}
