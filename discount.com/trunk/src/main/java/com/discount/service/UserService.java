package com.discount.service;

import org.hibernate.exception.ConstraintViolationException;

import com.discount.domain.User;

public interface UserService extends GenericService<User> {

	User findByEmail(String email);

	User findByLogin(String login);

}
