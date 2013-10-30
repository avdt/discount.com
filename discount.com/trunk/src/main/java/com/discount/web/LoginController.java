package com.discount.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends BaseController {

	@RequestMapping(value = UrlConstants.LOGIN, method = RequestMethod.GET)
	public String login(ModelMap model) {
		putRootCategories(model);
		return "login";

	}

	@RequestMapping(value = UrlConstants.LOGIN_FAILED, method = RequestMethod.GET)
	public String loginerror(ModelMap model) {

		putRootCategories(model);
		model.addAttribute("error", "true");
		return "login";

	}

	@RequestMapping(value = UrlConstants.LOGOUT, method = RequestMethod.GET)
	public String logout(ModelMap model) {

		putRootCategories(model);
		return "login";

	}

}
