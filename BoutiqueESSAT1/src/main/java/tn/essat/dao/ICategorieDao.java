package tn.essat.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Categorie;

@Repository
public interface ICategorieDao extends CrudRepository<Categorie, Integer> {

}
