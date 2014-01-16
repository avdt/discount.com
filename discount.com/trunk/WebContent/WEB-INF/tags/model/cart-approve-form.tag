<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ attribute name="user" required="true" type="com.discount.domain.User" %>

<form:form method="post" action="checkout" commandName="user" enctype="multipart/form-data">
	<div id=left-area>
		
     	<div>
     		<label for="fullName">Full Name</label>
			<form:input path="fullName" type="text" value="${user.firstName} ${user.lastName}"/>
     		<label for="email">Email</label>
			<form:input path="email" type="text" value="${user.email}"/>
     		<label for="phoneNumber">Phone number</label>
			<form:input path="phoneNumber" type="text" value="${user.phoneNumber}"/>
     		<label for="city">City</label>
			<form:input path="city" type="text" value="${user.city}"/>
     		<label for="address">Address</label>
			<form:input path="address" type="text" value="${user.address}"/>
			</div>
    	</div>
    	
    	<input type="submit" value="<spring:message code="general.save"/>" />
</form:form>