package com.discount.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.UserRole;
import com.discount.service.UserRoleService;

@Controller
@Path(RestUrls.USER_ROLE_URL)
public class UserRoleRestService {

	@Autowired
	private UserRoleService userRoleService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("all")
	public List<UserRole> getAll() {
		return userRoleService.findAll();
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public UserRole get(@PathParam("id") Integer id) {
		return userRoleService.findById(id);
	}

}
