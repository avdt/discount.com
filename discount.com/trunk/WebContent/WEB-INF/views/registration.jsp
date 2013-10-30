<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="Registration">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="register-user-container">
		    <form:form method="post" action="registration/save" commandName="user" enctype="multipart/form-data">
				<spring:message code="user.login" var="login"/>
				<spring:message code="user.password" var="password"/>
				<spring:message code="user.firstName" var="firstName"/>
				<spring:message code="user.lastName" var="lastName"/>
				<spring:message code="user.email" var="email"/>
				<spring:message code="user.phoneNumber" var="phoneNumber"/>
				
		     	<div>
					<form:input path="login" type="text" placeholder="${login}"/>
				</div>
		     	<div>
					<form:input path="password" type="text" placeholder="${password}"/>
				</div>
		     	<div>
					<form:input path="firstName" type="text" placeholder="${firstName}"/>
				</div>
		     	<div>
					<form:input path="lastName" type="text" placeholder="${lastName}"/>
				</div>
		     	<div>
					<form:input path="email" type="text" placeholder="${email}"/>
				</div>
		     	<div>
					<form:input path="phoneNumber" type="text" placeholder="${phoneNumber}"/>
				</div>
		     	<form:hidden path="roles" value="2"/>
		     	<input id="register-btn" type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
