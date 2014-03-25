package com.discount.web;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import com.discount.domain.User;

public class Main {
	public static void main(String[] args) {
		AnnotationConfiguration cfg = new AnnotationConfiguration().configure()
				.configure("hibernate.cfg.xml");// populates the data of the
		// configuration file
		// creating seession factory object
		SessionFactory factory = cfg.buildSessionFactory();
		// creating session object
		Session session = factory.openSession();
		// creating transaction object
		Transaction t = session.beginTransaction();
		User user = new User();
		user.setAddress("fasdfasdf");
		user.setLogin("generated");
		user.setEmail("gemerated@ex.com");
		session.persist(user);
		t.commit();// transaction is commited
		session.close();
		System.out.println("successfully saved");

	}
}
