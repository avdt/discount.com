package com.discount.service;

import java.util.Set;

import com.discount.domain.Product;

public interface SearchService {
	Set<Product> search(String keyWord);

	Set<Product> searchByCategory(String keyWord, int categoryId);
}
