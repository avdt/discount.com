package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.UserDAO;
import com.discount.domain.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	@Transactional
	public void update(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	@Transactional
	public void delete(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	@Transactional
	public User findById(Integer id) {
		return (User) sessionFactory.getCurrentSession().get(User.class, id);
	}

	@Override
	@Transactional
	public User findByEmail(String email) {
		// List<User> list = getHibernateTemplate().find(
		// "from User where email=?", email);
		// return list.get(0);

		// TODO: body

		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public User findByLogin(String login) {
		User user = null;

		List<User> users = sessionFactory.getCurrentSession()
				.createQuery("from User u where u.login = :login")
				.setString("login", login).list();
		if (!users.isEmpty()) {
			user = (User) users.get(0);
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from User")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> findAdmins() {
		List<User> users = (List<User>) sessionFactory.getCurrentSession()
				.createQuery("from User u inner join u.roles r where r.id=1")
				.list();
		return users;

	}

}
