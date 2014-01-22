package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.dao.StaticPageDAO;
import com.discount.domain.StaticPage;
import com.discount.service.StaticPageService;

@Service("staticPageService")
public class StaticPageServiceImpl implements StaticPageService {

	@Autowired
	private StaticPageDAO staticPageDAO;

	@Override
	public void save(StaticPage object) {
		staticPageDAO.save(object);
	}

	@Override
	public void update(StaticPage object) {
		staticPageDAO.update(object);
	}

	@Override
	public void delete(StaticPage object) {
		staticPageDAO.delete(object);
	}

	@Override
	public StaticPage findById(Integer id) {
		return staticPageDAO.findById(id);
	}

	@Override
	public List<StaticPage> findAll() {
		return staticPageDAO.findAll();
	}

	@Override
	public StaticPage findBuUrl(String url) {
		return staticPageDAO.findByUrl(url);
	}

}
