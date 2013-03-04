package com.discount.services.impl;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.discount.domain.UserRole;
import com.discount.service.UserRoleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/resources/root-context.xml" })
public class UserRoleServiceImplTest {

	@Autowired
	private UserRoleService userRoleService;

	@Test
	public void testSaveAndFind() {
		UserRole expectedUserRole = getUserRole();
		userRoleService.save(expectedUserRole);

		UserRole actualUserRole = userRoleService.findByRole(expectedUserRole
				.getRole());

		Assert.assertEquals(expectedUserRole, actualUserRole);

		userRoleService.delete(expectedUserRole);
	}

	@Test
	public void testUpdate() {
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
