package com.discount.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.discount.service.FileUploadService;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {

	// TODO: replace into .properties file
	private final static String path = "c:/alfero/images/";

	@Override
	public String save(MultipartFile file) throws IllegalStateException,
			IOException {
		String filePath = path + file.getOriginalFilename();
		File dest = new File(filePath);
		file.transferTo(dest);

		return "images/" + file.getOriginalFilename();
	}

}
