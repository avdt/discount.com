package com.discount.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Review;
import com.discount.domain.Product;
import com.discount.service.MailService;
import com.discount.service.NotificationService;
import com.discount.service.ProductService;

@Controller
@RequestMapping(UrlConstants.COMMENT)
public class ReviewController {

	@Autowired
	private ProductService productService;

	@Autowired
	private MailService mailService;

	@Autowired
	private NotificationService notificationService;

	@RequestMapping(value = UrlConstants.ADD_COMMENT, method = RequestMethod.POST)
	public String saveReview(@ModelAttribute("comment") Review review,
			@PathVariable("productId") Integer productId,
			HttpServletRequest request) {
		review.setDate(new Date());

		Product product = productService.findById(productId);
		product.getComments().add(review);
		review.setProduct(product);

		productService.update(product);

		notificationService.sendReviewNotification(review, product);
		
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

}
