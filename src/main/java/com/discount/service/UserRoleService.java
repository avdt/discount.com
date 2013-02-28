package com.discount.service;

import com.discount.domain.UserRole;

public interface UserRoleService extends GenericService<UserRole> {
	UserRole findByRole(String role);
}
