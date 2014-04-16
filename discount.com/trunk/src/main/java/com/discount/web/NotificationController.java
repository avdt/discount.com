package com.discount.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Notification;
import com.discount.domain.NotificationType;
import com.discount.service.NotificationService;

@Controller
public class NotificationController extends BaseController {

	@Autowired
	private NotificationService notificationService;

	@RequestMapping(value = UrlConstants.EDIT_NOTIFICATIONS, method = RequestMethod.GET)
	public String editStaticPage(Map<String, Object> map,
			@PathVariable("notificationType") NotificationType notificationType) {
		putRootCategories(map);

		Notification notification = notificationService
				.findByType(notificationType);
		map.put("notification", notification);

		return "admin/edit/edit-notification";
	}

}
