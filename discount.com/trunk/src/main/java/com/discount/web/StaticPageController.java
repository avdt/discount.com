package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.LinkType;
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
		map.put("linkTypes", LinkType.values());

		return "admin/add/new-static-page";
	}

	@RequestMapping(value = UrlConstants.SAVE_STATIC_PAGE, method = RequestMethod.POST)
	public String saveStaticPage(
			@ModelAttribute("staticPage") StaticPage staticPage) {
		staticPageService.save(staticPage);

		return "redirect:/admin";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.registerCustomEditor(LinkType.class, "location",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						LinkType location = LinkType.valueOf(text);
						if (location != null) {
							setValue(location);
						}
					}
				});
	}
}
