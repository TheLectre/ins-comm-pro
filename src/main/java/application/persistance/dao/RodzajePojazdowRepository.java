package application.persistance.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.model.RodzajPojazdu;

@Repository
public class RodzajePojazdowRepository implements RodzajePojazdowDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public boolean addRodzajPojazdu(RodzajPojazdu rodzajPojazdu) {

		Session session = sessionFactory.getCurrentSession();

		if (!isRodzajPojazduPresent(rodzajPojazdu)) {
			session.persist(rodzajPojazdu);
		} else {
			return false;
		}

		return true;
	}

	@Override
	@Transactional
	public boolean isRodzajPojazduPresent(RodzajPojazdu rodzajPojazdu) {

		Session session = sessionFactory.getCurrentSession();

		if (session
				.createQuery("from RodzajPojazdu where nazwaRodzaju = :nazwa")
				.setParameter("nazwa", rodzajPojazdu.getNazwaRodzaju())
				.uniqueResult() != null) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean updateRodzajPojazdu(RodzajPojazdu rodzajPojazdu) {

		Session session = sessionFactory.getCurrentSession();

		if (!isRodzajPojazduPresent(rodzajPojazdu)) {
			session.update(rodzajPojazdu);
		} else {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<RodzajPojazdu> getAllRodzajePojazdow() {

		Session session = sessionFactory.getCurrentSession();

		List<RodzajPojazdu> rodzajePojazdow = session.createQuery(
				"from RodzajPojazdu").list();

		return rodzajePojazdow;
	}

	@Override
	@Transactional
	public void deleteRodzajPojazdu(RodzajPojazdu rodzajPojazdu) {

		Session session = sessionFactory.getCurrentSession();

		session.delete(rodzajPojazdu);

	}

}
