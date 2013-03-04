package com.discount.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Client;
import com.discount.service.ClientService;

@Controller
@Path("/rest/client")
public class ClientRestService {

	@Autowired
	private ClientService clientService;

	@GET
	@Path("get")
	@Produces("application/json")
	public Client getClient() {

		Client client = clientService.findByName("init client");
		return client;

	}

	@GET
	@Produces({/* MediaType.APPLICATION_XML, */MediaType.APPLICATION_JSON })
	@Path("datas")
	public List<Client> getAll() {
		return clientService.findAll();
	}

	@POST
	@Path("/post")
	@Consumes("application/json")
	public Response createClientInJSON(Client client) {

		String result = "Product created : " + client;
		return Response.status(201).entity(result).build();

	}

}
