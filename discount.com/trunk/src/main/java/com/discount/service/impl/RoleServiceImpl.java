package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.UserRoleDAO;
import com.discount.domain.UserRole;
import com.discount.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private UserRoleDAO roleDAO;

	@Override
	public void save(UserRole object) {
		roleDAO.save(object);
	}

	@Override
	public void update(UserRole object) {
		roleDAO.update(object);
	}

	@Override
	public void delete(UserRole object) {
		roleDAO.delete(object);
	}

	@Override
	public UserRole findById(Integer id) {
		return roleDAO.findById(id);
	}

	@Override
	public List<UserRole> findAll() {
		return roleDAO.findAll();
	}

}
