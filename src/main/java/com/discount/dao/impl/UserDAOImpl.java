package com.discount.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.discount.dao.UserDAO;
import com.discount.domain.User;

@Repository
public class UserDAOImpl  implements UserDAO {

	@Override
	public void save(User user) {
		getHibernateTemplate().save(user);
	}

	@Override
	public void update(User user) {
		getHibernateTemplate().update(user);
	}

	@Override
	public void delete(User user) {
		getHibernateTemplate().delete(user);
	}

	@Override
	public User findById(Integer id) {
		List<User> list = getHibernateTemplate().find("from User where id=?",
				id);
		return list.get(0);
	}

	@Override
	public User findByEmail(String email) {
		List<User> list = getHibernateTemplate().find(
				"from User where email=?", email);
		return list.get(0);
	}

	@Override
	public User findByLogin(String login) {
		List<User> list = getHibernateTemplate().find(
				"from User where login=?", login);
		return list.get(0);
	}

	@Override
	public List<User> findAll() {
		List<User> list = getHibernateTemplate().find("from User");
		return list;
	}

}
