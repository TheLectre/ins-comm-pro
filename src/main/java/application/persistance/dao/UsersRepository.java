package application.persistance.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.model.User;

@Repository("usersRepository")
public class UsersRepository implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public User findByEmail(String email) {

		Session session = sessionFactory.getCurrentSession();

		User user = (User) session
				.createQuery("from User where email = :email")
				.setParameter("email", email).uniqueResult();

		
		return user;
	}

	@Override
	@Transactional(readOnly = false)
	public boolean addUser(User user) {

		Session session = sessionFactory.getCurrentSession();

		if (((User) session.createQuery("from User where email = :email")
				.setParameter("email", user.getEmail()).uniqueResult()) != null) {
			return false;
		}

		session.persist(user);

		return true;
	}

	@Override
	@Transactional(readOnly=false)
	public void updateUser(User user) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.update(user);
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getAllUsersOfType(String type) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> users = session.createQuery("from User where typ = :typ").setParameter("typ", type).list();
		
		return users;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getPracownicyTu(String towarzystwo) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> users = session.createQuery("from User where typ = 'towarzystwo' and towarzystwo = :tu ").setParameter("tu", towarzystwo).list();
		
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getAllClients() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> clients = session.createQuery("from User where typ = 'klient' ").list();
		
		return clients;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getClientsOfAgent(String agentEmail) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> clients = session.createQuery("from User where typ = 'klient' and agent = :agent ").setParameter("agent", agentEmail).list();
		
		return clients;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getClientsOfTowarzystwo(String pracownikEmail) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<User> allClients = session.createQuery("from User where typ = 'klient'").list();
		
		List<User> myClients = new ArrayList<>();
		
		for(User p : allClients) {
			if(p.getPracownicy().containsValue(pracownikEmail)) {
				myClients.add(p);
			}
		}
		
		return myClients;
	}

}
