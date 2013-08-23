package com.discount.dao;

import com.discount.domain.User;

public interface UserDAO extends GenericDAO<User> {

	User findByEmail(String email);

	User findByLogin(String login);
}
