package application.persistance.towarzystwa.dao;

import java.util.List;

import application.persistance.towarzystwa.model.Towarzystwo;

public interface TowarzystwoDao {
	void addTowarzystwo(Towarzystwo tow);
	
	List<Towarzystwo> getAll();
}
