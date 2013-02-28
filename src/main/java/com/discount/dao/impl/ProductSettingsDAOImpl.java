package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.discount.dao.ProductSettingsDAO;
import com.discount.domain.ProductSettings;

@Repository
public class ProductSettingsDAOImpl implements ProductSettingsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ProductSettings object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	public void update(ProductSettings object) {
		sessionFactory.getCurrentSession().update(object);
	}

	@Override
	public void delete(ProductSettings object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	public ProductSettings findById(Integer id) {
		return (ProductSettings) sessionFactory.getCurrentSession().get(
				ProductSettings.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductSettings> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Client")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductSettings> findByProductId(Integer productId) {

		List<ProductSettings> list = sessionFactory.getCurrentSession()
				.createCriteria(ProductSettings.class)
				.add(Restrictions.eq("productId", productId)).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ProductSettings findByPropertyName(String propertyName) {
		List<ProductSettings> list = sessionFactory.getCurrentSession()
				.createCriteria(ProductSettings.class)
				.add(Restrictions.eq("propertyName", propertyName)).list();
		return list.get(0);
	}

}
