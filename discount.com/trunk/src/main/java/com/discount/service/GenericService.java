package com.discount.service;

import java.util.List;

public interface GenericService<T> {
	void save(T object);

	void update(T object);

	void delete(T object);

	T findById(Integer id);

	List<T> findAll();
}
