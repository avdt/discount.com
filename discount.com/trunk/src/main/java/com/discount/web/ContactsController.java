package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.discount.domain.ProductCategory;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.CONTACTS)
public class ContactsController {

	@Autowired
	private ProductCategoryService categoryService;

	@RequestMapping(UrlConstants.CONTACTS)
	public String getContacts(Map<String, Object> map) {
		List<ProductCategory> categories = categoryService.findAll();
		map.put("categories", categories);

		return "contacts";
	}

}
