package com.discount.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.StaticPage;
import com.discount.service.StaticPageService;

@Controller
@RequestMapping(UrlConstants.ADMIN + UrlConstants.CONTENT)
public class StaticPageController extends BaseController {

	@Autowired
	private StaticPageService staticPageService;

	@RequestMapping(value = UrlConstants.NEW_STATIC_PAGE, method = RequestMethod.GET)
	public String newStaticPage(Map<String, Object> map) {
		putRootCategories(map);

		map.put("staticPage", new StaticPage());

		return "admin/add/new-static-page";
	}

	@RequestMapping(value = UrlConstants.SAVE_STATIC_PAGE, method = RequestMethod.POST)
	public String saveStaticPage(
			@ModelAttribute("staticPage") StaticPage staticPage) {
		staticPageService.save(staticPage);

		return "redirect:/admin";
	}

}
