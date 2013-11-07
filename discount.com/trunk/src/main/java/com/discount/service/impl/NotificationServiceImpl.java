package com.discount.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.discount.domain.Product;
import com.discount.domain.Review;
import com.discount.service.MailService;
import com.discount.service.NotificationService;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private MailService mailService;

	@Override
	public void sendReviewNotification(Review review, Product product) {
		String message = review.getContent();
		String subject = review.getOwnerName() + " added new review to "
				+ product.getName();

		String from = "system@alfero.com";
		String to = "andriyvintoniv@ukr.net";

		mailService.send(from, to, subject, message);
	}
}
