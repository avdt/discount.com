package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.impl.RangeDAO;
import com.discount.domain.Range;
import com.discount.service.RangeService;

@Service("rangeService")
public class RangeServiceImpl implements RangeService {

	@Autowired
	private RangeDAO rangeDAO;

	@Override
	public void save(Range object) {
		rangeDAO.save(object);
	}

	@Override
	public void update(Range object) {
		rangeDAO.update(object);
	}

	@Override
	public void delete(Range object) {
		rangeDAO.delete(object);
	}

	@Override
	public Range findById(Integer id) {
		return rangeDAO.findById(id);
	}

	@Override
	public List<Range> findAll() {
		return rangeDAO.findAll();
	}

}
