package com.discount.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "producer", uniqueConstraints = {
		@UniqueConstraint(columnNames = "id"),
		@UniqueConstraint(columnNames = "name") })
public class Producer implements Serializable {

	private static final long serialVersionUID = 6956294878514743510L;

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "producer_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column
	private String name;

	@Column
	private String image = "images/default.jpg";

	@Column
	private String description;

	@LazyCollection(LazyCollectionOption.TRUE)
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE,
			CascadeType.PERSIST }, mappedBy = "producer")
	private List<Product> products;

	// @LazyCollection(LazyCollectionOption.TRUE)
	@OneToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE,
			CascadeType.PERSIST }, mappedBy = "producer")
	private List<Range> ranges;

	@Transient
	private List<String> rangeNames;

	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = { CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH, CascadeType.REMOVE })
	@JoinTable(name = "category_producer", joinColumns = { @JoinColumn(name = "producer_id", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "category_id", nullable = false, updatable = false) })
	private List<ProductCategory> categories;

	@Transient
	private List<Integer> categoriesIds = new ArrayList<Integer>();

	@Transient
	private MultipartFile file;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setAutoGrowNestedPaths(false);
	}

	public List<ProductCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<ProductCategory> categories) {
		this.categories = categories;
	}

	public List<Integer> getCategoriesIds() {
		return categoriesIds;
	}

	public void setCategoriesIds(List<Integer> categoriesIds) {
		this.categoriesIds = categoriesIds;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Range> getRanges() {
		return ranges;
	}

	public void setRanges(List<Range> ranges) {
		this.ranges = ranges;
	}

	public List<String> getRangeNames() {
		return rangeNames;
	}

	public void setRangeNames(List<String> rangeNames) {
		this.rangeNames = rangeNames;
	}

}
