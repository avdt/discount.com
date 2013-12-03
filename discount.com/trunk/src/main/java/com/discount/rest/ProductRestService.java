package com.discount.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Product;
import com.discount.domain.ShortProduct;
import com.discount.service.ProductService;

@Controller
@Path(RestUrls.PRODUCT_URL)
public class ProductRestService {

	@Autowired
	private ProductService productService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("all")
	public List<ShortProduct> getAll() {
		List<Product> products = productService.findAll();
		List<ShortProduct> shortProducts = new ArrayList<ShortProduct>();

		for (Product product : products) {
			ShortProduct shortProduct = convert(product);
			shortProducts.add(shortProduct);
		}

		return shortProducts;
	}

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public ShortProduct get(@PathParam("id") Integer id) {
		Product product = productService.findById(id);
		ShortProduct shortProduct = null;

		if (product != null) {
			shortProduct = convert(product);
		}
		return shortProduct;
	}

	/**
	 * Convert to simple object without bidirectional relationships.
	 * 
	 * @param product
	 */
	private ShortProduct convert(Product product) {
		ShortProduct shortProduct = new ShortProduct();

		shortProduct.setCategory(product.getCategory().getName());
		shortProduct.setDescription(product.getDescription());
		Integer discountPrice = product.getDiscountPrice();
		if (discountPrice != null) {
			shortProduct.setDiscountPrice(discountPrice);
		}
		shortProduct.setId(product.getId());
		shortProduct.setImage(product.getImage());
		shortProduct.setName(product.getName());
		shortProduct.setPrice(product.getPrice());
		shortProduct.setProducer(product.getProducer().getName());
		shortProduct.setRange(product.getRange().getName());
		shortProduct.setSale(product.isSale());

		return shortProduct;
	}
}
