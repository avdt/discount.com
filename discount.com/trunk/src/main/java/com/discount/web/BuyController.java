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
import com.discount.domain.Product;
import com.discount.service.BuyService;
import com.discount.service.ProductService;

@Controller
@RequestMapping(value = UrlConstants.PRODUCTS)
public class BuyController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private BuyService buyService;

	@RequestMapping(value = UrlConstants.ADD_TO_CART, method = RequestMethod.GET)
	public String addToCart(@ModelAttribute("product") Product product,
			@PathVariable("productId") Integer productId,
			Map<String, Object> map, HttpServletRequest request) {
		putRootCategories(map);

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		cart = buyService.addToCart(productId, cart);

		session.setAttribute("cart", cart);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

}
