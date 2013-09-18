package com.discount.web;

public class UrlConstants {

	public final static String CONTACTS = "/contacts";
	public final static String ABOUT = "/about";
	public final static String ADMIN = "/admin";
	public final static String BOILERS = "/boilers";
	public final static String CLIENT = "/client";
	public final static String ADD = "/add";
	public final static String DELETE_CLIENT = "/delete/{clientId}";
	public final static String INDEX = "/index";

	public final static String LOGIN = "/login";
	public final static String LOGIN_FAILED = "/loginfailed";
	public final static String LOGOUT = "/logout";

	public final static String PLUMBING = "/plumbing";

	public final static String CATEGORIES = "/categories";
	public final static String NEW_CATEGORY = "/new-category/{parentCategoryId}";
	public final static String ADD_CATEGORY = "/new-category/{parentCategoryId}/add";
	public final static String DELETE_CATEGORY = "/category/delete/{categoryId}";
	public final static String EDIT_CATEGORY = "/category/edit/{categoryId}";
	public final static String UPDATE_CATEGORY = "/category/edit/{categoryId}/update";

	public final static String PRODUCTS = "/products";
	public final static String NEW_PRODUCT = "/new-product/{categoryId}";
	public final static String ADD_PRODUCT = "/new-product/{categoryId}/add";
	public final static String UPDATE_PRODUCT = "/product/edit/{productId}/{categoryId}/update";
	public final static String DELETE_PRODUCT = "/product/delete/{productId}";
	public final static String EDIT_PRODUCT = "/product/edit/{productId}";
	public final static String GET_PRODUCT = "/get/{productId}";
	public final static String GET_PRODUCT_BY_CATEGORY = "/{categoryId}";

	public final static String SALE = "/sale";

}
