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
		return productService.findAll();
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public Product get(@PathParam("id") Integer id) {
		return productService.findById(id);
	}
}
