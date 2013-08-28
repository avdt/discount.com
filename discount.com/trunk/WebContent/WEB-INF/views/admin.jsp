<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
    	<link rel="stylesheet" type="text/css"
			href="<c:url value="/css/index.css" />" />
		<script type="text/javascript"
			src="<c:url value="/js/admin.js" /> "></script>
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	
		 <div class="tabbable tabs-left">
	        <ul class="nav nav-tabs" id="adminTab">
			    <li class="active"><a href="#users" data-toggle="tab"><spring:message code="admin.tab.users" /></a></li>
			    <li><a href="#categories" data-toggle="tab"><spring:message code="admin.tab.categories" /></a></li>
			    <li><a href="#products" data-toggle="tab"><spring:message code="admin.tab.products" /></a></li>
	   		</ul>
	   		
	   		<div class="tab-content">
				<div class="tab-pane fade in active" id="users">Add User</div>
				<div class="tab-pane fade" id="categories">
					
					<ul class="nav nav-tabs" id="categoryTab">
					    <li class="active"><a href="#create_category" data-toggle="tab"><spring:message code="admin.tab.category.create" /></a></li>
					    <li><a href="#all_categories" data-toggle="tab"><spring:message code="admin.tab.category.all" /></a></li>
			   		</ul>
			   		<div class="tab-content">
						<div class="tab-pane fade in active" id="create_category">
						<!-- Create new category -->
						
						    <form:form method="post" action="admin/category/add" commandName="category">
								<fieldset>
									<spring:message code="admin.tab.category.name" var="categoryName"/>
									<form:input path="name" type="text" placeholder="${categoryName}"/>
									<input type="file" id="upload" name="upload"/>
									
									<input type="submit"
										value="<spring:message code="label.addcontact"/>" />
								 </fieldset>
							</form:form>
						
						</div>
						<div class="tab-pane fade" id="all_categories">
						<!-- All categories -->
						<c:if test="${!empty categories}">
						
						<c:forEach items="${categories}" var="category">
						<div class="span4">
							<a href="admin/category/delete/${category.id}"><i class="icon-remove" ></i></a>
							
							<h2>${category.name}</h2>
							<p>
							<a class="btn" href="#">View details »</a>
							</p>
						</div>
						</c:forEach>
						
						</c:if>
						</div>
					</div>
					</div>
				<div class="tab-pane fade" id="products">Add Product</div>
			</div>
			 
		</div>
	</jsp:body>
</layout:page>
