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
@Path(RestUrls.VALIDATOR)
public class DuplicateUserValidatorRestService {

	@Autowired
	private UserService userService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("/{login}")
	public boolean isValidLogin(@PathParam("login") String login) {
		boolean result = true;
		List<User> users = userService.findAll();

		for (User user : users) {
			if (user.getLogin().equals(login)) {
				result = false;
			}
		}

		return result;
	}

}
