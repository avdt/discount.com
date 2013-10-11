package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.ProductSettingsDAO;
import com.discount.domain.ProductSettings;
import com.discount.service.ProductSettingsService;

@Service("productSettingsService")
public class ProductSettingsServiceImpl implements ProductSettingsService {

	@Autowired
	private ProductSettingsDAO productSettingsDAO;

	@Override
	public void save(ProductSettings object) {
		this.productSettingsDAO.save(object);
	}

	@Override
	public void update(ProductSettings object) {
		this.productSettingsDAO.update(object);
	}

	@Override
	public void delete(ProductSettings object) {
		this.productSettingsDAO.delete(object);
	}

	@Override
	public ProductSettings findById(Integer id) {
		return this.productSettingsDAO.findById(id);
	}

	@Override
	public List<ProductSettings> findAll() {
		return this.productSettingsDAO.findAll();
	}

	@Override
	public List<ProductSettings> findByProductId(Integer productId) {
		return this.productSettingsDAO.findByProductId(productId);
	}

	@Override
	public ProductSettings findByPropertyName(String propertyName) {
		return this.productSettingsDAO.findByPropertyName(propertyName);
	}

}
