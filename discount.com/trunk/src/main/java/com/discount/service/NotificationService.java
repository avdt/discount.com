package com.discount.service;

import com.discount.domain.Product;
import com.discount.domain.Review;

public interface NotificationService {
	void sendReviewNotification(Review review, Product product);
}
