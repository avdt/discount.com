package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.ProductDAO;
import com.discount.domain.Product;
import com.discount.domain.ProductSettings;
import com.discount.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	public void save(Product product) {
		List<ProductSettings> settings = product.getSettings();
		for (ProductSettings productSettings : settings) {
			productSettings.setProduct(product);
		}

		productDAO.save(product);
	}

	@Override
	public void update(Product object) {
		productDAO.update(object);
	}

	@Override
	public void delete(Product object) {
		productDAO.delete(object);
	}

	@Override
	public Product findById(Integer id) {
		return productDAO.findById(id);
	}

	@Override
	public List<Product> findAll() {
		return productDAO.findAll();
	}

	@Override
	public Product findByName(String name) {
		return this.productDAO.findByName(name);
	}

	@Override
	public List<Product> findByCategoryId(Integer productCategoryId) {
		return this.productDAO.findByCategoryId(productCategoryId);
	}

	@Override
	public List<Product> findSale() {
		return productDAO.findSale();
	}

}
