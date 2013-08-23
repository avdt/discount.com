package com.discount.dao;

import java.util.List;

import com.discount.domain.Product;

public interface ProductDAO extends GenericDAO<Product> {
	List<Product> findByClientId(Integer clientId);

	Product findByName(String name);

	List<Product> findByCategoryId(Integer productCategoryId);
}
