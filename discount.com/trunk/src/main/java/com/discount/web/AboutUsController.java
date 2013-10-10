package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.discount.domain.ProductCategory;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.ABOUT)
public class AboutUsController extends BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	@RequestMapping(UrlConstants.ABOUT)
	public String getInfoAboutUs(Map<String, Object> map) {
		putRootCategories(map);

		List<ProductCategory> categories = categoryService.findRootCategories();
		map.put("rootCategoryList", categories);

		return "about";
	}

}
