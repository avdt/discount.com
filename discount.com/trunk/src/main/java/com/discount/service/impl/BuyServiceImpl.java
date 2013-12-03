package com.discount.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.domain.Cart;
import com.discount.domain.Product;
import com.discount.service.BuyService;
import com.discount.service.ProductService;

@Service("buyService")
public class BuyServiceImpl implements BuyService {

	@Autowired
	private ProductService productService;

	@Override
	public Cart addToCart(Integer productId, Cart cart) {
		Product product = productService.findById(productId);

		if (cart != null) {
			cart.addProduct(product);
		} else {
			cart = new Cart();
			Map<Product, Integer> products = new HashMap<Product, Integer>();
			products.put(product, 1);
			cart.setProducts(products);
		}

		return cart;
	}

	@Override
	public void removeFromCart(Integer productId, Cart cart) {
		Product product = productService.findById(productId);
		cart.deleteProduct(product);
	}

}
