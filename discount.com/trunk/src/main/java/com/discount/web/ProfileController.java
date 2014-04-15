package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.User;
import com.discount.domain.UserRole;
import com.discount.service.RoleService;
import com.discount.service.UserService;

@Controller
@RequestMapping(UrlConstants.PROFILE)
public class ProfileController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(UrlConstants.GET_PROFILE)
	public String getProfile(@PathVariable("login") String login,
			Map<String, Object> map) {
		putRootCategories(map);

		User user = userService.findByLogin(login);
		map.put("user", user);

		return "profile";
	}

	@RequestMapping(UrlConstants.EDIT_PROFILE)
	public String editProfile(@PathVariable("login") String login,
			Map<String, Object> map) {
		putRootCategories(map);

		User user = userService.findByLogin(login);
		List<UserRole> roles = roleService.findAll();
		map.put("user", user);
		map.put("roles", roles);

		return "edit-profile";
	}

	@RequestMapping(value = UrlConstants.UPDATE_PROFILE, method = RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("user") User user,
			BindingResult result, Map<String, Object> map) {

		final String path;
		List<UserRole> roles = roleService.findAll();
		map.put("roles", roles);

		if (result.hasErrors()) {
			path = "edit-profile";
		} else {
			userService.update(user);
			path = "redirect:/profile/" + user.getLogin();
		}

		return path;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.registerCustomEditor(List.class, "roles",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						List<String> roleIds = Arrays.asList(text.split(","));
						List<UserRole> roles = new ArrayList<UserRole>();
						for (String roleId : roleIds) {
							UserRole role = roleService.findById(Integer
									.valueOf(roleId));
							roles.add(role);
						}
						setValue(roles);
					}
				});
	}
}
