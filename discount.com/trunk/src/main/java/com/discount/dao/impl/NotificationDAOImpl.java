package com.discount.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.NotificationDAO;
import com.discount.domain.Notification;
import com.discount.domain.NotificationType;

@Repository
public class NotificationDAOImpl implements NotificationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(Notification object) {
		sessionFactory.getCurrentSession().save(object);
	}

	@Override
	@Transactional
	public void update(Notification object) {
		sessionFactory.getCurrentSession().update(object);
	}

	@Override
	@Transactional
	public void delete(Notification object) {
		sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	@Transactional
	public Notification findById(Integer id) {
		return (Notification) sessionFactory.getCurrentSession().get(
				Notification.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Notification> findAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Notification").list();
	}

	@Override
	@Transactional
	public Notification findByType(NotificationType type) {
		return (Notification) sessionFactory.getCurrentSession()
				.createQuery("from Notification n  where n.type= :type")
				.setParameter("type", type).list().get(0);

	}

}
