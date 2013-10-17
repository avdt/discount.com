<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${producer.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="edit-product-container">
		    <form:form method="post" action="${producer.id}/update" commandName="producer" enctype="multipart/form-data">
				<form:hidden path="id" />
				<spring:message code="admin.tab.producer.name" var="producerName"/>
				<spring:message code="admin.tab.products.description" var="producerDescription"/>
					
				<!-- CATEGORIES -->	
				
			    <div class="categories">
			    	<div>
			    		<span><spring:message code="admin.tab.categories"/></span>
		    		</div>
		    		<hr/>
			    	<form:checkboxes class="category" items="${allCategories}" path="categoriesIds" itemLabel="name" itemValue="id" />
			    </div>
			    
			    <!-- RANGES -->
			    
			     <div id="ranges-container">
			    	<div>
			    		<span><spring:message code="product.ranges"/></span>
						<button type="button" class="btn"><i class="icon-plus"></i></button>
						<hr/>
		    		</div>
					<c:forEach items="${producer.ranges}" var="range" varStatus="status">
						<div class="range">
							<span>${range.name}</span>
							<a class="range-remove-icon" href="/admin/range/delete/${range.id}"><i class="icon-remove" ></i></a>
						</div>
			     	</c:forEach>			    	
			    </div>
			     
			    <div id="proerties">
			    	<div>
			    		<img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${producer.image}"/>
			    		<form:input path="image"/>
					</div>
				    <div>
						<form:input path="file" type="file" id="upload" name="upload"/>
					</div>
			     	<div>
						<form:input path="name" type="text" placeholder="${producerName}"/>
					</div>
					<div>
						<form:textarea path="description" type="text" placeholder="${producerDescription}"/>
					</div>
				</div>
				<div id="create-producer-btn">
		     		<input type="submit" value="<spring:message code="general.save"/>" />
	     		</div>
			</form:form>
		</div>
	</jsp:body>
</layout:page>
