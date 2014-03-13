<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${category.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="new-product-container">
		    <form:form method="post" action="${pageContext.request.contextPath}/admin/category/edit/${category.id}/update" commandName="category" enctype="multipart/form-data">
				<div id=left-area>
					<spring:message code="admin.tab.products.name" var="productName"/>
					<spring:message code="admin.tab.products.description" var="description"/>
					<spring:message code="admin.tab.products.price" var="price"/>
					<spring:message code="admin.tab.category.root" var="root"/>
					
					<div>
						<form:input path="file" type="file" id="upload" name="upload"/>
					</div>
			     	<div>
						<form:hidden path="id" value="${category.id}"/>
						<form:input path="image" type="text" value="${category.image}"/>
						<form:input path="name" type="text" placeholder="${productName}"/>
						<form:errors path="name" class="error"></form:errors>
						<form:checkbox path="root" value="root" label="${root}"/>
						<form:errors path="root" class="error"></form:errors>
						<form:select path="parentCategory" items="${allCategories}" itemLabel="name" itemValue="id"/>
					</div>
					<div>
				     	<c:forEach items="${category.settings}" var="setting" varStatus="status">
				     		<div>
								<form:input path="settings[${status.count-1}].fieldName" type="text" placeholder="${setting.fieldName}"/>
								<form:input path="settings[${status.count-1}].fieldType" type="text" placeholder="${setting.fieldType}"/>
							</div>
				     	</c:forEach>
			     	</div>
		     	</div>
		     	
		     	<input type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
