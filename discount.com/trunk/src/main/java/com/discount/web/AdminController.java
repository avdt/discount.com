package com.discount.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Product;
import com.discount.domain.ProductCategory;
import com.discount.domain.User;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.ADMIN)
public class AdminController {

	@Autowired
	private ProductCategoryService categoryService;

	@RequestMapping(UrlConstants.ADMIN)
	public String getTools(Map<String, Object> map) {
		map.put("category", new ProductCategory());
		map.put("user", new User());
		map.put("product", new Product());

		map.put("categories", categoryService.findAll());

		return "admin";
	}

	@RequestMapping(value = UrlConstants.ADD_CATEGORY, method = RequestMethod.POST)
	public String createCategory(
			@ModelAttribute("category") ProductCategory category,
			BindingResult result) {

		categoryService.save(category);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_CATEGORY)
	public String deleteClient(@PathVariable("categoryId") Integer categoryId) {

		categoryService.delete(categoryService.findById(categoryId));

		return "redirect:/admin";
	}
}
