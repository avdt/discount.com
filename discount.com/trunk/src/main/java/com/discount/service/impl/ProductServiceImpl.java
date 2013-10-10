package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alfero.dao.ProductDAO;
import com.discount.domain.Product;
import com.discount.domain.ProductSettings;
import com.discount.service.FileUploadService;
import com.discount.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private FileUploadService fileUploadService;

	@Override
	public void save(Product product) {
		uploadImage(product);
		matchSettings(product);

		productDAO.save(product);
	}

	@Override
	public void update(Product product) {
		uploadImage(product);
		matchSettings(product);

		productDAO.update(product);
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

	private void matchSettings(Product product) {
		List<ProductSettings> settings = product.getSettings();
		if (settings != null) {
			for (ProductSettings productSettings : settings) {
				productSettings.setProduct(product);
			}
		}
	}

	private void uploadImage(Product product) {
		MultipartFile file = product.getFile();
		if (null != file) {
			String filePath = fileUploadService.upload(file);
			product.setImage(filePath);
		}
	}

	@Override
	public List<Product> findByProducerId(Integer producerId) {
		return this.productDAO.findByProducerId(producerId);
	}

}
