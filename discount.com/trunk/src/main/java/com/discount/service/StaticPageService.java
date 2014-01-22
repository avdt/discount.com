package com.discount.service;

import com.discount.domain.StaticPage;

public interface StaticPageService extends GenericService<StaticPage> {
	StaticPage findBuUrl(String url);
}
