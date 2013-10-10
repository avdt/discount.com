package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.alfero.dao.UserRoleDAO;
import com.discount.domain.UserRole;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(UserRole object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	@Transactional
	public void update(UserRole object) {
		sessionFactory.getCurrentSession().update(object);
	}

	@Override
	@Transactional
	public void delete(UserRole object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public UserRole findById(Integer id) {
		return (UserRole) sessionFactory.getCurrentSession().get(
				UserRole.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<UserRole> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from UserRole")
				.list();
	}

	@Override
	@Transactional
	public UserRole findByRole(String role) {
		// List<UserRole> list = getHibernateTemplate().find(
		// "from UserRole where role=?", role);
		// return list.get(0);

		// TODO: body
		return null;
	}

}
