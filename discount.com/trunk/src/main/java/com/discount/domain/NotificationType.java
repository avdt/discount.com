package com.discount.domain;

public enum NotificationType {
	REVIEW_NOTIFICATION("Review notification"), ORDER_NOTIFICATION(
			"Order notification");

	private String value;

	private NotificationType(String value) {
		this.setValue(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
