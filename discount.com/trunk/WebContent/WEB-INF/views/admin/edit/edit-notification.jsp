<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="notification" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <div id="notification-container">
		    <form:form method="post" action="${notification.id}/update" commandName="notification" enctype="multipart/form-data">
					<spring:message code="admin.tab.products.name" var="productName"/>
					<spring:message code="admin.tab.products.price" var="price"/>
					<spring:message code="product.range" var="range"/>
					
			     	<div>
			     		<span>${notification.type.value}</span>
					</div>
					<div>
						<c:forEach items="${adminUsers}" var="user">
							<form:checkbox path="users" label="${fullName}" value="id"/>
						</c:forEach>
						<%-- <form:checkboxes items="${adminUsers}" itemLabel="fullName" itemValue="fullName" path="users"/> --%>
					</div>
					<form:hidden path="id"/>
		     	<input type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
