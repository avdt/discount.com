package com.discount.domain;

import java.util.List;

public class Cart {

	private User user;

	private List<Product> products;

	public void addProduct(Product product) {
		products.add(product);
	}

	public void deleteProduct(Product product) {
		products.remove(product);
	}

	public int getSize() {
		return products.size();
	}

	public boolean isEmpty() {
		return products.isEmpty();
	}

	public int getTotalPrice() {
		int totalPrice = 0;

		for (Product product : products) {
			totalPrice += product.getPrice();
		}

		return totalPrice;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
