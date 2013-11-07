package com.discount.service.impl;

import java.util.Date;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.discount.service.MailService;

@Service("mailService")
public class MailServiceImpl implements MailService {

	private MailSender mailSender;

	@Override
	public void send(String from, String to, String subject, String msg) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(to);
		message.setFrom(from);
		message.setSubject(subject);
		message.setText(msg);
		message.setSentDate(new Date());

		mailSender.send(message);
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

}
