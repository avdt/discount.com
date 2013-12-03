<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="product" required="true" type="java.util.Map.Entry<com.discount.domain.Product, java.lang.Integer>" %>
 
 	<c:set var="prod" value="${product.key}"></c:set>
 
   <div id="${prod.id}" class="thumbnail cart-product">
   	<div class="product-url-container">
	    <a href="${pageContext.request.contextPath}/products/get/${prod.id}">
		    <img class="cart-product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${prod.image}">
		    <c:if test="${prod.sale}">
			    <img class="sale-img" alt="" src="http://${pageContext.request.serverName}:1234/images/sale2.jpg">
				<span class="sale-value">-${prod.discount}%</span>
		    </c:if>
	    </a>
    </div>
    <div class="cart-product-metadata">
	    <a href="${pageContext.request.contextPath}/products/get/${prod.id}">
			<h4>${prod.name}</h4>
	    </a>
	    <p>${prod.category.name}</p>
	    <p class="cart-product-price">${prod.price} <spring:message code="product.currency"/></p>
    </div>
    <div class="total-product-info">
	    <div class="cart-product-counter">
	    	<input type="text" id="${prod.id}" class="spinner" value="${product.value}"/>
	    </div>
	    <div id="${prod.id}-total-price"  class="total-product-price cart-product-price">
		    <span id="${prod.id}-value" class="value">${prod.price * product.value}</span>
		    <span><spring:message code="product.currency"/></span>
	    </div>
	    <div class="remove-cart-product">
	    	<a href="${pageContext.request.contextPath}/cart/${prod.id}/remove" class="close">&times;</a>
	    </div>
    </div>
   </div>
