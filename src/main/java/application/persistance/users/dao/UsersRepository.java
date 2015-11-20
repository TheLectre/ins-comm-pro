package application.persistance.users.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import application.persistance.users.model.User;

@Repository("usersRepository")
public class UsersRepository implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User findByEmail(String email) {
		return (User)sessionFactory.getCurrentSession().
			createQuery("from User where email = :email").setParameter("email", email).uniqueResult();
	}

}
