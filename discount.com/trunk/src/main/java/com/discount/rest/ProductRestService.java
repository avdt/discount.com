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
			product.setCategory(null);
			product.setSettings(null);
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
			product.setCategory(null);
			product.setSettings(null);
		}
		return product;
	}
}
