package com.discount.service;

public interface MailService {
	void send(String from, String to, String subject, String msg);
}
