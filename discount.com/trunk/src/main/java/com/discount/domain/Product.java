package com.discount.domain;

import java.util.List;

import javax.persistence.CascadeType;
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
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.web.multipart.MultipartFile;

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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_category_id")
	private ProductCategory category;

	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
	private List<ProductSettings> settings;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "price")
	private Integer price;

	@Column(name = "discount_price")
	private Integer discountPrice;

	@Column(name = "discount")
	private Integer discount;

	@Column(name = "image")
	private String image;

	@Transient
	private MultipartFile file;

	@Column(name = "sale")
	private boolean sale;

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

	public List<ProductSettings> getSettings() {
		return settings;
	}

	public void setSettings(List<ProductSettings> settings) {
		this.settings = settings;
	}

	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		Product product;
		if (obj instanceof Product) {
			product = (Product) obj;

			if (this.getName().equals(product.getName())
					&& this.getDiscount().equals(product.getDiscount())
					&& this.getDiscountPrice().equals(
							product.getDiscountPrice())
					&& this.getId().equals(product.getId())
					&& this.getPrice().equals(product.getPrice())
					&& this.getDescription().equals(product.getDescription())
					&& this.getCategory().equals(product.getCategory())
					&& this.getSettings().equals(product.getSettings())) {
				result = true;
			}
		}
		return result;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public ProductCategory getCategory() {
		return category;
	}

	public void setCategory(ProductCategory category) {
		this.category = category;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public boolean isSale() {
		return sale;
	}

	public void setSale(boolean sale) {
		this.sale = sale;
	}

}
