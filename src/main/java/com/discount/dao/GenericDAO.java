package com.discount.dao;

import java.util.List;

public interface GenericDAO<T> {
	void save(T object);

	void update(T object);

	void delete(T object);

	T findById(Integer id);

	List<T> findAll();
}
