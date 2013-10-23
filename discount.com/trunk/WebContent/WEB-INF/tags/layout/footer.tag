<%@ tag pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="footer">
	<div class="urls-container">
		<a href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a>
		<a href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a>
		<a href="${pageContext.request.contextPath}/sale"><spring:message code="header.sale" /></a>
	</div>		
	<div class="copyright">
		<p>© Alfero 2013</p>
	</div>
</div>