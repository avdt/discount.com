package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.ProductCategory;
import com.discount.domain.SearchResults;
import com.discount.domain.StaticPage;
import com.discount.service.ProductCategoryService;
import com.discount.service.StaticPageService;

@Controller
public class BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private StaticPageService staticPageService;

	public void putRootCategories(Map<String, Object> map) {
		List<ProductCategory> rootCategoryList = categoryService
				.findRootCategories();
		
		List<ProductCategory> childCategories = categoryService.findChildCategories();
		map.put("rootCategoryList", rootCategoryList);
		map.put("childCategories", childCategories);
		map.put("searchResults", new SearchResults());

		List<StaticPage> topMenuPages = staticPageService
				.findTopMenuNotReservedPages();
		map.put("topMenuStaticPages", topMenuPages);

		List<StaticPage> bottomMenuPages = staticPageService
				.findBottomMenuNotReservedPages();
		map.put("bottomMenuStaticPages", bottomMenuPages);

	}
}
