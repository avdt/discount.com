package com.discount.dao;

import java.util.List;

import com.discount.domain.User;

public interface UserDAO extends GenericDAO<User> {

	User findByEmail(String email);

	User findByLogin(String login);

	List<User> findAdmins();
}
