package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.ProductCategoryDAO;
import com.discount.domain.ProductCategory;
import com.discount.service.ProductCategoryService;

@Service("productCategoryService")
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Autowired
	private ProductCategoryDAO testDAO;

	@Override
	public void save(ProductCategory object) {
		this.testDAO.save(object);
	}

	@Override
	public void update(ProductCategory object) {
		this.testDAO.update(object);
	}

	@Override
	public void delete(ProductCategory object) {
		this.testDAO.delete(object);
	}

	@Override
	public ProductCategory findById(Integer id) {
		return this.testDAO.findById(id);
	}

	@Override
	public List<ProductCategory> findAll() {
		return this.testDAO.findAll();
	}

	@Override
	public ProductCategory findByName(String name) {
		return this.testDAO.findByName(name);
	}

}
