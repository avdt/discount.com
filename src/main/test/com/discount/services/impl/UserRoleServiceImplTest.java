package com.discount.services.impl;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.discount.model.UserRole;
import com.discount.services.UserRoleService;

public class UserRoleServiceImplTest {
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"spring/config/BeanLocations.xml");

	@Test
	public void testSaveAndFind() {
		UserRoleService userRoleService = (UserRoleService) appContext
				.getBean("userRoleService");
		UserRole expectedUserRole = getUserRole();
		userRoleService.save(expectedUserRole);

		UserRole actualUserRole = userRoleService.findByRole(expectedUserRole
				.getRole());

		Assert.assertEquals(expectedUserRole, actualUserRole);

		userRoleService.delete(expectedUserRole);
	}

	@Test
	public void testUpdate() {
		UserRoleService userRoleService = (UserRoleService) appContext
				.getBean("userRoleService");
		UserRole expectedUserRole = getUserRole();
		userRoleService.save(expectedUserRole);

		UserRole actualUserRole = userRoleService.findByRole(expectedUserRole
				.getRole());

		actualUserRole.setRole("Updated role");

		userRoleService.update(actualUserRole);
		UserRole updatedUserRole = userRoleService.findByRole(actualUserRole
				.getRole());

		Assert.assertEquals(actualUserRole, updatedUserRole);

		userRoleService.delete(expectedUserRole);
	}

	private UserRole getUserRole() {
		UserRole userRole = new UserRole();

		userRole.setRole("Megapihar");

		return userRole;
	}

}
