package com.discount.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.discount.domain.Cart;
import com.discount.service.UserContext;

@Controller
public class DefaultController {

	@Autowired
	private UserContext userContext;

	@RequestMapping(UrlConstants.DEFAULT)
	public String defaultAfterLogin(HttpServletRequest request) {
		if (request.isUserInRole("ROLE_ADMIN")) {
			return "redirect:" + UrlConstants.ADMIN;
		}
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart != null) {
			cart.setUser(userContext.getCurrentUser());
		}
		return "redirect:/";
	}
}
