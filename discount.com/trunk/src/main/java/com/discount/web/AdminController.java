package com.discount.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.discount.service.ProductService;

@Controller
@RequestMapping(UrlConstants.ADMIN)
public class AdminController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private FileUploadService fileUploadService;

	@RequestMapping(UrlConstants.ADMIN)
	public String getTools(Map<String, Object> map) {
		map.put("category", new ProductCategory());
		map.put("user", new User());
		map.put("product", new Product());

		List<ProductCategory> categories = categoryService.findAll();
		map.put("categories", categories);
		map.put("products", productService.findAll());

		return "admin";
	}

	@RequestMapping(value = UrlConstants.NEW_CATEGORY, method = RequestMethod.GET)
	public String newCategory(
			@PathVariable("parentCategoryId") Integer parentCategoryId,
			Map<String, Object> map) throws IllegalStateException, IOException {
		ProductCategory category = categoryService.findById(parentCategoryId);

		map.put("parentCategory", category);
		map.put("category", new ProductCategory());

		return "new-category";
	}

	@RequestMapping(value = UrlConstants.ADD_CATEGORY, method = RequestMethod.POST)
	public String saveCategory(
			@ModelAttribute("category") ProductCategory category,
			@PathVariable("parentCategoryId") Integer parentCategoryId)
			throws IllegalStateException, IOException {

		MultipartFile file = category.getFile();

		ProductCategory parentCategory = categoryService
				.findById(parentCategoryId);
		category.setParentCategory(parentCategory);
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

	@RequestMapping(UrlConstants.EDIT_PRODUCT)
	public String editCategory(@PathVariable("categoryId") Integer categoryId,
			Map<String, Object> map) {
		ProductCategory category = categoryService.findById(categoryId);
		map.put("category", category);

		return "edit-category";
	}

	@RequestMapping(value = UrlConstants.UPDATE_PRODUCT, method = RequestMethod.POST)
	public String updateCategory(
			@PathVariable("categoryId") Integer categoryId,
			@ModelAttribute("product") Product product)
			throws IllegalStateException, IOException {

		MultipartFile file = product.getFile();

		if (null != file) {
			String filePath = fileUploadService.save(file);
			product.setImage(filePath);
		}

		ProductCategory category = categoryService.findById(categoryId);
		category.setId(null);
		product.setCategory(category);

		productService.save(product);

		return "redirect:/admin";
	}

	@RequestMapping(value = UrlConstants.NEW_PRODUCT, method = RequestMethod.GET)
	public String newProduct(@PathVariable("categoryId") Integer categoryId,
			Map<String, Object> map) throws IllegalStateException, IOException {
		ProductCategory category = categoryService.findById(categoryId);

		map.put("selectedCategory", category);
		map.put("product", new Product());

		return "new-product";
	}

	@RequestMapping(value = UrlConstants.ADD_PRODUCT, method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute("product") Product product,
			@PathVariable("categoryId") Integer categoryId)
			throws IllegalStateException, IOException {

		MultipartFile file = product.getFile();

		if (null != file) {
			String filePath = fileUploadService.save(file);
			product.setImage(filePath);
		}

		ProductCategory category = categoryService.findById(categoryId);
		product.setCategory(category);

		productService.save(product);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_PRODUCT)
	public String deleteProduct(@PathVariable("productId") Integer productId) {

		productService.delete(productService.findById(productId));

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.EDIT_PRODUCT)
	public String editProduct(@PathVariable("productId") Integer productId,
			Map<String, Object> map) {
		Product product = productService.findById(productId);
		map.put("product", product);

		return "edit-product";
	}

	@RequestMapping(value = UrlConstants.UPDATE_PRODUCT, method = RequestMethod.POST)
	public String updateProduct(@PathVariable("categoryId") Integer categoryId,
			@ModelAttribute("product") Product product)
			throws IllegalStateException, IOException {

		MultipartFile file = product.getFile();

		if (null != file) {
			String filePath = fileUploadService.save(file);
			product.setImage(filePath);
		}

		ProductCategory category = categoryService.findById(categoryId);
		category.setId(null);
		product.setCategory(category);

		productService.save(product);

		return "redirect:/admin";
	}

}
