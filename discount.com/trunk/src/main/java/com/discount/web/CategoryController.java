package com.discount.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.CATEGORIES)
public class CategoryController {

	@Autowired
	private ProductCategoryService categoryService;

}
