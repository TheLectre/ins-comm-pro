package application.persistance.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.model.Oferta;
import application.persistance.model.OfertaSzczegoly;
import application.persistance.model.Ryzyko;

@Repository
public class OfertyRepository implements OfertyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private RyzykaDao ryzykaRepository;

	@Override
	@Transactional
	public void addOferta(Oferta oferta) {

		Session session = sessionFactory.getCurrentSession();

		session.persist(oferta);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Oferta> getAll() {

		Session session = sessionFactory.getCurrentSession();

		List<Oferta> oferty = session.createQuery("from Oferta").list();

		return oferty;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Oferta> getAllOfClient(String klientEmail) {

		Session session = sessionFactory.getCurrentSession();

		List<Oferta> oferty = session
				.createQuery("from Oferta where klientEmail = :email")
				.setParameter("email", klientEmail).list();

		return oferty;
	}

	@Override
	@Transactional
	public Oferta getById(Integer id) {

		Session session = sessionFactory.getCurrentSession();

		Oferta oferta = (Oferta) session
				.createQuery("from Oferta where id = :id")
				.setParameter("id", id).uniqueResult();

		return oferta;
	}

}
