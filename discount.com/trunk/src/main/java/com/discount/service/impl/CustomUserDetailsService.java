package com.discount.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.discount.dao.UserDAO;
import com.discount.domain.User;
import com.discount.utils.UserAuthorityUtils;

@Component
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		User user = userDAO.findByLogin(username);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username/password.");
		}
		return new CustomUserDetails(user);
	}

	private final class CustomUserDetails extends User implements UserDetails {

		private static final long serialVersionUID = 1L;

		CustomUserDetails(User user) {
			setId(user.getId());
			setEmail(user.getEmail());
			setFirstName(user.getFirstName());
			setLastName(user.getLastName());
			setPassword(user.getPassword());
			setLogin(user.getLogin());
			setPhoneNumber(user.getPhoneNumber());
			setRoles(user.getRoles());
		}

		public Collection<? extends GrantedAuthority> getAuthorities() {
			return UserAuthorityUtils.createAuthorities(this);
		}

		public String getUsername() {
			return getEmail();
		}

		public boolean isAccountNonExpired() {
			return true;
		}

		public boolean isAccountNonLocked() {
			return true;
		}

		public boolean isCredentialsNonExpired() {
			return true;
		}

		public boolean isEnabled() {
			return true;
		}
	}
}
