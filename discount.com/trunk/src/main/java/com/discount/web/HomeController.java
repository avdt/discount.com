package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.ProductCategory;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.INDEX)
public class HomeController {

	@Autowired
	private ProductCategoryService categoryService;

	@RequestMapping(value = UrlConstants.INDEX, method = RequestMethod.GET)
	public String home(Map<String, Object> map) {

		List<ProductCategory> categories = categoryService.findAll();
		map.put("categories", categories);
		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2() {

		return "index";
	}

}
