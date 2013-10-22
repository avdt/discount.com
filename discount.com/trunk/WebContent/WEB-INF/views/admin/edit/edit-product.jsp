<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${product.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="new-product-container">
		    <form:form method="post" action="${product.id}/${product.category.id}/update" commandName="product" enctype="multipart/form-data">
				<div id=left-area>
					<spring:message code="admin.tab.products.name" var="productName"/>
					<spring:message code="admin.tab.products.description" var="description"/>
					<spring:message code="admin.tab.products.price" var="price"/>
					<spring:message code="product.range" var="range"/>
					
					<div>
						<form:input path="file" type="file" id="upload" name="upload"/>
					</div>
			     	<div>
						<form:hidden path="id" type="text" value="${product.id}"/>
					</div>
					<div>
						<img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
					</div>
					<div>
						<form:input path="image"/>
					</div>
		     	</div>
		     	
		     	<div id="right-area">
		     		
					<form:input path="name" type="text" placeholder="${productName}"/>
					<form:select path="range" items="${product.producer.ranges}" itemLabel="name" itemValue="id"/>
					<form:select path="category" items="${product.producer.categories}" itemLabel="name" itemValue="id"/>
					<form:select path="producer.id" items="${allProducers}" itemLabel="name" itemValue="id"/>
					<form:input path="price" type="text" placeholder="${price}"/>
					<form:textarea path="description"  placeholder="${description}"/>
			     	<c:forEach items="${product.category.settings}" var="setting" varStatus="status">
			     		<div>
							<form:input path="settings[${status.count-1}].propertyValue" type="text" placeholder="${setting.fieldName}"/>
							<form:hidden path="settings[${status.count-1}].propertyName" type="text" value="${setting.fieldName}"/>
						</div>
			     	</c:forEach>
		     	
		     		<label>
			     		<form:input path="sale" type="checkbox" value="true"/>
			     		<spring:message code="sale"/>
		     		</label>
		     		
		     		<div id="discount" hidden="true">
		     			<form:select id="field-type-select" path="discount">
					    	<option style="display: none;"><c:out value="0"></c:out></option>
					    	<option><c:out value="10"></c:out></option>
					    	<option><c:out value="20"></c:out></option>
					    	<option><c:out value="30"></c:out></option>
					    	<option><c:out value="40"></c:out></option>
					    	<option><c:out value="50"></c:out></option>
					    	<option><c:out value="60"></c:out></option>
					    	<option><c:out value="70"></c:out></option>
					    	<option><c:out value="80"></c:out></option>
					    	<option><c:out value="90"></c:out></option>
					    </form:select>
		     		</div>
		     	</div>
		     	<input type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
