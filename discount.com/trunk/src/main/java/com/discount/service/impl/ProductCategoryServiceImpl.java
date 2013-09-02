package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.ProductCategoryDAO;
import com.discount.domain.CategorySettings;
import com.discount.domain.ProductCategory;
import com.discount.service.ProductCategoryService;

@Service("productCategoryService")
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Autowired
	private ProductCategoryDAO categoryDAO;

	@Override
	public void save(ProductCategory category) {
		List<CategorySettings> settings = category.getSettings();

		for (CategorySettings categorySettings : settings) {
			categorySettings.setProductCategory(category);
		}
		this.categoryDAO.save(category);
	}

	@Override
	public void update(ProductCategory object) {
		this.categoryDAO.update(object);
	}

	@Override
	public void delete(ProductCategory object) {
		this.categoryDAO.delete(object);
	}

	@Override
	public ProductCategory findById(Integer id) {
		return this.categoryDAO.findById(id);
	}

	@Override
	public List<ProductCategory> findAll() {
		return this.categoryDAO.findAll();
	}

	@Override
	public ProductCategory findByName(String name) {
		return this.categoryDAO.findByName(name);
	}

}
