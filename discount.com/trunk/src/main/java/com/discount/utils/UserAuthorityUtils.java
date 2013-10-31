package com.discount.utils;

import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import com.discount.domain.User;
import com.discount.domain.UserRole;

public class UserAuthorityUtils {
	private static final List<GrantedAuthority> ADMIN_ROLES = AuthorityUtils
			.createAuthorityList("ROLE_ADMIN", "ROLE_USER");
	private static final List<GrantedAuthority> USER_ROLES = AuthorityUtils
			.createAuthorityList("ROLE_USER");

	public static Collection<GrantedAuthority> createAuthorities(User user) {
		List<GrantedAuthority> result = null;

		List<UserRole> roles = user.getRoles();

		for (UserRole userRole : roles) {
			if (StringUtils.containsIgnoreCase(userRole.getRole(), "admin")) {
				result = ADMIN_ROLES;
				break;
			} else {
				result = USER_ROLES;
			}
		}
		return result;
	}

	private UserAuthorityUtils() {
	}
}
