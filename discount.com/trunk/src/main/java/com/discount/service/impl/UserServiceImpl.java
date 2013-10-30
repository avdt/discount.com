package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Service;

import com.discount.dao.UserDAO;
import com.discount.domain.User;
import com.discount.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	@Autowired
	private UserDetailsManager userDetailsManager;

	@Override
	public void save(User user) {
		List<GrantedAuthority> authorities = AuthorityUtils
				.createAuthorityList("ROLE_USER");
		UserDetails userDetails = new org.springframework.security.core.userdetails.User(
				user.getLogin(), user.getPassword(), authorities);
		userDetailsManager.createUser(userDetails);

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
