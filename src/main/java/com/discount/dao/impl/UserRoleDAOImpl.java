package com.discount.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.discount.dao.UserRoleDAO;
import com.discount.domain.UserRole;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO {

	@Override
	public void save(UserRole object) {
		getHibernateTemplate().save(object);
	}

	@Override
	public void update(UserRole object) {
		getHibernateTemplate().update(object);
	}

	@Override
	public void delete(UserRole object) {
		getHibernateTemplate().delete(object);
	}

	@Override
	public UserRole findById(Integer id) {
		List<UserRole> list = getHibernateTemplate().find(
				"from UserRole where id=?", id);
		return list.get(0);
	}

	@Override
	public List<UserRole> findAll() {
		List<UserRole> list = getHibernateTemplate().find("from UserRole");
		return list;
	}

	@Override
	public UserRole findByRole(String role) {
		List<UserRole> list = getHibernateTemplate().find(
				"from UserRole where role=?", role);
		return list.get(0);
	}

}
