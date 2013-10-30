package com.discount.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.discount.domain.User;
import com.discount.service.UserContext;
import com.discount.service.UserService;

@Component
public class UserContexImpl implements UserContext {

	@Autowired
	private UserService userService;

	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	public User getCurrentUser() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		if (authentication == null) {
			return null;
		}
		String login = authentication.getName();
		return userService.findByLogin(login);
	}

	@Override
	public void setCurrentUser(User user) {
		if (user == null) {
			throw new IllegalArgumentException("user cannot be null");
		}
		UserDetails userDetails = userDetailsService.loadUserByUsername(user
				.getLogin());
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
				userDetails, user.getPassword(), userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

}
