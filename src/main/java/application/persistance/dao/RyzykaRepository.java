package application.persistance.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.model.Ryzyko;

@Repository
public class RyzykaRepository implements RyzykaDao {


	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public boolean addRyzyko(Ryzyko ryzyko) {

		Session session = sessionFactory.getCurrentSession();

		if (!isRyzykoPresent(ryzyko)) {
			session.persist(ryzyko);
		} else {
			return false;
		}

		return true;
	}

	@Override
	@Transactional
	public boolean isRyzykoPresent(Ryzyko ryzyko) {

		Session session = sessionFactory.getCurrentSession();

		if (session
				.createQuery("from Ryzyko where id != :id AND skrot = :skrot")
				.setParameter("id", ryzyko.getId())
				.setParameter("skrot", ryzyko.getSkrot())
				.uniqueResult() != null) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean updateRyzyko(Ryzyko ryzyko) {

		Session session = sessionFactory.getCurrentSession();

		if (!isRyzykoPresent(ryzyko)) {
			session.update(ryzyko);
		} else {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Ryzyko> getAllRyzyka() {

		Session session = sessionFactory.getCurrentSession();

		List<Ryzyko> ryzyka = session.createQuery(
				"from Ryzyko").list();

		return ryzyka;
	}

	@Override
	@Transactional
	public void deleteRyzyko(int id) {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete Ryzyko where id = :id").setParameter("id", id);
		
		query.executeUpdate();

	}
	
}
