package com.discount.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(UrlConstants.INDEX)
public class HomeController {

	@RequestMapping(value = UrlConstants.INDEX, method = RequestMethod.GET)
	public String home() {

		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2() {

		return "index";
	}

}
