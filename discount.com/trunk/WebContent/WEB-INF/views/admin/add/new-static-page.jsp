<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<layout:page title="New Static Page">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <div id="new-static-page-container">
		    <form:form method="post" action="add-static-page/save" commandName="staticPage" enctype="multipart/form-data">
					<spring:message code="admin.tab.products.name" var="productName"/>
					<spring:message code="admin.tab.products.price" var="price"/>
					<spring:message code="product.range" var="range"/>
					
			     	<div>
			     		<label for="title">Title</label>
						<form:input path="title" type="text"/>
					</div>
					<div>
			     		<label for="title">Url</label>
						<form:input path="url" type="text"/>
					</div>
					<div>
			     		<label for="title"><spring:message code="admin.tab.products.description"/></label>
						<form:textarea path="description"/>
					</div>
					
					<div class="link-location">
						<c:forEach items="${linkTypes}" var="linkType">
							<form:radiobutton path="location" label="${linkType.value}" value="${linkType}" />
						</c:forEach>
					</div>
		     	<input type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
