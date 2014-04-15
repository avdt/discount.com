package com.discount.service;

import com.discount.domain.Cart;
import com.discount.domain.Notification;
import com.discount.domain.Product;
import com.discount.domain.Review;

public interface NotificationService extends GenericService<Notification> {
	void sendReviewNotification(Review review, Product product);

	void sendOrderNotification(Cart cart);

	void sendNotification(Notification notification);
}
