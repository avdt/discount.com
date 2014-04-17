package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Notification;
import com.discount.domain.NotificationType;
import com.discount.domain.User;
import com.discount.service.NotificationService;
import com.discount.service.UserService;

@Controller
public class NotificationController extends BaseController {

	@Autowired
	private NotificationService notificationService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = UrlConstants.EDIT_NOTIFICATIONS, method = RequestMethod.GET)
	public String editStaticPage(Map<String, Object> map,
			@PathVariable("notificationType") NotificationType notificationType) {
		putRootCategories(map);

		Notification notification = notificationService
				.findByType(notificationType);
		List<User> adminUsers = userService.findAdmins();
		List<User> allUsers = userService.findAll();
		map.put("notification", notification);
		map.put("adminUsers", adminUsers);
		map.put("allUsers", allUsers);

		return "admin/edit/edit-notification";
	}

	@RequestMapping(value = UrlConstants.UPDATE_NOTIFICATION, method = RequestMethod.POST)
	public String updateCategory(
			@ModelAttribute("notification") Notification notification,
			Map<String, Object> map) {

		final String path;
		putRootCategories(map);

		notificationService.update(notification);
		path = "redirect:/admin/notifications";

		return path;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.registerCustomEditor(Set.class, "users",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						List<String> logins = Arrays.asList(text.split(","));
						Set<User> users = new HashSet<User>();
						for (String login : logins) {
							User user = userService.findByLogin(login);
							users.add(user);
						}
						setValue(users);
					}
				});
	}
}
