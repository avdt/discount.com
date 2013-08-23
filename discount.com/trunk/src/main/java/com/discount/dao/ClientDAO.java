package com.discount.dao;

import com.discount.domain.Client;

public interface ClientDAO extends GenericDAO<Client> {

	Client findByName(String name);
}
