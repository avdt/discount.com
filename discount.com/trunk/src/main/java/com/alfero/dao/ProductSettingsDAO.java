package com.alfero.dao;

import java.util.List;

import com.discount.domain.ProductSettings;

public interface ProductSettingsDAO extends GenericDAO<ProductSettings> {
	List<ProductSettings> findByProductId(Integer productId);

	ProductSettings findByPropertyName(String propertyName);
}
