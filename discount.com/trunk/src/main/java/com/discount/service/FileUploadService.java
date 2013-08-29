package com.discount.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	/**
	 * Save file into server file system.
	 * 
	 * @param inputStream
	 * @return path to file on server file system
	 */
	public String save(MultipartFile file) throws IllegalStateException,
			IOException;
}
