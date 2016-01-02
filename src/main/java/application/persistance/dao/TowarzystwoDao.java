package application.persistance.dao;

import java.util.List;

import application.persistance.model.Towarzystwo;

public interface TowarzystwoDao {
	void addTowarzystwo(Towarzystwo tow);
	
	List<Towarzystwo> getAll();
	
	Towarzystwo getTowarzystwo(String name);
}
