package com.discount.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.discount.domain.User;
import com.discount.domain.UserRole;
import com.discount.service.UserRoleService;
import com.discount.service.UserService;

public class UserServiceImplTest {
	private ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"spring/config/BeanLocations.xml");

	@Test
	public void testSaveAndFind() {
		UserService userService = (UserService) appContext
				.getBean("userService");

		User user = getUser();

		userService.save(user);
		User userByEmail = userService.findByEmail(user.getEmail());

		Assert.assertEquals(user, userByEmail);

		List<UserRole> roles = userByEmail.getRoles();
		for (UserRole userRole : roles) {
			System.out.println(userRole.getRole());
		}

		User userByLogin = userService.findByLogin(user.getLogin());
		Assert.assertEquals(user, userByLogin);

		userService.delete(user);

	}

	@Test
	public void testUpdate() {
		UserService userService = (UserService) appContext
				.getBean("userService");

		User user = getUser();
		userService.save(user);
		User userByEmail = userService.findByEmail(user.getEmail());
		userByEmail.setEmail("Updated email");
		userService.update(userByEmail);
		User updatedUser = userService.findByLogin(user.getLogin());

		Assert.assertEquals(userByEmail, updatedUser);

		userService.delete(updatedUser);
	}

	private User getUser() {
		User user = new User();

		UserRoleService userRoleService = (UserRoleService) appContext
				.getBean("userRoleService");

		UserRole userRole = userRoleService.findById(new Integer(2));
		List<UserRole> userRoles = new ArrayList<UserRole>();
		userRoles.add(userRole);
		user.setEmail("test-email@example.com");
		user.setFirstName("Sem");
		user.setLastName("Smith");
		user.setLogin("ssmith");
		user.setPassword("password");
		user.setRoles(userRoles);

		return user;
	}

}
