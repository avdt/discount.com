package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.discount.domain.Product;
import com.discount.service.ProductCategoryService;
import com.discount.service.ProductService;

@Controller
@RequestMapping(UrlConstants.SALE)
public class SaleController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping(UrlConstants.SALE)
	public String getInfoAboutUs(Map<String, Object> map) {
		map.put("categories", categoryService.findAll());

		List<Product> saleProducts = productService.findSale();
		map.put("saleProducts", saleProducts);

		return "sale";
	}

}
