<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div>
		<div>
			<span>${product.name}</span>
		</div>
		<div>
			<span>${product.description}</span>
		</div>
		<div>
			<span>${product.price}</span>
		</div>
		<div>
			<button class="btn btn-large btn-primary" type="button"><spring:message code="buy"/></button>
		</div>
	</div>
</body>
</html>