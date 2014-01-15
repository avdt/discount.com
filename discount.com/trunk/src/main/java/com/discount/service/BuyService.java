package com.discount.service;

import com.discount.domain.Cart;

public interface BuyService {
	Cart addToCart(Integer productId, Cart cart);

	void removeFromCart(Integer productId, Cart cart);
	
	void clearCart(Cart cart);
}
