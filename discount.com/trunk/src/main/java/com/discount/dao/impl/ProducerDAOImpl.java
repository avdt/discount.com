package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.ProducerDAO;
import com.discount.domain.Producer;

@Repository
public class ProducerDAOImpl implements ProducerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(Producer object) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(object);
		currentSession.flush();
	}

	@Override
	@Transactional
	public void update(Producer object) {
		sessionFactory.getCurrentSession().update(object);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	@Transactional
	public void delete(Producer object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public Producer findById(Integer id) {
		return (Producer) sessionFactory.getCurrentSession().get(
				Producer.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Producer> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Producer")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Producer> findByCategoryId(Integer categoryId) {
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from Producer p inner join p.categories cs where cs.id= :categoryId")
				.setInteger("categoryId", categoryId).list();
	}

}
