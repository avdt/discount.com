package com.discount.service;

import java.io.IOException;
import java.util.List;

public interface GenericService<T> {
	void save(T object) throws IllegalStateException, IOException;

	void update(T object) throws IOException;

	void delete(T object);

	T findById(Integer id);

	List<T> findAll();
}
