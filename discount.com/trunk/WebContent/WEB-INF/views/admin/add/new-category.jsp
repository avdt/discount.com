<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/new-category.css" />" />
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="left-area">
			<div id="parent-category">
				<h4><spring:message code="admin.parentCategory"/></h4>
				<div>
					<a href="#">${parentCategory.name}</a>
				    <dl class="dl-horizontal">
				    	<c:forEach items="${parentCategory.settings}" var="setting">
						    <dt class="setting-name">${setting.fieldName}</dt>
						    <dd>${setting.fieldType}</dd>
					    </c:forEach>
				    </dl>
				</div>
			</div>
		</div>
		
		<div id="right-area">
			<c:set var="parentCategoryId">
				<c:choose>
					<c:when test="${parentCategory!=null}">
						<c:out value="${parentCategory.id}"></c:out>
					</c:when>
					<c:otherwise>
						<c:out value="-1"></c:out>
					</c:otherwise>
				</c:choose>
			</c:set>
		    <form:form method="post" action="${parentCategoryId}/add" commandName="category" enctype="multipart/form-data">
				<fieldset>
					<spring:message code="admin.tab.category.name" var="categoryName"/>
					<spring:message code="admin.tab.category.property" var="property"/>
					<spring:message code="admin.tab.category.property.unit" var="unit"/>
					<spring:message code="admin.tab.category.root" var="root"/>
					
					<div>
						<form:input path="file" type="file" id="upload" name="upload"/>
					</div>
					<div>
						<form:input path="name" type="text" placeholder="${categoryName}"/>
					</div>
					<div>
						<form:checkbox path="root" value="root" label="${root}"/>
					</div>
					<div class="category-settings-container">
						<div class="category-setting">
							<form:input path="settings[0].fieldName" type="text" placeholder="${property}"/>
							<c:set var="fieldTypes" value="<%=FieldTypes.values()%>"/>
					        <form:select id="field-type-select" path="settings[0].fieldType">
						    	<option><c:out value="TEXT"></c:out></option>
						    	<option><c:out value="NUMBER"></c:out></option>
						    </form:select>
						    <form:input path="settings[0].unit" type="text" placeholder="${unit}"/>
						</div>
					</div>
				    <a class="btn" href="#" id="add-category-setting"><i class="icon-plus"></i></a>
				    
					<input type="submit" value="<spring:message code="general.save"/>" />
				 </fieldset>
			</form:form>
		</div>
	</jsp:body>
</layout:page>
