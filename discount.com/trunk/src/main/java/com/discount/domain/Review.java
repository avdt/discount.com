package com.discount.domain;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "comment", uniqueConstraints = { @UniqueConstraint(columnNames = "id") })
public class Review implements Serializable {

	private static final long serialVersionUID = -3583731207257019483L;

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "comment_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "owner_name")
	private String ownerName;

	@ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
	@JoinColumn(name = "product_id")
	private Product product;

	@Column(name = "content", unique = false, nullable = false, length = 1000)
	private String content;

	@Column
	private Date date;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

}
