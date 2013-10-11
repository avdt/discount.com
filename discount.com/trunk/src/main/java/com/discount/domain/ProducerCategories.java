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
@Table(name = "producer_categories", uniqueConstraints = { @UniqueConstraint(columnNames = "id") })
public class ProducerCategories implements Serializable {

	private static final long serialVersionUID = -2868456025869131434L;
	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "producer_categories_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	// @LazyCollection(LazyCollectionOption.FALSE)
	// @OneToMany(cascade = CascadeType.ALL, mappedBy = "producerCategories")
	// private List<ProductCategory> categories;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	// public List<ProductCategory> getCategories() {
	// return categories;
	// }
	//
	// public void setCategories(List<ProductCategory> categories) {
	// this.categories = categories;
	// }

	// public Producer getProducer() {
	// return producer;
	// }
	//
	// public void setProducer(Producer producer) {
	// this.producer = producer;
	// }
}
