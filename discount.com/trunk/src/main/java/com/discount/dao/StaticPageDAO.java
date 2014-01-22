package com.discount.dao;

import com.discount.domain.StaticPage;

public interface StaticPageDAO extends GenericDAO<StaticPage> {
	StaticPage findByUrl(String url);
}
