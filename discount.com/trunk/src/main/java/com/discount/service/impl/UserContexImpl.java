package com.discount.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.discount.domain.User;
import com.discount.service.UserContext;
import com.discount.service.UserService;
import com.discount.utils.UserAuthorityUtils;

@Component
public class UserContexImpl implements UserContext {

	@Autowired
	private UserService userService;

	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	public User getCurrentUser() {
		User user;

		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		if (authentication == null) {
			user = null;
		} else {
			user = (User) authentication.getPrincipal();
		}
		return user;
	}

	@Override
	public void setCurrentUser(User user) {
		Collection<GrantedAuthority> authorities = UserAuthorityUtils
				.createAuthorities(user);
		Authentication authentication = new UsernamePasswordAuthenticationToken(
				user, user.getPassword(), authorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

}
