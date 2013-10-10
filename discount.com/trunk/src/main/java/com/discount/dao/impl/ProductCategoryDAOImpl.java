package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.alfero.dao.ProductCategoryDAO;
import com.discount.domain.ProductCategory;

@Repository
public class ProductCategoryDAOImpl implements ProductCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(ProductCategory object) {
		Session currentSession = sessionFactory.getCurrentSession();
		// currentSession.flush();
		currentSession.save(object);
		currentSession.flush();
	}

	@Override
	@Transactional
	public void update(ProductCategory object) {
		sessionFactory.getCurrentSession().merge(object);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	@Transactional
	public void delete(ProductCategory object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public ProductCategory findById(Integer id) {
		return (ProductCategory) sessionFactory.getCurrentSession().get(
				ProductCategory.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ProductCategory> findAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from ProductCategory").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ProductCategory> findRootCategories() {
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from ProductCategory c where c.root = " + " :root")
				.setBoolean("root", true).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ProductCategory> findChildCategories() {
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from ProductCategory c where c.root = " + " :root")
				.setBoolean("root", false).list();
	}

}
