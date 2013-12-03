package com.discount.domain;

import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;

public class Cart {

	private User user;

	private Map<Product, Integer> products;

	public void addProduct(Product product) {
		if (products.containsKey(product)) {
			Integer amount = products.get(product);
			amount++;
			products.put(product, amount);
		} else {
			products.put(product, 1);
		}
	}

	public void deleteProduct(Product product) {
		products.remove(product);
	}

	public int getSize() {
		int size = 0;
		Collection<Integer> productsAmounts = products.values();
		for (Integer productAmount : productsAmounts) {
			size += productAmount;
		}
		return size;
	}

	public boolean isEmpty() {
		boolean result = true;
		if (products != null) {
			result = products.isEmpty();
		}
		return result;
	}

	public int getTotalPrice() {
		int totalPrice = 0;

		for (Entry<Product, Integer> product : products.entrySet()) {
			totalPrice += product.getKey().getPrice() * product.getValue();
		}

		return totalPrice;
	}

	public Map<Product, Integer> getProducts() {
		return products;
	}

	public void setProducts(Map<Product, Integer> products) {
		this.products = products;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
