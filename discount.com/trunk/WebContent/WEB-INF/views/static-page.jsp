<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<c:set var="title" value="${staticPage.title}"></c:set>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <div class="static-page-container">
		    <div class="">
			    <div class="span2">
					<div class="left-navigation">
						<div>
							<a class="special-offer common-url" href="${pageContext.request.contextPath}/special-offers"><spring:message code="header.action"/></a>
						</div>
						<div>
							<a class="special-offer common-url" href="${pageContext.request.contextPath}/markdown"><spring:message code="header.markdown"/></a>
						</div>
						<div>
							<a class="common-url" href="${pageContext.request.contextPath}/payment"><spring:message code="header.payment"/></a>
						</div>
						<div>
							<a class="common-url" href="${pageContext.request.contextPath}/delivery"><spring:message code="header.delivery"/></a>
						</div>
						<c:forEach items="${topMenuStaticPages}" var="topMenuPage">
							<div>
								<a class="common-url" href="${pageContext.request.contextPath}/content/${topMenuPage.url}">${topMenuPage.title}</a>
							</div>
						</c:forEach>
						
						<div>
							<a class="common-url" href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a>
						</div>
						<div>
							<a class="common-url" href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a>
						</div>
						<div>
							<a class="common-url" href="${pageContext.request.contextPath}/sale"><spring:message code="header.sale" /></a>
						</div>
						<c:forEach items="${bottomMenuStaticPages}" var="topMenuPage">
							<div>
								<a class="common-url" href="${pageContext.request.contextPath}/content/${topMenuPage.url}">${topMenuPage.title}</a>
							</div>
						</c:forEach>
					</div>
			    </div>
			    <div class="span10">
				    <div id="">
				    	<div id="static-page-content">
							${staticPage.content}
						</div>
				    </div>
			    </div>
		    </div>
	    </div>
	</jsp:body>
</layout:page>
