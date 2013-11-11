package com.discount.service.impl;

import java.util.Date;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.discount.domain.Product;
import com.discount.domain.Review;
import com.discount.service.NotificationService;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	private MailSender mailSender;

	@Override
	public void sendReviewNotification(Review review, Product product) {
		String message = review.getContent();
		String subject = review.getOwnerName() + " added new review to "
				+ product.getName();

		String from = "system@alfero.com";
		String to = "andriyvintoniv@ukr.net";

		send(from, to, subject, message);
	}

	private void send(String from, String to, String subject, String msg) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(to);
		message.setFrom(from);
		message.setSubject(subject);
		message.setText(msg);
		message.setSentDate(new Date());

		getMailSender().send(message);
	}

	public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
}
