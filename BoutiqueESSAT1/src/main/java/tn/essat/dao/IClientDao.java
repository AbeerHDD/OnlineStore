package tn.essat.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Client;
@Repository
public interface IClientDao extends CrudRepository<Client, Serializable> {
	
	
	@Query("select c from Client c where c.email=:x1 and c.password=:x2")
	public Client verif(@Param("x1") String email,@Param("x2") String password);
	
}
