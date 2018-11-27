package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Commande;
@Repository
public interface ICommandeDao extends CrudRepository<Commande, Integer> {
	
	@Query("select c from Commande c where c.clt.id=:x")
	public List<Commande> getListeCdes(int id);
}
