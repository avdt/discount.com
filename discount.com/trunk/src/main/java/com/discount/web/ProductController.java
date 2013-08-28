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
import com.discount.service.ProductService;

@Controller
@RequestMapping(UrlConstants.PRODUCTS)
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(UrlConstants.PRODUCTS)
	public String getProducts(Map<String, Object> map) {

		map.put("products", productService.findAll());

		return "products";
	}

	@RequestMapping(value = UrlConstants.ADD, method = RequestMethod.GET)
	public String addClient(@ModelAttribute("product") Product product,
			BindingResult result) {

		return "add-product";
	}

	@RequestMapping(value = UrlConstants.ADD, method = RequestMethod.POST)
	public String saveClient(@ModelAttribute("product") Product product,
			BindingResult result) {

		productService.save(product);

		return "redirect:/products";
	}

	@RequestMapping(UrlConstants.DELETE_PRODUCT)
	public String deleteClient(@PathVariable("productId") Integer productId) {

		productService.delete(productService.findById(productId));

		return "redirect:/products";
	}

}
