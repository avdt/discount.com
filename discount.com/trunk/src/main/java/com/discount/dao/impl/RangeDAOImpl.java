package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.RangeDAO;
import com.discount.domain.Range;

@Repository
public class RangeDAOImpl implements RangeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(Range object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	@Transactional
	public void update(Range object) {
		sessionFactory.getCurrentSession().update(object);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	@Transactional
	public void delete(Range object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public Range findById(Integer id) {
		return (Range) sessionFactory.getCurrentSession().get(Range.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Range> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Range")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Range> findByProducer(int producerId) {
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from Range r where r.producer.id = " + " :producerId")
				.setInteger("producerId", producerId).list();
	}

}
