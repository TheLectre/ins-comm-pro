package application.persistance.users.dao;

import java.util.List;

import application.persistance.users.model.User;

public interface UserDao {
	
	User findByEmail(String email);
	
	boolean addUser(User user);
	
	void updateUser(User user);
	
	List<User> getAllUsersOfType(String type);
	
}
