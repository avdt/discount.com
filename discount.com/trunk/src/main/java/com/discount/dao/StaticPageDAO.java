package com.discount.dao;

import java.util.List;

import com.discount.domain.StaticPage;

public interface StaticPageDAO extends GenericDAO<StaticPage> {
	StaticPage findByUrl(String url);

	List<StaticPage> findTopMenuPages();

	List<StaticPage> findBottomMenuPages();
}
