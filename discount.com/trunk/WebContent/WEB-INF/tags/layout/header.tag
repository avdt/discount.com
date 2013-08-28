<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="masthead">
	<h3 class="muted">Alfero</h3>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a></li>
					<li><a href="${pageContext.request.contextPath}/boilers"><spring:message code="header.boilers" /></a></li>
					<li><a href="${pageContext.request.contextPath}/plumbing"><spring:message code="header.plumbing" /></a></li>
					<li><a href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a></li>
					<li><a href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>