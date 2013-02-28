package com.discount.service;

import com.discount.domain.ProductCategory;

public interface ProductCategoryService extends GenericService<ProductCategory> {
	ProductCategory findByName(String name);
}
