package com.discount.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.discount.domain.FileUpload;

@Controller
public class FileUploadController {

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String displayForm() {
		return "file_upload_form";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("uploadForm") FileUpload uploadForm,
			Model map) {

		MultipartFile file = uploadForm.getFile();

		List<String> fileNames = new ArrayList<String>();

		if (null != file) {
			String fileName = file.getOriginalFilename();
			fileNames.add(fileName);
			// Handle file content - multipartFile.getInputStream()

			map.addAttribute("file", fileName);
		}

		return "file_upload_success";
	}
}
