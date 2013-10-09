package com.discount.dao;

import java.util.List;

import com.discount.domain.Producer;

public interface ProducerDAO extends GenericDAO<Producer> {

	List<Producer> findByCategoryId(Integer categoryId);
}
