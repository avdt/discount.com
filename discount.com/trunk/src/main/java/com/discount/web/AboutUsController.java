package com.discount.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(UrlConstants.ABOUT)
public class AboutUsController {

	@RequestMapping(UrlConstants.ABOUT)
	public String getInfoAboutUs() {

		return "about";
	}

}
