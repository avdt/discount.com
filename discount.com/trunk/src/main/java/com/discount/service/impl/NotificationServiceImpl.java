package com.discount.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.discount.dao.NotificationDAO;
import com.discount.domain.Cart;
import com.discount.domain.Notification;
import com.discount.domain.NotificationType;
import com.discount.domain.Product;
import com.discount.domain.Review;
import com.discount.domain.User;
import com.discount.service.NotificationService;
import com.discount.service.OrderExportService;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	private JavaMailSender mailSender;

	@Autowired
	private NotificationDAO notificationDAO;

	@Autowired
	private OrderExportService orderExportService;

	@Override
	public void sendReviewNotification(Review review, Product product) {
		Locale locale = new Locale("en", "US");

		ResourceBundle labels = ResourceBundle.getBundle(
				"messages_notification", locale);

		System.out.println(labels.getString("notofication.review.subject"));

		// String from = "system@alfero.com";
		String message = review.getContent();
		String subject = review.getOwnerName() + " added new review to "
				+ product.getName();

		Notification notification = notificationDAO
				.findByType(NotificationType.REVIEW_NOTIFICATION);

		send(getEmailsToNotify(notification), subject, message);
	}

	@Override
	public void sendOrderNotification(Cart cart) {
		User user = cart.getUser();

		String subject = "Користувач " + user.getFullName()
				+ " зробив замовлення.";
		StringBuffer message = new StringBuffer();
		//
		// String from = "system@alfero.com";
		// String to = "andriyvintoniv@ukr.net";
		Notification notification = notificationDAO
				.findByType(NotificationType.ORDER_NOTIFICATION);
		String pathToOrder = orderExportService.export(cart);

		send(getEmailsToNotify(notification), subject, message.toString(),
				pathToOrder);
	}

	private void send(String[] to, String subject, String msg) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		message.setSentDate(new Date());

		mailSender.send(message);
	}

	/**
	 * Send an email with attachment
	 * 
	 * @param to
	 * @param subject
	 * @param msg
	 * @param attachmentPath
	 */
	private void send(String[] to, String subject, String msg,
			String attachmentPath) {
		MimeMessage message = mailSender.createMimeMessage();

		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(msg);

			FileSystemResource file = new FileSystemResource(attachmentPath);
			helper.addAttachment(file.getFilename(), file);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mailSender.send(message);
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public void save(Notification object) {
		notificationDAO.save(object);
	}

	@Override
	public void update(Notification object) {
		notificationDAO.update(object);
	}

	@Override
	public void delete(Notification object) {
		notificationDAO.delete(object);
	}

	@Override
	public Notification findById(Integer id) {
		return notificationDAO.findById(id);
	}

	@Override
	public List<Notification> findAll() {
		return notificationDAO.findAll();
	}

	@Override
	public void sendNotification(Notification notification) {

	}

	private String[] getEmailsToNotify(Notification notification) {
		Set<User> users = notification.getUsers();
		Set<String> emails = new HashSet<String>();
		for (User user : users) {
			emails.add(user.getEmail());
		}
		return emails.toArray(new String[0]);
	}

	@Override
	public Notification findByType(NotificationType type) {
		return notificationDAO.findByType(type);
	}
}
