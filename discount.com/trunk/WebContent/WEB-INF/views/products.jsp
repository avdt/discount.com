<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title><spring:message code="products.title" /></title>
</head>
<body>

	<a href="<c:url value="/logout" />"> 
		<spring:message code="label.logout" />
	</a>

	<h2>
		<spring:message code="products.title" />
	</h2>

	<h3>
		<spring:message code="products.title" />
	</h3>
	<a href='<c:url value="/products/add" />'>
		<spring:message	code="products.add" />
	</a>
	
	<c:if test="${!empty products}">
		<table class="data">
			<tr>
				<th><spring:message code="products.name" /></th>
				<th><spring:message code="products.description" /></th>
				<th><spring:message code="products.price" /></th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.name}</td>
					<td>${product.shortDescription}</td>
					<td>${product.initialPrice}</td>
					<td><a href="products/delete/${product.id}"><spring:message
								code="label.delete" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>