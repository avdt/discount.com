package com.discount.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import javax.persistence.CascadeType;

@Entity
@Table(name = "product", uniqueConstraints = {
		@UniqueConstraint(columnNames = "id"),
		@UniqueConstraint(columnNames = "name") })
public class Product {

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "product_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "client_id")
	private Client client;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "product_category_id")
	private ProductCategory productCategory;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "product")
	private List<ProductSettings> settings;

	@Column(name = "name")
	private String name;

	@Column(name = "long_description")
	private String longDescription;

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "initial_price")
	private Integer initialPrice;

	@Column(name = "discount_price")
	private Integer discountPrice;

	@Column(name = "discount")
	private Integer discount;

	@Column(name = "begin_show_date")
	private Date beginShowDate;

	@Column(name = "end_show_date")
	private Date endShowDate;

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

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public Integer getInitialPrice() {
		return initialPrice;
	}

	public void setInitialPrice(Integer initialPrice) {
		this.initialPrice = initialPrice;
	}

	public Integer getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(Integer discountPrice) {
		this.discountPrice = discountPrice;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Date getBeginShowDate() {
		return beginShowDate;
	}

	public void setBeginShowDate(Date beginShowDate) {
		this.beginShowDate = beginShowDate;
	}

	public Date getEndShowDate() {
		return endShowDate;
	}

	public void setEndShowDate(Date endShowDate) {
		this.endShowDate = endShowDate;
	}

	public List<ProductSettings> getSettings() {
		return settings;
	}

	public void setSettings(List<ProductSettings> settings) {
		this.settings = settings;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		Product product;
		if (obj instanceof Product) {
			product = (Product) obj;

			if (this.getName().equals(product.getName())
					/*
					 * && this.getBeginShowDate().equals(
					 * product.getBeginShowDate())
					 */
					&& this.getClient().equals(product.getClient())
					&& this.getDiscount().equals(product.getDiscount())
					&& this.getDiscountPrice().equals(
							product.getDiscountPrice())
					&& this.getEndShowDate().equals(product.getEndShowDate())
					&& this.getId().equals(product.getId())
					&& this.getInitialPrice().equals(product.getInitialPrice())
					&& this.getLongDescription().equals(
							product.getLongDescription())
					&& this.getProductCategory().equals(
							product.getProductCategory())
					&& this.getSettings().equals(product.getSettings())
					&& this.getShortDescription().equals(
							product.getShortDescription())) {
				result = true;
			}
		}
		return result;
	}

}
