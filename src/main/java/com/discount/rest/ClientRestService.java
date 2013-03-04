package com.discount.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Client;
import com.discount.service.ClientService;

@Controller
@Path(RestUrls.CLIENT_URL)
public class ClientRestService {

	@Autowired
	private ClientService clientService;

	@GET
	@Path("get/{id}")
	@Produces("application/json")
	public Client getClient(@PathParam("id") Integer id) {

		Client client = clientService.findById(id);
		return client;

	}

	@GET
	@Produces({/* MediaType.APPLICATION_XML, */MediaType.APPLICATION_JSON })
	@Path("all")
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
