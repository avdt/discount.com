package com.discount.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.ProductCategory;
import com.discount.service.ProducerService;
import com.discount.service.ProductCategoryService;

@Controller
@RequestMapping(UrlConstants.INDEX)
public class HomeController extends BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private ProducerService producerService;

	@RequestMapping(value = UrlConstants.INDEX, method = RequestMethod.GET)
	public String home(Map<String, Object> map) {
		putRootCategories(map);

		List<ProductCategory> categories = categoryService
				.findChildCategories();
		map.put("categories", categories);
		map.put("allProducers", producerService.findAll());

		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2() {

		return "index";
	}

}
