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
import com.discount.domain.User;
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
	public String getCartPopup() {
		return "cart";
	}

	@RequestMapping(value = UrlConstants.CART, method = RequestMethod.GET)
	public String getCartPage(Map<String, Object> map) {
		putRootCategories(map);
		return "cart-page";
	}

	@RequestMapping(value = UrlConstants.CHECKOUT, method = RequestMethod.GET)
	public String getCheckout(Map<String, Object> map,
			HttpServletRequest request) {
		putRootCategories(map);
		Cart cart = getCart(request);
		User user = cart.getUser();
		if (user == null) {
			map.put("user", new User());
		} else {
			map.put("user", user);
		}

		return "checkout";
	}

	@RequestMapping(value = UrlConstants.CHECKOUT, method = RequestMethod.POST)
	public String checkout(@ModelAttribute("user") User user,
			HttpServletRequest request) {
		// TODO: send email with an order to distributor

		buyService.clearCart(getCart(request));

		return "redirect:" + UrlConstants.HOME;
	}

	@RequestMapping(value = UrlConstants.CLEAR_CART, method = RequestMethod.GET)
	public String clearCart(Map<String, Object> map, HttpServletRequest request) {
		putRootCategories(map);

		HttpSession session = request.getSession();
		Cart cart = getCart(request);

		buyService.clearCart(cart);
		setCart(session, cart);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	private Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		return cart;
	}

	private void setCart(HttpSession session, Cart cart) {
		session.setAttribute("cart", cart);
	}
}
