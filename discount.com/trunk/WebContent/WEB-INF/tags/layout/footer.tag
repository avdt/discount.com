<%@ tag pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="footer">
	<div class="urls-container">
		<div id="reserved-static-pages">
			<div>
				<a class="common-url" href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a>
			</div>
			<div>
				<a class="common-url" href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a>
			</div>
			<div>
				<a class="common-url" href="${pageContext.request.contextPath}/sale"><spring:message code="header.sale" /></a>
			</div>
		</div>
		<div id="static-pages">
			<c:forEach items="${bottomMenuStaticPages}" var="staticPage">
				<div>
					<a class="common-url" href="${pageContext.request.contextPath}/content/${staticPage.url}">${staticPage.title}</a>
				</div>
			</c:forEach>
		</div>
	</div>		
	<div class="copyright">
		<p>© Alfero 2013</p>
	</div>
</div>