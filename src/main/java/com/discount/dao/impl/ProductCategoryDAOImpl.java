package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.ProductCategoryDAO;
import com.discount.domain.ProductCategory;

@Repository
public class ProductCategoryDAOImpl implements ProductCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(ProductCategory object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	@Transactional
	public void update(ProductCategory object) {
		sessionFactory.getCurrentSession().update(object);
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

	@Override
	@Transactional
	public ProductCategory findByName(String name) {
		// List<ProductCategory> list = getHibernateTemplate().find(
		// "from ProductCategory where name=?", name);
		// return list.get(0);

		// TODO: body

		return null;
	}

}
