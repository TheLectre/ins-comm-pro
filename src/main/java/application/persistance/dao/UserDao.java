package application.persistance.dao;

import java.util.List;

import application.persistance.model.User;

public interface UserDao {
	
	User findByEmail(String email);
	
	boolean addUser(User user);
	
	void updateUser(User user);
	
	List<User> getAllUsersOfType(String type);
	
	List<User> getPracownicyTu(String towarzystwo);
	
	List<User> getAllClients();
	
	List<User> getClientsOfAgent(String agentEmail);
	
	List<User> getClientsOfTowarzystwo(String pracownikEmail);
	
}
