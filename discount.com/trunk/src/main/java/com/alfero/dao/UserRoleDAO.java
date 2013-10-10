package com.alfero.dao;

import com.discount.domain.UserRole;

public interface UserRoleDAO extends GenericDAO<UserRole> {
	UserRole findByRole(String role);
}
