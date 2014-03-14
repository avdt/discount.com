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
		<div id="new-product-container">
		    <form:form method="post" action="${pageContext.request.contextPath}/admin/new-product/${selectedCategory.id}/add" commandName="product" enctype="multipart/form-data">
				<div id=left-area>
					<spring:message code="admin.tab.products.name" var="productName"/>
					<spring:message code="admin.tab.products.description" var="description"/>
					<spring:message code="admin.tab.products.price" var="price"/>
					<spring:message code="product.range" var="range"/>
					<spring:message code="admin.tab.producer.select" var="selectProducer"/>
					<spring:message code="product.selectRange" var="selectRange"/>
					
					<div>
						<form:input path="file" type="file" id="upload" name="upload"/>
					</div>
			     	<div>
						<form:input path="name" type="text" placeholder="${productName}"/>
						<form:errors path="name" class="error"></form:errors>
					</div>
					<div>
						<form:select path="producer">
							<form:option value="-1" label="${selectProducer}"></form:option>
						    <form:options items="${selectedCategory.producers}" itemLabel="name" itemValue="id"/>
						</form:select>
						<form:errors path="producer" class="error"></form:errors>
					</div>
			     	<div class="ranges">
						<form:select path="range">
							<form:option value="-1" label="${selectRange}"></form:option>
						    <form:options items="${product.producer.ranges}" itemLabel="name" itemValue="id"/>
						</form:select>
						<form:errors path="range" class="error"></form:errors>
					</div>
					<div>
						<form:textarea path="description"  placeholder="${description}"/>
						<form:errors path="description" class="error"></form:errors>
					</div>
					<div>
						<form:input path="price" type="text" placeholder="${price}"/>
						<form:errors path="price" class="error"></form:errors>
					</div>
					<div>
				     	<c:forEach items="${selectedCategory.settings}" var="setting" varStatus="status">
				     		<div>
								<form:input path="settings[${status.count-1}].propertyValue" type="text" placeholder="${setting.fieldName}"/>
								<form:errors path="settings[${status.count-1}].propertyValue" class="error"></form:errors>
								<form:hidden path="settings[${status.count-1}].propertyName" value="${setting.fieldName}"/>
							</div>
				     	</c:forEach>
			     	</div>
		     	</div>
		     	
		     	<div id="right-area">
		     		<label>
			     		<form:checkbox path="sale" value="true"/>
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
						<form:errors path="discount" class="error"></form:errors>
		     		</div>
		     	</div>
		     	<input type="submit" value="<spring:message code="general.save"/>" />
			</form:form>
		</div>
	</jsp:body>
</layout:page>
