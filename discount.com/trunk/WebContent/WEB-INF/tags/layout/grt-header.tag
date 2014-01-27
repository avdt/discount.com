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
			<a class="special-offer common-url" href="${pageContext.request.contextPath}/special-offers"><spring:message code="header.action"/></a> |
			<a class="special-offer common-url" href="${pageContext.request.contextPath}/markdown"><spring:message code="header.markdown"/></a> |
			<a class="common-url" href="${pageContext.request.contextPath}/payment"><spring:message code="header.payment"/></a> |
			<a class="common-url" href="${pageContext.request.contextPath}/delivery"><spring:message code="header.delivery"/></a>
			<c:forEach items="${topMenuStaticPages}" var="topMenuPage">
				|<a class="common-url" href="${pageContext.request.contextPath}${topMenuPage.url}">${topMenuPage.title}</a>
			
			</c:forEach>
		</div>
		
		<div class="login">
			<sec:authorize access="authenticated" var="authenticated"/>
			<c:choose>
				<c:when test="${authenticated}">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div id="admin">
					    	<a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a>
				    	</div>
					</sec:authorize>
					<div>
						<sec:authentication property="principal.name" />
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