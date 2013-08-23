package com.discount.dao;

import com.discount.domain.ProductCategory;

public interface ProductCategoryDAO extends GenericDAO<ProductCategory> {
	ProductCategory findByName(String name);
}
