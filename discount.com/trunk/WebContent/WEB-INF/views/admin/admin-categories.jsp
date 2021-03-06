<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>

<spring:message code="general.categories" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin"/></a> <span class="divider">/</span></li>
			    <li class="active"><spring:message code="general.categories"/></li>
		    </ul>
		</div>
		<div class="title">
			<h3><spring:message code="general.categories"/></h3>
			<hr/>
		</div>
		<div id="categories">
	
			<ul class="nav nav-tabs" id="categoryTab">
			    <li class="active"><a href="#create_category" data-toggle="tab"><spring:message code="admin.tab.category.create" /></a></li>
			    <li><a href="#all_categories" data-toggle="tab"><spring:message code="admin.tab.category.all" /></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="create_category">
				
				<!-- Create new category -->
				
					<form:form class="select-category-form">
					    <div class="dropdown">
						    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
						    	<spring:message code="admin.tab.category.select.parent"/>
					    		<b class="caret"></b>
					    	</a>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
						    	<li role="presentation">
										<a href="${pageContext.request.contextPath}/admin/new-category/-1" tabindex="-1" role="menuitem">None</a>
								</li>
						    	<c:forEach items="${rootCategoryList}" var="category">
								    <li role="presentation">
										<a href="${pageContext.request.contextPath}/admin/new-category/${category.id}" tabindex="-1" role="menuitem">${category.name}</a>
									</li>
								</c:forEach>
						    </ul>
					    </div>	
					</form:form>
				</div>
				<div class="tab-pane fade" id="all_categories">
				
					<!-- All categories -->
					<c:choose>
						<c:when test="${!empty allCategories}">
							<div class="bs-docs-grid">
								<div class="row-fluid show-grid">
									<div class="thumbnails">
									<c:forEach items="${allCategories}" var="category">
											<div class="span3 thumbnail category-small"  data-placement="right" data-toggle="tooltip" data-original-title="Tooltip on right">
								    			<a class="category-remove-icon" href="#deleteModal-${category.id}" data-toggle="modal" ><i class="icon-remove" ></i></a>
												<a class="category-remove-icon" href="category/edit/${category.id}"><i class="icon-pencil" ></i></a>
												<a href="#">
													<img class="category-img" alt="260x180" data-src="holder.js/260x180" src="http://${pageContext.request.serverName}:1234/${category.image}">
													<h4>${category.name}</h4>
												</a>
												<spring:message var="modalQuestion" arguments="${category.name}" code="staticPage.delete.question"/>
										    	<spring:message var="modalTitle" arguments="${category.name}" code="staticPage.delete.title"/>
										    	<model:approve-window actionUrl="category/delete/${category.id}" id="${category.id}" question="${modalQuestion}" title="${modalTitle}"></model:approve-window>
									    	</div>
									
									</c:forEach>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<spring:message code="admin.tab.category.noCategory"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</jsp:body>
</layout:page>

