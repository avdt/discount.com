package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alfero.dao.UserDAO;
import com.discount.domain.User;
import com.discount.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public void save(User user) {
		this.userDAO.save(user);
	}

	@Override
	public void update(User user) {
		this.userDAO.update(user);
	}

	@Override
	public void delete(User user) {
		this.userDAO.delete(user);
	}

	@Override
	public User findByEmail(String email) {
		return this.userDAO.findByEmail(email);
	}

	@Override
	public User findByLogin(String login) {
		return this.userDAO.findByLogin(login);
	}

	@Override
	public User findById(Integer id) {
		return this.userDAO.findById(id);
	}

	@Override
	public List<User> findAll() {
		return this.userDAO.findAll();
	}

}
