package com.discount.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/plumbing")
public class PlumbingController {

	@RequestMapping("/plumbing")
	public String getPlumbing() {

		return "plumbing";
	}

}
