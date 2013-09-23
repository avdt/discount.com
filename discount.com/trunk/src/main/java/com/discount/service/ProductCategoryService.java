package com.discount.service;

import java.util.List;

import com.discount.domain.ProductCategory;

public interface ProductCategoryService extends GenericService<ProductCategory> {

	List<ProductCategory> findRootCategories();

	List<ProductCategory> findChildCategories();

}
