package com.discount.rest;

import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;

@Controller
@Path(RestUrls.CART_URL)
public class CartRestService {

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public void get(@PathParam("id") Integer id) {

	}

}
