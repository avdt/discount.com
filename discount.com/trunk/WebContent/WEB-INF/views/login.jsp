<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message var="title" code="header.login"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="login-form">
			<c:url value="/login" var="loginUrl" />
			<form action="${loginUrl}" method="post">
				<c:if test="${param.error != null}">
					<div class="alert alert-error">
						Failed to login.
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
							Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.	message}" />
						</c:if>
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
					<div class="alert alert-success">You have been logged out.</div>
				</c:if>
				<label for="username"><spring:message code="general.username"/></label> 
				<input type="text" id="username" name="username" /> 
				<label for="password"><spring:message code="user.password"/></label> 
				<input type="password" id="password" name="password" />
				<label for="remember">Remember Me?</label>
				<input type="checkbox" id="remember" name="_spring_security_remember_me" value="true"/>
				<div class="form-actions">
					<input id="submit" class="btn" name="submit" type="submit" value="<spring:message code="header.login"/>" />
				</div>
			</form>
		</div>
	</jsp:body>
</layout:page>
