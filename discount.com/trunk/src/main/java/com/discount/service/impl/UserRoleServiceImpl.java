package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.UserRoleDAO;
import com.discount.domain.UserRole;
import com.discount.service.UserRoleService;

@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	private UserRoleDAO userRoleDAO;

	@Override
	public void save(UserRole object) {
		this.userRoleDAO.save(object);
	}

	@Override
	public void update(UserRole object) {
		this.userRoleDAO.update(object);
	}

	@Override
	public void delete(UserRole object) {
		this.userRoleDAO.delete(object);
	}

	@Override
	public UserRole findById(Integer id) {
		return this.userRoleDAO.findById(id);
	}

	@Override
	public List<UserRole> findAll() {
		return this.userRoleDAO.findAll();
	}

	@Override
	public UserRole findByRole(String role) {
		return this.userRoleDAO.findByRole(role);
	}

	public UserRoleDAO getUserRoleDAO() {
		return userRoleDAO;
	}

	public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}

}
