package com.discount.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.domain.Product;
import com.discount.domain.ProductSettings;
import com.discount.service.ProductService;
import com.discount.service.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	private ProductService productService;

	@Override
	public Set<Product> search(String keyword) {
		Set<Product> result = new HashSet<Product>();

		List<Product> allProducts = productService.findAll();
		result = matchByKeyword(keyword, allProducts);
		return result;
	}

	private Set<Product> matchByKeyword(String keyword,
			List<Product> allProducts) {
		Set<Product> matchedProducts = new HashSet<Product>();

		for (Product product : allProducts) {
			if (StringUtils.containsIgnoreCase(product.getName(), keyword)
					|| StringUtils.containsIgnoreCase(product.getCategory()
							.getName(), keyword)
					|| StringUtils.containsIgnoreCase(product.getDescription(),
							keyword) || matchedBySettings(keyword, product)) {
				matchedProducts.add(product);
			}
		}

		return matchedProducts;
	}

	/**
	 * If product settings names or values contains keyword return true,
	 * otherwise - false.
	 * 
	 * @param keyword
	 * @param product
	 * @return
	 */
	private boolean matchedBySettings(String keyword, Product product) {
		boolean result = false;

		List<ProductSettings> settings = product.getSettings();
		for (ProductSettings productSettings : settings) {
			if (StringUtils.containsIgnoreCase(
					productSettings.getPropertyName(), keyword)
					|| StringUtils.containsIgnoreCase(
							productSettings.getPropertyValue(), keyword)) {
				result = true;
			}
		}

		return result;
	}
}
