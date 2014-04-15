package com.discount.domain;

public enum NotificationType {
	REVIEW_NOTIFICATION("Top Menu"), ORDER_NOTIFICATION("Bottom Menu");

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
