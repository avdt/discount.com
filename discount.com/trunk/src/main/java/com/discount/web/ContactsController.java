package com.discount.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(UrlConstants.CONTACTS)
public class ContactsController {

	@RequestMapping(UrlConstants.CONTACTS)
	public String getContacts() {

		return "contacts";
	}

}
