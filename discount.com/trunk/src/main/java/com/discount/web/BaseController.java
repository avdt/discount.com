package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.discount.domain.ProductCategory;
import com.discount.domain.SearchResults;
import com.discount.domain.StaticPage;
import com.discount.service.ProductCategoryService;
import com.discount.service.StaticPageService;

@Controller
@SessionAttributes({ "rootCategoryList", "childCategories", "searchResults",
		"searchResults", "topMenuStaticPages", "bottomMenuStaticPages" })
public class BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private StaticPageService staticPageService;

	public void putRootCategories(Map<String, Object> map) {
		Object rootCategories = map.get("rootCategoryList");
		if (rootCategories == null) {
			putSessionVariables(map);
		}
	}

	private void putSessionVariables(Map<String, Object> map) {
		List<ProductCategory> rootCategoryList = categoryService
				.findRootCategories();

		List<ProductCategory> childCategories = categoryService
				.findChildCategories();
		List<StaticPage> topMenuPages = staticPageService
				.findTopMenuNotReservedPages();
		List<StaticPage> bottomMenuPages = staticPageService
				.findBottomMenuNotReservedPages();

		map.put("rootCategoryList", rootCategoryList);
		map.put("childCategories", childCategories);
		map.put("searchResults", new SearchResults());
		map.put("topMenuStaticPages", topMenuPages);
		map.put("bottomMenuStaticPages", bottomMenuPages);
	}
}
