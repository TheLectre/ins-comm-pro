package application.persistance.dao;

import java.util.List;

import application.persistance.model.Ryzyko;

public interface RyzykaDao {
	
	boolean addRyzyko(Ryzyko ryzyko);

	boolean updateRyzyko(Ryzyko ryzyko);

	boolean isRyzykoPresent(Ryzyko ryzyko);

	List<Ryzyko> getAllRyzyka();

	void deleteRyzyko(int id);
}
