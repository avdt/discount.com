package com.discount.dao;

import java.util.List;

import com.discount.dao.GenericDAO;
import com.discount.domain.Range;

public interface RangeDAO extends GenericDAO<Range> {
	List<Range> findByProducer(int producerId);
}
