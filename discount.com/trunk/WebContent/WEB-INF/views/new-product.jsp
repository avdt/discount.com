<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <form:form method="post" action="${selectedCategory.id}/add" commandName="product" enctype="multipart/form-data">
			<spring:message code="admin.tab.products.name" var="productName"/>
			<spring:message code="admin.tab.products.description" var="description"/>
			<spring:message code="admin.tab.products.price" var="price"/>
			<div>
				<form:input path="file" type="file" id="upload" name="upload"/>
			</div>
	     	<div>
				<form:input path="name" type="text" placeholder="${productName}"/>
			</div>
			<div>
				<form:textarea path="description"  placeholder="${description}"/>
			</div>
			<div>
				<form:input path="price" type="text" placeholder="${price}"/>
			</div>
			<div>
		     	<c:forEach items="${selectedCategory.settings}" var="setting">
		     		<div>
						<form:input path="name" type="text" placeholder="${setting.fieldName}"/>
					</div>
		     	</c:forEach>
	     	</div>
	     	<input type="submit" value="<spring:message code="label.addcontact"/>" />
		</form:form>
	</jsp:body>
</layout:page>
