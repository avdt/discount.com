package com.discount.domain;

public enum LinkType {
	TOP_MENU("Top Menu"), BOTTOM_MENU("Bottom Menu");

	private String value;

	private LinkType(String value) {
		this.setValue(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
