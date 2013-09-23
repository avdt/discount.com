package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.discount.dao.ProductCategoryDAO;
import com.discount.domain.CategorySettings;
import com.discount.domain.ProductCategory;
import com.discount.service.FileUploadService;
import com.discount.service.ProductCategoryService;

@Service("productCategoryService")
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Autowired
	private ProductCategoryDAO categoryDAO;

	@Autowired
	private FileUploadService fileUploadService;

	@Override
	public void save(ProductCategory category) {
		uploadImage(category);
		matchCategorySettings(category);

		this.categoryDAO.save(category);
	}

	private void matchCategorySettings(ProductCategory category) {
		List<CategorySettings> settings = category.getSettings();
		if (settings != null) {
			for (CategorySettings categorySettings : settings) {
				categorySettings.setProductCategory(category);
			}
		}
	}

	private void uploadImage(ProductCategory category) {
		MultipartFile file = category.getFile();
		if (null != file) {
			String filePath = fileUploadService.upload(file);
			category.setImage(filePath);
		}
	}

	@Override
	public void update(ProductCategory category) {
		uploadImage(category);
		matchCategorySettings(category);

		this.categoryDAO.update(category);
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
	public List<ProductCategory> findRootCategories() {
		return this.categoryDAO.findRootCategories();
	}

	@Override
	public List<ProductCategory> findChildCategories() {
		return this.categoryDAO.findChildCategories();
	}

}
