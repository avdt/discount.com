package com.discount.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.discount.dao.ProducerDAO;
import com.discount.dao.ProductCategoryDAO;
import com.discount.domain.Producer;
import com.discount.domain.ProductCategory;
import com.discount.service.FileUploadService;
import com.discount.service.ProducerService;

@Service("producerService")
public class ProducerServiceImpl implements ProducerService {

	@Autowired
	private ProducerDAO producerDAO;

	@Autowired
	private FileUploadService fileUploadService;

	@Autowired
	private ProductCategoryDAO categoryDAO;

	@Override
	public void save(Producer producer) {
		List<Integer> categoriesIds = producer.getCategoriesIds();
		List<ProductCategory> categories = new ArrayList<ProductCategory>();

		for (Integer categoryId : categoriesIds) {
			ProductCategory category = categoryDAO.findById(categoryId);
			category.getProducers().add(producer);
			categories.add(category);
		}
		producer.setCategories(categories);

		uploadImage(producer);
		producerDAO.save(producer);
	}

	@Override
	public void update(Producer object) {
		uploadImage(object);
		producerDAO.update(object);
	}

	@Override
	public void delete(Producer object) {
		producerDAO.delete(object);
	}

	@Override
	public Producer findById(Integer id) {
		return producerDAO.findById(id);
	}

	@Override
	public List<Producer> findAll() {
		return producerDAO.findAll();
	}

	@Override
	public List<Producer> findByCategoryId(Integer productCategoryId) {
		return this.producerDAO.findByCategoryId(productCategoryId);
	}

	private void uploadImage(Producer producer) {
		MultipartFile file = producer.getFile();
		if (null != file) {
			String filePath = fileUploadService.upload(file);
			producer.setImage(filePath);
		}
	}

}
