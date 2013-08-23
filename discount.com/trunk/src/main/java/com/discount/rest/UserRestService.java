package com.discount.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.User;
import com.discount.service.UserService;

@Controller
@Path(RestUrls.USER_URL)
public class UserRestService {

	@Autowired
	private UserService userService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("all")
	public List<User> getAll() {
		return userService.findAll();
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public User get(@PathParam("id") Integer id) {
		return userService.findById(id);
	}

}
