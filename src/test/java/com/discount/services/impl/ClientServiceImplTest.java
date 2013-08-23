package com.discount.services.impl;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.discount.domain.Client;
import com.discount.service.ClientService;

public class ClientServiceImplTest {
	
	@Autowired
	ClientService clientService;

	@Test
	public void testSave() {

		Client expectedClient = getClient();

		clientService.save(expectedClient);

		Client actualClient = clientService
				.findByName(expectedClient.getName());

		Assert.assertEquals(expectedClient, actualClient);

		clientService.delete(expectedClient);

	}

	@Test
	public void testUpdate() {
		String NAME_TO_UPDATE = "Updated name";

		Client expectedClient = getClient();
		clientService.save(expectedClient);

		Client actualClient = clientService
				.findByName(expectedClient.getName());

		actualClient.setName(NAME_TO_UPDATE);
		clientService.update(actualClient);

		Client updatedClient = clientService.findById(actualClient.getId());

		Assert.assertEquals(actualClient, updatedClient);

		clientService.delete(expectedClient);
	}

	private Client getClient() {
		Client client = new Client();

		client.setName("Rozetka");
		client.setType("golden");

		return client;
	}

}
