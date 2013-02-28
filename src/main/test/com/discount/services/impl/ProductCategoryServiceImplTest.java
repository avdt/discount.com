package com.discount.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.discount.model.ProductCategory;
import com.discount.services.ProductCategoryService;

public class ProductCategoryServiceImplTest {
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"spring/config/BeanLocations.xml");

	@Test
	public void testSaveAndFind() {
		ProductCategoryService productCategoryService = (ProductCategoryService) appContext
				.getBean("productCategoryService");

		ProductCategory expectedCategory = getTest();

		productCategoryService.save(expectedCategory);

		ProductCategory actualCategory = productCategoryService
				.findByName(expectedCategory.getName());

		Assert.assertEquals(expectedCategory, actualCategory);

		ProductCategory categoryById = productCategoryService
				.findById(expectedCategory.getId());

		Assert.assertEquals(expectedCategory, categoryById);

		productCategoryService.delete(expectedCategory);
	}

	@Test
	public void testUpdate() {
		ProductCategoryService productCategoryService = (ProductCategoryService) appContext
				.getBean("productCategoryService");

		ProductCategory productCategory = getTest();

		productCategoryService.save(productCategory);

		ProductCategory productCategory2 = productCategoryService
				.findByName(productCategory.getName());
		productCategory2.setName("Updated");

		productCategoryService.update(productCategory2);

		ProductCategory updatedObject = productCategoryService
				.findByName(productCategory2.getName());

		productCategoryService.delete(updatedObject);
	}

	private ProductCategory getTest() {
		ProductCategory test = new ProductCategory();
		List<String> settings = new ArrayList<String>();
		settings.add("CPU");
		test.setName("test name");
		return test;
	}
}
