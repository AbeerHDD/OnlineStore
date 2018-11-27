package tn.essat.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.LigneCde;
@Repository
public interface ILigneCdeDao extends CrudRepository<LigneCde, Integer> {

}
