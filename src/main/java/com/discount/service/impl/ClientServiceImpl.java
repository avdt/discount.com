package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.ClientDAO;
import com.discount.domain.Client;
import com.discount.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientDAO clientDAO;

	@Override
	public void save(Client client) {
		this.clientDAO.save(client);
	}

	@Override
	public void update(Client client) {
		this.clientDAO.update(client);
	}

	@Override
	public void delete(Client client) {
		this.clientDAO.delete(client);
	}

	@Override
	public Client findByName(String name) {
		return this.clientDAO.findByName(name);
	}

	public ClientDAO getClientService() {
		return clientDAO;
	}

	public void setClientService(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	@Override
	public Client findById(Integer id) {
		return this.clientDAO.findById(id);
	}

	@Override
	public List<Client> findAll() {
		return this.clientDAO.findAll();
	}

}
