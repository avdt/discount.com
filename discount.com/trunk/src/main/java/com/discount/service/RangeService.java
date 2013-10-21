package com.discount.service;

import java.util.List;

import com.discount.domain.Range;

public interface RangeService extends GenericService<Range> {

	List<Range> findByProducer(int producerId);
}
