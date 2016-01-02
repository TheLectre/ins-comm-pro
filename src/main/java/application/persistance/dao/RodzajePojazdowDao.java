package application.persistance.dao;

import java.util.List;

import application.persistance.model.RodzajPojazdu;

public interface RodzajePojazdowDao {

	boolean addRodzajPojazdu(RodzajPojazdu rodzajPojazdu);
	
	boolean updateRodzajPojazdu(RodzajPojazdu rodzajPojazdu);
	
	boolean isRodzajPojazduPresent(RodzajPojazdu rodzajPojazdu);

	List<RodzajPojazdu> getAllRodzajePojazdow();
	
	void deleteRodzajPojazdu(RodzajPojazdu rodzajPojazdu);
	
}
