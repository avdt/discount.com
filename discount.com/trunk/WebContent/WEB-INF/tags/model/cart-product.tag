<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ attribute name="product" required="true" type="com.discount.domain.Product" %>
 
   <div id="${product.id}" class="thumbnail cart-product">
   	<div class="product-url-container">
	    <a href="${pageContext.request.contextPath}/products/get/${product.id}">
		    <img class="cart-product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
		    <c:if test="${product.sale}">
			    <img class="sale-img" alt="" src="http://${pageContext.request.serverName}:1234/images/sale2.jpg">
				<span class="sale-value">-${product.discount}%</span>
		    </c:if>
	    </a>
    </div>
    <div class="cart-product-metadata">
	    <a href="${pageContext.request.contextPath}/products/get/${product.id}">
			<h4>${product.name}</h4>
	    </a>
	    <p>${product.category.name}</p>
	    <p class="cart-product-price">${product.price} <spring:message code="product.currency"/></p>
    </div>
    <div class="total-product-info">
	    <div class="cart-product-counter">
	    	<input type="text" id="${product.id}" class="spinner" value="1"/>
	    </div>
	    <div id="${product.id}-total-price"  class="total-product-price cart-product-price">
		    <span id="${product.id}-value" class="value">${product.price}</span>
		    <span><spring:message code="product.currency"/></span>
	    </div>
	    <div class="remove-cart-product">
	    	<a href="${pageContext.request.contextPath}/cart/${product.id}/remove" class="close">&times;</a>
	    </div>
    </div>
   </div>
