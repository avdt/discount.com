package com.discount.service;

import java.util.List;

import com.discount.domain.Producer;

public interface ProducerService extends GenericService<Producer> {
	List<Producer> findByCategoryId(Integer productCategoryId);
}
