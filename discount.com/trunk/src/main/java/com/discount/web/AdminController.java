package com.discount.web;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.discount.domain.Product;
import com.discount.domain.ProductCategory;
import com.discount.domain.User;
import com.discount.service.FileUploadService;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.ADMIN)
public class AdminController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private FileUploadService fileUploadService;

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
			@ModelAttribute("category") ProductCategory category, Model map)
			throws IllegalStateException, IOException {

		MultipartFile file = category.getFile();

		if (null != file) {
			String filePath = fileUploadService.save(file);
			category.setImage(filePath);
		}

		categoryService.save(category);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_CATEGORY)
	public String deleteCategory(@PathVariable("categoryId") Integer categoryId) {

		categoryService.delete(categoryService.findById(categoryId));

		return "redirect:/admin";
	}
}
