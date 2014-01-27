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
	public void save(StaticPage staticPage) {
		staticPageDAO.save(staticPage);
	}

	@Override
	public void update(StaticPage object) {
		staticPageDAO.update(object);
	}

	@Override
	public void delete(StaticPage staticPage) {
		staticPageDAO.delete(staticPage);
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

	@Override
	public List<StaticPage> findTopMenuNotReservedPages() {
		return staticPageDAO.findTopMenuNotReservedPages();
	}

	@Override
	public List<StaticPage> findBottomMenuNotReservedPages() {
		return staticPageDAO.findBottomMenuNotReservedPages();
	}

}
