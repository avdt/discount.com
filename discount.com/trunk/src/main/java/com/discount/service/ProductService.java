package com.discount.service;

import java.util.List;

import com.discount.domain.Product;

public interface ProductService extends GenericService<Product> {
	Product findByName(String name);

	List<Product> findByCategoryId(int productCategoryId);

	List<Product> findSale();

	List<Product> findByProducerId(int producerId);

	List<Product> findByCategoryAndProducer(int productCategoryId,
			int producerId);

	List<Product> findByRange(int range);
}
