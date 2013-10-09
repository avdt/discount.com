package com.discount.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Product;
import com.discount.domain.ProductSettings;
import com.discount.service.ProductService;

@Controller
@Path(RestUrls.PRODUCT_URL)
public class ProductRestService {

	@Autowired
	private ProductService productService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("all")
	public List<Product> getAll() {
		List<Product> products = productService.findAll();

		// FIXME: fix hibernate fetching
		for (Product product : products) {
			convert(product);
		}

		return products;
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public Product get(@PathParam("id") Integer id) {

		Product product = productService.findById(id);

		// FIXME: fix hibernate fetching
		if (product != null) {
			convert(product);
		}
		return product;
	}

	/**
	 * Removes bidirectional links between objects.
	 * 
	 * @param product
	 */
	private void convert(Product product) {
		List<ProductSettings> settings = product.getSettings();

		for (ProductSettings productSettings : settings) {
			productSettings.setProduct(null);
		}

		product.getCategory().setProducts(null);
		product.getCategory().setParentCategory(null);
		product.getCategory().setChildCategories(null);
		product.getCategory().setSettings(null);

		product.getProducer().setProducts(null);
	}
}
