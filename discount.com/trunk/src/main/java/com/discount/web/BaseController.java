package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.ProductCategory;
import com.discount.domain.SearchResults;
import com.discount.service.ProductCategoryService;

@Controller
public class BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	public void putRootCategories(Map<String, Object> map) {
		List<ProductCategory> rootCategoryList = categoryService
				.findRootCategories();
		map.put("rootCategoryList", rootCategoryList);
		map.put("searchResults", new SearchResults());
	}
}
