package com.discount.rest;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Cart;
import com.discount.domain.Product;
import com.discount.service.ProductService;

@Controller
@Path(RestUrls.CART_URL)
public class CartRestService {

	@Autowired
	private ProductService productService;

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public void get(@PathParam("id") Integer id) {

	}

	@PUT
	@Path(RestUrls.CART_UPDATE_URL)
	public String updateCart(@PathParam("productId") int productId,
			@PathParam("productCount") int productCount,
			@Context HttpServletRequest request) {
		Cart cart = getCart(request);

		Product product = productService.findById(productId);
		cart.update(product, productCount);
		setCart(request, cart);

		return "redirect:/admin";
	}

	private Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		return cart;
	}

	private void setCart(HttpServletRequest request, Cart cart) {
		request.getSession().setAttribute("cart", cart);
	}
}
