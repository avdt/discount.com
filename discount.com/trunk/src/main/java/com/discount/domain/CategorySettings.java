package com.discount.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "category_settings", uniqueConstraints = { @UniqueConstraint(columnNames = "id") })
public class CategorySettings {

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "category_settings_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "field_name")
	private String fieldName;

	@Column(name = "field_type")
	private String fieldType;

	@ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE,
			CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "category_id", referencedColumnName = "id", insertable = true)
	private ProductCategory productCategory;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

}
