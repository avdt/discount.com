package com.discount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.discount.dao.RangeDAO;
import com.discount.domain.Range;
import com.discount.service.FileUploadService;
import com.discount.service.RangeService;

@Service("rangeService")
public class RangeServiceImpl implements RangeService {

	@Autowired
	private RangeDAO rangeDAO;

	@Autowired
	private FileUploadService fileUploadService;

	@Override
	public void save(Range object) {
		uploadImage(object);
		rangeDAO.save(object);
	}

	@Override
	public void update(Range object) {
		uploadEditedImage(object);
		rangeDAO.update(object);
	}

	@Override
	public void delete(Range object) {
		rangeDAO.delete(object);
	}

	@Override
	public Range findById(Integer id) {
		return rangeDAO.findById(id);
	}

	@Override
	public List<Range> findAll() {
		return rangeDAO.findAll();
	}

	@Override
	public List<Range> findByProducer(int producerId) {
		return rangeDAO.findByProducer(producerId);
	}

	private void uploadImage(Range range) {
		MultipartFile file = range.getFile();
		if (null != file) {
			String filePath = fileUploadService.upload(file);
			range.setImage(filePath);
		}
	}

	private void uploadEditedImage(Range range) {
		MultipartFile file = range.getFile();
		if (file != null) {
			String filePath = fileUploadService.uploadUpdated(file);
			if (filePath != null) {
				range.setImage(filePath);
			}
		}
	}

}
