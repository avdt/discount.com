package com.discount.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "category", uniqueConstraints = {
		@UniqueConstraint(columnNames = "id"),
		@UniqueConstraint(columnNames = "name") })
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class ProductCategory implements Serializable {
	private static final long serialVersionUID = -678219134500046757L;

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "product_category_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "name", nullable = false, length = 100)
	@NotNull
	@NotEmpty
	@Size(min = 3, max = 30)
	private String name;

	@Transient
	private MultipartFile file;

	@Column(name = "image", nullable = true)
	private String image = "images/default.jpg";

	@LazyCollection(LazyCollectionOption.TRUE)
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE,
			CascadeType.PERSIST }, mappedBy = "category")
	private List<Product> products;

	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "productCategory")
	private List<CategorySettings> settings;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_category_id")
	private ProductCategory parentCategory;

	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "parentCategory")
	private List<ProductCategory> childCategories;

	@Column(name = "root", nullable = false)
	private boolean root;

	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(mappedBy = "categories", cascade = { CascadeType.MERGE,
			CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.REMOVE })
	private List<Producer> producers;

	@Column
	private boolean published;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		ProductCategory productCategory;
		if (obj instanceof ProductCategory) {
			productCategory = (ProductCategory) obj;

			if (this.getName().equals(productCategory.getName())) {
				result = true;
			}
		}
		return result;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<CategorySettings> getSettings() {
		return settings;
	}

	public void setSettings(List<CategorySettings> settings) {
		this.settings = settings;
	}

	public ProductCategory getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(ProductCategory parentCategory) {
		this.parentCategory = parentCategory;
	}

	public List<ProductCategory> getChildCategories() {
		return childCategories;
	}

	public void setChildCategories(List<ProductCategory> childCategories) {
		this.childCategories = childCategories;
	}

	public boolean isRoot() {
		return root;
	}

	public void setRoot(boolean root) {
		this.root = root;
	}

	public List<Producer> getProducers() {
		return producers;
	}

	public void setProducers(List<Producer> producers) {
		this.producers = producers;
	}

	public boolean isPublished() {
		return published;
	}

	public void setPublished(boolean published) {
		this.published = published;
	}

}
