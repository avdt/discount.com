<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>
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
									<spring:message code="admin.tab.category.property" var="property"/>
									
									<div>
										<form:input path="file" type="file" id="upload" name="upload"/>
									</div>
									<div>
										<form:input path="name" type="text" placeholder="${categoryName}"/>
									</div>
									<div class="category-settings-container">
										<div class="category-setting">
											<form:input path="settings[0].fieldName" type="text" placeholder="${property}"/>
											<c:set var="fieldTypes" value="<%=FieldTypes.values()%>"/>
									         <form:select path="settings[0].fieldType">
										    	<option><c:out value="TEXT"></c:out></option>
										    	<option><c:out value="NUMBER"></c:out></option>
										     </form:select>
										</div>
									</div>
								    <a class="btn" href="#" id="add-category-setting"><i class="icon-plus"></i></a>
								    
								    <a id="toolll" title="" data-placement="right" data-toggle="tooltip" href="#" data-original-title="Tooltip on right">Tooltip on right</a>
								    
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
										<div class="thumbnails">
										<c:forEach items="${categories}" var="category">
												<div id="@("category"+category.id)"+${category.id} class="span4 thumbnail"  data-placement="right" data-toggle="tooltip" data-original-title="Tooltip on right">
													<a href="admin/category/delete/${category.id}"><i class="icon-remove" ></i></a>
													<a href="#">
														<img alt="260x180" data-src="holder.js/260x180" src="http://${pageContext.request.serverName}:8080/${category.image}">
														<h2>${category.name}</h2>
													</a>
												</div>
										
										</c:forEach>
										</div>
								
									</div>
								</div>
							</c:if>

						</div>
					</div>
					</div>
				<div class="tab-pane fade" id="products">
				
				    <div class="dropdown">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Select category  
					    	<b class="caret"></b>
				    	</a>
					        
					   <!--  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel"> -->
					    <ul id="menu2" class="dropdown-menu" aria-labelledby="drop5" role="menu">
						    <c:forEach items="${categories}" var="category">
						    	<li role="presentation">
									<a href="#" tabindex="-1" role="menuitem">${category.name}</a>
								</li>
						    </c:forEach>
					    </ul>
				    </div>
				</div>
			</div>
			 
		</div>
	</jsp:body>
</layout:page>
