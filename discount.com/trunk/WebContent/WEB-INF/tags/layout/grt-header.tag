<%@tag import="com.discount.dao.impl.ProductCategoryDAOImpl"%>
<%@tag import="com.discount.service.impl.ProductCategoryServiceImpl"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="com.discount.web.BaseController"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="grtmenu">
	<div id="container">
		<div class="">
			<a class="special-offer common-url" href="#"><spring:message code="header.action"/></a> |
			<a class="special-offer common-url" href="#"><spring:message code="header.markdown"/></a> |
			<a class="common-url" href="#"><spring:message code="header.delivery"/></a>
		</div>
		
		<div class="login">
			<sec:authorize access="authenticated" var="authenticated"/>
			<c:choose>
				<c:when test="${authenticated}">
				<div>
					<sec:authentication property="name" />
					<c:url var="logoutUrl" value="/logout"/>
					<a class="common-url" href="${logoutUrl}"><spring:message code="header.logout"/></a>
				</div>
				</c:when>
				<c:otherwise>
					<div>
						<c:url var="registrationUrl" value="/registration"/>
						<a class="common-url" href="${registrationUrl}"><spring:message code="header.registration"/></a>
						
						<c:url var="loginUrl" value="/login/form"/>
						<a class="common-url" href="${loginUrl}"><spring:message code="header.login"/></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>