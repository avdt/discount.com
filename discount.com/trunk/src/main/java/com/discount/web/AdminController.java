package com.discount.web;

import java.beans.PropertyEditorSupport;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Producer;
import com.discount.domain.Product;
import com.discount.domain.ProductCategory;
import com.discount.domain.Range;
import com.discount.domain.User;
import com.discount.service.ProducerService;
import com.discount.service.ProductCategoryService;
import com.discount.service.ProductService;
import com.discount.service.RangeService;

@Controller
@RequestMapping(UrlConstants.ADMIN)
public class AdminController extends BaseController {

	@Autowired
	private ProductCategoryService categoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private ProducerService producerService;

	@Autowired
	private RangeService rangeService;

	@RequestMapping(UrlConstants.ADMIN)
	public String getTools(Map<String, Object> map) {
		putRootCategories(map);

		map.put("category", new ProductCategory());
		map.put("user", new User());
		map.put("product", new Product());
		map.put("producer", new Producer());

		List<ProductCategory> categories = categoryService
				.findChildCategories();
		List<ProductCategory> allCategories = categoryService.findAll();
		map.put("childCategories", categories);
		map.put("allCategories", allCategories);
		map.put("products", productService.findAll());
		map.put("producers", producerService.findAll());

		return "admin/admin";
	}

	@RequestMapping(value = UrlConstants.NEW_CATEGORY, method = RequestMethod.GET)
	public String newCategory(
			@PathVariable("parentCategoryId") Integer parentCategoryId,
			Map<String, Object> map) {
		putRootCategories(map);

		ProductCategory category = categoryService.findById(parentCategoryId);

		map.put("parentCategory", category);
		map.put("category", new ProductCategory());

		return "admin/add/new-category";
	}

	@RequestMapping(value = UrlConstants.ADD_CATEGORY, method = RequestMethod.POST)
	public String saveCategory(
			@ModelAttribute("category") ProductCategory category,
			@PathVariable("parentCategoryId") Integer parentCategoryId) {

		ProductCategory parentCategory = categoryService
				.findById(parentCategoryId);
		category.setParentCategory(parentCategory);

		categoryService.save(category);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_CATEGORY)
	public String deleteCategory(@PathVariable("categoryId") Integer categoryId) {

		categoryService.delete(categoryService.findById(categoryId));

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.EDIT_CATEGORY)
	public String editCategory(@PathVariable("categoryId") Integer categoryId,
			Map<String, Object> map) {
		putRootCategories(map);

		ProductCategory category = categoryService.findById(categoryId);
		map.put("category", category);

		return "admin/edit/edit-category";
	}

	@RequestMapping(value = UrlConstants.UPDATE_CATEGORY, method = RequestMethod.POST)
	public String updateCategory(
			@ModelAttribute("category") ProductCategory category) {

		categoryService.update(category);

		return "redirect:/admin";
	}

	@RequestMapping(value = UrlConstants.NEW_PRODUCT, method = RequestMethod.GET)
	public String newProduct(@PathVariable("categoryId") Integer categoryId,
			Map<String, Object> map) {
		putRootCategories(map);

		ProductCategory category = categoryService.findById(categoryId);

		map.put("selectedCategory", category);
		map.put("product", new Product());

		return "admin/add/new-product";
	}

	@RequestMapping(value = UrlConstants.ADD_PRODUCT, method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute("product") Product product,
			@PathVariable("categoryId") Integer categoryId) {

		ProductCategory category = categoryService.findById(categoryId);
		product.setCategory(category);

		productService.save(product);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_PRODUCT)
	public String deleteProduct(@PathVariable("productId") Integer productId) {

		productService.delete(productService.findById(productId));

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.EDIT_PRODUCT)
	public String editProduct(@PathVariable("productId") Integer productId,
			Map<String, Object> map) {
		putRootCategories(map);

		Product product = productService.findById(productId);
		map.put("product", product);
		map.put("allCategories", categoryService.findAll());
		map.put("allProducers", producerService.findAll());

		return "admin/edit/edit-product";
	}

	@RequestMapping(value = UrlConstants.UPDATE_PRODUCT, method = RequestMethod.POST)
	public String updateProduct(@PathVariable("categoryId") Integer categoryId,
			@ModelAttribute("product") Product product) {

		ProductCategory category = categoryService.findById(categoryId);
		product.setCategory(category);

		productService.update(product);

		return "redirect:/admin";
	}

	@RequestMapping(value = UrlConstants.ADD_PRODUCER, method = RequestMethod.POST)
	public String saveProducer(@ModelAttribute("producer") Producer producer) {

		producerService.save(producer);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_PRODUCER)
	public String deleteProducer(@PathVariable("producerId") Integer producerId) {

		producerService.delete(producerService.findById(producerId));

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.EDIT_PRODUCER)
	public String editProducer(@PathVariable("producerId") Integer producerId,
			Map<String, Object> map) {
		putRootCategories(map);

		Producer producer = producerService.findById(producerId);

		List<ProductCategory> categories = producer.getCategories();

		for (ProductCategory category : categories) {
			producer.getCategoriesIds().add(category.getId());
		}

		map.put("producer", producer);
		map.put("allCategories", categoryService.findAll());
		map.put("range", new Range());

		return "admin/edit/edit-producer";
	}

	@RequestMapping(value = UrlConstants.UPDATE_PRODUCER, method = RequestMethod.POST)
	public String updateProducer(@ModelAttribute("producer") Producer producer) {

		producerService.update(producer);

		return "redirect:/admin";
	}

	@RequestMapping(value = UrlConstants.NEW_RANGE, method = RequestMethod.GET)
	public String newRange(@PathVariable("producerId") Integer producerId,
			Map<String, Object> map) {
		putRootCategories(map);

		Producer producer = producerService.findById(producerId);

		map.put("producer", producer);
		map.put("range", new Range());

		return "admin/add/new-range";
	}

	@RequestMapping(value = UrlConstants.ADD_RANGE, method = RequestMethod.POST)
	public String saveRange(@ModelAttribute("range") Range range,
			@PathVariable("producerId") Integer producerId) {

		Producer producer = producerService.findById(producerId);
		range.setProducer(producer);
		rangeService.save(range);

		return "redirect:/admin";
	}

	@RequestMapping(UrlConstants.DELETE_RANGE)
	public String deleteRange(@PathVariable("rangeId") Integer rangeId) {

		rangeService.delete(rangeService.findById(rangeId));

		return "redirect:/admin";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.registerCustomEditor(ProductCategory.class, "category",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						ProductCategory category = categoryService
								.findById(Integer.valueOf(text));
						if (category != null) {
							setValue(category);
						}
					}
				});

		binder.registerCustomEditor(Producer.class, "producer",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						Producer producer = producerService.findById(Integer
								.valueOf(text));
						if (producer != null) {
							setValue(producer);
						}
					}
				});

		binder.registerCustomEditor(Range.class, "rangeNames",
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {

						Producer producer = producerService.findById(Integer
								.valueOf(text));
						if (producer != null) {
							setValue(producer);
						}
					}
				});

	}
}
