<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap-responsive.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/smartspinner/smartspinner.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/jquery-ui/jquery-ui-1.10.3.custom.css" />" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value="/js/libs/bootstrap/bootstrap.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/cart.js" /> "></script>

<title>Cart</title>
</head>
<body>
	<div id="cart" class="thumbnails">
	    <div id="cart-products">
        	<c:forEach items="${cart.products}" var="product">
				<model:cart-product product="${product}"></model:cart-product>	
		    </c:forEach>
    	</div>
    	<div id="cart-summary">
	    	<div>
	    		<spring:message code="cart.singleProductCount" arguments="${cart.size}" var="singleProductCount" />
				<spring:message code="cart.fewProductsCount" arguments="${cart.size}" var="fewProductsCount"/>
				<spring:message code="cart.multiProductCount" arguments="${cart.size}" var="multiProductCount"/>
				<c:choose>
					<c:when test="${cart.size==1}">
						<c:set var="productCountText" value="${singleProductCount}"></c:set>
					</c:when>
					<c:when test="${cart.size>1 && cart.size<5}">
						<c:set var="productCountText" value="${fewProductsCount}"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="productCountText" value="${multiProductCount}"></c:set>
					</c:otherwise>
				</c:choose>
				<span><spring:message code="cart.in"/></span>
				<span id="total-count">${cart.size}</span>
				<span>${productCountText}</span>
				<span><spring:message code="cart.on"/></span>
				<span id="total-price">${cart.totalPrice}</span>
	    		<span><spring:message code="product.currency"/></span>
	    	</div>
    	</div>
	</div>
</body>
</html>