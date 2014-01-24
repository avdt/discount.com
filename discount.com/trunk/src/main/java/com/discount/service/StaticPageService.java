package com.discount.service;

import java.util.List;

import com.discount.domain.StaticPage;

public interface StaticPageService extends GenericService<StaticPage> {
	StaticPage findBuUrl(String url);

	List<StaticPage> findTopMenuPages();

	List<StaticPage> findBottomMenuPages();
}
