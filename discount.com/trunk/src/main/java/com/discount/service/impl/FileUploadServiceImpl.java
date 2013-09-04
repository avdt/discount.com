package com.discount.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.discount.service.FileUploadService;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {

	private static final String RELATIVE_FILE_PATH = "images/";
	private final static String ABSOLUTE_FILE_PATH = "c:/alfero/images/";
	private final static String DEFAULT_IMAGE = "default.jpg";

	@Override
	public String save(MultipartFile file) throws IllegalStateException,
			IOException {
		final String relativeSavedFilePath;
		final String filePath;

		String originalFileName = file.getOriginalFilename();
		if (originalFileName != "") {
			filePath = ABSOLUTE_FILE_PATH + originalFileName;
			relativeSavedFilePath = RELATIVE_FILE_PATH + originalFileName;
			File dest = new File(filePath);
			file.transferTo(dest);
		} else {
			filePath = ABSOLUTE_FILE_PATH + DEFAULT_IMAGE;
			relativeSavedFilePath = RELATIVE_FILE_PATH + DEFAULT_IMAGE;
		}

		return relativeSavedFilePath;
	}

}
