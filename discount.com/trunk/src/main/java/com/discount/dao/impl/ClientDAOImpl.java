package com.discount.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.discount.dao.ClientDAO;
import com.discount.domain.Client;

@Repository
public class ClientDAOImpl implements ClientDAO {
	private static final Logger logger = Logger.getLogger(ClientDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(Client client) {
		sessionFactory.getCurrentSession().save(client);
		logger.info("New client created: " + client.getName());
	}

	@Override
	@Transactional
	public void update(Client client) {
		sessionFactory.getCurrentSession().update(client);
		logger.debug("Client " + client.getName() + " updated.");
	}

	@Override
	@Transactional
	public void delete(Client client) {
		sessionFactory.getCurrentSession().delete(client);
		logger.info("Client " + client.getName() + " deleted.");
	}

	@Override
	@Transactional
	public Client findByName(String name) {

		// TODO: it seems to me it doesn work.
		return (Client) sessionFactory.getCurrentSession().get(Client.class,
				name);
	}

	@Override
	@Transactional
	public Client findById(Integer id) {
		return (Client) sessionFactory.getCurrentSession()
				.get(Client.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Client> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Client")
				.list();
	}

}
