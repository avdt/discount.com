package com.discount.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	/**
	 * Save file into server file system.
	 * 
	 * @param inputStream
	 * @return path to file on server file system
	 */
	public String upload(MultipartFile file);

	public String uploadUpdated(MultipartFile file);
}
