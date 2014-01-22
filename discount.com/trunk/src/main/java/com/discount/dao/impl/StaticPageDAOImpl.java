package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.StaticPageDAO;
import com.discount.domain.StaticPage;

@Repository
public class StaticPageDAOImpl implements StaticPageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(StaticPage object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	@Transactional
	public void update(StaticPage object) {
		sessionFactory.getCurrentSession().update(object);
	}

	@Override
	@Transactional
	public void delete(StaticPage object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public StaticPage findById(Integer id) {
		return (StaticPage) sessionFactory.getCurrentSession().get(
				StaticPage.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<StaticPage> findAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from StaticPage").list();
	}

	@Override
	@Transactional
	public StaticPage findByUrl(String url) {
		return (StaticPage) sessionFactory.getCurrentSession()
				.createQuery("from StaticPage sP where sP.url = " + " :url")
				.setString("url", url).list().get(0);
	}

}
