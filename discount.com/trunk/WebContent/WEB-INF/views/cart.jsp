<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap-responsive.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/smartspinner/smartspinner.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css" /> " />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/libs/smartspinner/smartspinner.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/libs/bootstrap/bootstrap.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/cart.js" /> "></script>

<title>Insert title here</title>
</head>
<body>
	<div id="cart" class="thumbnails">
	    <div>
        	<c:forEach items="${cart.products}" var="product">
				<model:cart-product product="${product}" url="../products/get/"></model:cart-product>	
		    </c:forEach>
    	</div>
	</div>
</body>
</html>