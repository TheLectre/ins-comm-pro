package application.persistance.towarzystwa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.towarzystwa.model.Towarzystwo;

@Repository
public class TowarzystwaRepository implements TowarzystwoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addTowarzystwo(Towarzystwo tow) {
		Session session = sessionFactory.getCurrentSession();

		session.persist(tow);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Towarzystwo> getAll() {
		Session session = sessionFactory.getCurrentSession();

		List<Towarzystwo> towarzystwa = session.createQuery("from Towarzystwo")
				.list();

		return towarzystwa;
	}

	@Override
	@Transactional
	public Towarzystwo getTowarzystwo(String name) {
		Session session = sessionFactory.getCurrentSession();

		return (Towarzystwo)session.createQuery("from Towarzystwo where nazwa = :tName").setParameter("tName", name).uniqueResult();
	}
}
