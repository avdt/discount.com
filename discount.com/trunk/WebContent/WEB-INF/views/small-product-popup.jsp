<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div>
    	<form:form method="GET" action="../cart/${product.id}/add" command="product">
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
				<button class="btn btn-large btn-primary" type="submit"><spring:message code="buy"/></button>
			</div>
		</form:form>
	</div>
</body>
</html>