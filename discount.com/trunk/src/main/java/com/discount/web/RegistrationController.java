package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.User;
import com.discount.domain.UserRole;
import com.discount.service.UserContext;
import com.discount.service.UserRoleService;
import com.discount.service.UserService;

@Controller
@RequestMapping(UrlConstants.REGISTRATION)
public class RegistrationController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserRoleService roleService;
	@Autowired
	private UserContext userContext;

	@RequestMapping(value = UrlConstants.REGISTRATION, method = RequestMethod.GET)
	public String registration(Map<String, Object> map) {
		putRootCategories(map);

		map.put("user", new User());

		return "registration";
	}

	@RequestMapping(value = UrlConstants.SAVE_USER, method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user) {

		userService.save(user);
		userContext.setCurrentUser(user);
		return "redirect:/";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.registerCustomEditor(List.class, "roles",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						UserRole role = roleService.findById(Integer
								.valueOf(text));
						List<UserRole> roles = new ArrayList<UserRole>();
						roles.add(role);
						setValue(roles);
					}
				});
	}
}
