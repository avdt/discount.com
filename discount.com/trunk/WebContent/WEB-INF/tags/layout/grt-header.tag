<%@tag import="com.discount.dao.impl.ProductCategoryDAOImpl"%>
<%@tag import="com.discount.service.impl.ProductCategoryServiceImpl"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="com.discount.web.BaseController"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="grtmenu">
	<div id="container">
		<div class="">
			<a class="special-offer common-url" href="#"><spring:message code="header.action"/></a> |
			<a class="special-offer common-url" href="#"><spring:message code="header.markdown"/></a> |
			<a class="common-url" href="#"><spring:message code="header.delivery"/></a>
		</div>
		<div class="login">
			<a class="common-url" href="#"><spring:message code="header.registration"/></a>
			
			<a class="common-url" href="#"><spring:message code="header.login"/></a>
		</div>
	</div>
</div>