package com.discount.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "category", uniqueConstraints = {
		@UniqueConstraint(columnNames = "id"),
		@UniqueConstraint(columnNames = "name") })
public class ProductCategory {
	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "product_category_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "name", nullable = false, length = 100)
	private String name;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE, mappedBy = "productCategory")
	private List<Product> products;

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
}
