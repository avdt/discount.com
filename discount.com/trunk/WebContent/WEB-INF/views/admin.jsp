<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
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
						
						    <form:form method="post" action="admin/category/add" commandName="category" enctype="multipart/form-data">
								<fieldset>
									<spring:message code="admin.tab.category.name" var="categoryName"/>
									<form:input path="name" type="text" placeholder="${categoryName}"/>
									<form:input path="file" type="file" id="upload" name="upload"/>
									
									<input type="submit"
										value="<spring:message code="label.addcontact"/>" />
								 </fieldset>
							</form:form>
						</div>
						<div class="tab-pane fade" id="all_categories">
						<!-- All categories -->
						<c:if test="${!empty categories}">
							<div class="bs-docs-grid">
								<div class="row-fluid show-grid">
									<c:forEach items="${categories}" var="category">
										<div class="thumbnails">
											<div class="span3 thumbnail">
												<a href="admin/category/delete/${category.id}"><i class="icon-remove" ></i></a>
												<a href="#">
													<img alt="260x180" data-src="holder.js/260x180" src="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/${category.image}">
													<h2>${category.name}</h2>
												</a>
											</div>
										</div>
									
									</c:forEach>
							
								</div>
							</div>
						</c:if>

						</div>
					</div>
					</div>
				<div class="tab-pane fade" id="products">Add Product</div>
			</div>
			 
		</div>
	</jsp:body>
</layout:page>
