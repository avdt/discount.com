package com.discount.service;

import com.discount.domain.Client;

public interface ClientService extends GenericService<Client> {
	Client findByName(String client);
}
