package com.discount.dao;

import java.util.List;

import com.discount.domain.ProductCategory;

public interface ProductCategoryDAO extends GenericDAO<ProductCategory> {

	List<ProductCategory> findRootCategories();

	List<ProductCategory> findChildCategories();
}
