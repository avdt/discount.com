package com.discount.service.impl;

import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.discount.domain.Cart;
import com.discount.domain.Product;
import com.discount.domain.Review;
import com.discount.domain.User;
import com.discount.service.NotificationService;
import com.discount.service.OrderExportService;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	private JavaMailSender mailSender;

	@Autowired
	private OrderExportService orderExportService;

	@Override
	public void sendReviewNotification(Review review, Product product) {
		String message = review.getContent();
		String subject = review.getOwnerName() + " added new review to "
				+ product.getName();

		String from = "system@alfero.com";
		String to = "andriyvintoniv@ukr.net";

		send(from, to, subject, message);
	}

	@Override
	public void sendOrderNotification(Cart cart) {
		User user = cart.getUser();

		String subject = "Користувач " + user.getFullName()
				+ " зробив замовлення.";
		StringBuffer message = new StringBuffer();

		Map<Product, Integer> products = cart.getProducts();
		Set<Entry<Product, Integer>> productsSet = products.entrySet();
		message.append("Список товарів:\n");
		message.append("Кількість\tНазва\t\tЦіна\n");
		for (Entry<Product, Integer> product : productsSet) {
			message.append(product.getValue());
			message.append("\t");
			message.append(product.getKey().getName());
			message.append("\t\t");
			message.append(product.getKey().getPrice());
			message.append("\n");
		}
		message.append("\n");
		message.append("Total price");
		message.append(cart.getTotalPrice());
		String from = "system@alfero.com";
		String to = "andriyvintoniv@ukr.net";

		String pathToOrder = orderExportService.export(cart);

		send(from, to, subject, message.toString(), pathToOrder);
	}

	private void send(String from, String to, String subject, String msg) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(to);
		message.setFrom(from);
		message.setSubject(subject);
		message.setText(msg);
		message.setSentDate(new Date());

		mailSender.send(message);
	}

	private void send(String from, String to, String subject, String msg,
			String attachmentPath) {
		MimeMessage message = mailSender.createMimeMessage();

		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
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

}
