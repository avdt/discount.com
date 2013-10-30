package com.discount.service;

import com.discount.domain.User;

public interface UserContext {
	User getCurrentUser();

	void setCurrentUser(User user);
}
