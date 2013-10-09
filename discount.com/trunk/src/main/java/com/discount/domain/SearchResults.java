package com.discount.domain;

import java.util.Set;

public class SearchResults {

	private String keyword;
	private Set<Product> matchedProducts;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Set<Product> getMatchedProducts() {
		return matchedProducts;
	}

	public void setMatchedProducts(Set<Product> matchedProducts) {
		this.matchedProducts = matchedProducts;
	}
}
