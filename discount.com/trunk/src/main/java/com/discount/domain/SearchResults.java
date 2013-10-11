package com.discount.domain;

import java.io.Serializable;
import java.util.Set;

public class SearchResults implements Serializable {

	private static final long serialVersionUID = 1605792191820081618L;
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
