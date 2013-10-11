package com.discount.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "comment", uniqueConstraints = { @UniqueConstraint(columnNames = "id") })
public class Comment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3583731207257019483L;

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "comment_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "userId", unique = false, nullable = false, length = 100)
	private Integer userId;

	@Column(name = "productId", unique = false, nullable = false, length = 100)
	private Integer productId;

	@Column(name = "content", unique = false, nullable = false, length = 1000)
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
}
