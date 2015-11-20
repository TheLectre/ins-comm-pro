package application.persistance.users.dao;

import application.persistance.users.model.User;

public interface UserDao {
	User findByEmail(String email);
}
