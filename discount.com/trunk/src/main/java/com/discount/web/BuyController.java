package com.discount.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Cart;
import com.discount.service.BuyService;
import com.discount.service.ProductService;

@Controller
@RequestMapping(value = UrlConstants.CART)
public class BuyController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private BuyService buyService;

	@RequestMapping(value = UrlConstants.ADD_TO_CART, method = RequestMethod.GET)
	public String addToCart(@PathVariable("productId") Integer productId,
			Map<String, Object> map, HttpServletRequest request) {
		putRootCategories(map);

		HttpSession session = request.getSession();
		Cart cart = getCart(request);

		cart = buyService.addToCart(productId, cart);

		setCart(session, cart);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = UrlConstants.REMOVE_FROM_CART, method = RequestMethod.GET)
	public String removeFromCart(@PathVariable("productId") Integer productId,
			Map<String, Object> map, HttpServletRequest request) {
		putRootCategories(map);

		HttpSession session = request.getSession();
		Cart cart = getCart(request);

		buyService.removeFromCart(productId, cart);

		setCart(session, cart);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = UrlConstants.CART_POPUP, method = RequestMethod.GET)
	public String getCart() {

		return "cart";
	}

	@RequestMapping(value = UrlConstants.CHECKOUT, method = RequestMethod.GET)
	public String getCheckout(Map<String, Object> map) {

		putRootCategories(map);

		return "checkout";
	}

	@RequestMapping(value = UrlConstants.CHECKOUT, method = RequestMethod.POST)
	public String checkout(@ModelAttribute("cart") Cart cart) {

		return "redirect:/admin";
	}

	private Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		return cart;
	}

	private void setCart(HttpSession session, Cart cart) {
		session.setAttribute("cart", cart);
	}
}
