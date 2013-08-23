package com.discount.service;

import java.util.List;

import com.discount.domain.ProductSettings;

public interface ProductSettingsService extends GenericService<ProductSettings> {
	List<ProductSettings> findByProductId(Integer productId);

	ProductSettings findByPropertyName(String propertyName);
}
