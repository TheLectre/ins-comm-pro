package application.persistance.dao;

import java.util.List;
import java.util.Map;

import application.persistance.model.Oferta;

public interface OfertyDao {
	
	void addOferta(Oferta oferta);
	
	List<Oferta> getAllOfClient(String klientEmail);
	
	List<Oferta> getAll();
	
	Oferta getById(Integer id);
}
