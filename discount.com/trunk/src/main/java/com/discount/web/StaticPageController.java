package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.LinkType;
import com.discount.domain.StaticPage;
import com.discount.service.StaticPageService;

@Controller
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

	@RequestMapping(value = UrlConstants.EDIT_STATIC_PAGE, method = RequestMethod.GET)
	public String editStaticPage(Map<String, Object> map,
			@PathVariable("staticPageUrl") String pageUrl) {
		putRootCategories(map);

		StaticPage staticPage = staticPageService.findBuUrl(pageUrl);

		map.put("staticPage", staticPage);
		map.put("linkTypes", LinkType.values());

		return "admin/edit/edit-static-page";
	}

	@RequestMapping(value = UrlConstants.UPDATE_STATIC_PAGE, method = RequestMethod.POST)
	public String updateStaticPage(
			@ModelAttribute("staticPage") StaticPage staticPage) {
		staticPageService.update(staticPage);

		return "redirect:/content/" + staticPage.getUrl();
	}

	@RequestMapping(value = { "/about", "/contacts", "/sale",
			"/special-offers", "/payment", "/delivery", "/markdown" }, method = RequestMethod.GET)
	public String renderReservedStaticPage(Map<String, Object> map,
			HttpServletRequest request) {
		putRootCategories(map);

		StaticPage staticPage = staticPageService.findBuUrl(request
				.getServletPath());
		map.put("staticPage", staticPage);

		return "static-page";
	}

	@RequestMapping(value = UrlConstants.CONTENT + "{staticPageUrl}", method = RequestMethod.GET)
	public String renderStaticPage(Map<String, Object> map,
			@PathVariable final String staticPageUrl) {
		putRootCategories(map);

		StaticPage staticPage = staticPageService.findBuUrl(staticPageUrl);
		map.put("staticPage", staticPage);

		return "static-page";
	}

	@RequestMapping(UrlConstants.DELETE_STATIC_PAGE)
	public String deleteProduct(
			@PathVariable("staticPageUrl") String staticPageUrl,
			HttpServletRequest request) {

		staticPageService.delete(staticPageService.findBuUrl(staticPageUrl));

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
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
