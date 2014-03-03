package com.discount.dao;

import java.util.List;

import com.discount.domain.Product;

public interface ProductDAO extends GenericDAO<Product> {
	Product findByName(String name);

	List<Product> findByCategoryId(Integer productCategoryId);

	List<Product> findSale();

	List<Product> findByProducerId(Integer producerId);

	List<Product> findByRange(int range);

	List<Product> findByCategoryAndProducer(int productCategoryId,
			int producerId);
}
