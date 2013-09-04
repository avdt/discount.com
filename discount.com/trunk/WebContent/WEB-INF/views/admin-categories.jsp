<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>

<div class="tab-pane fade" id="categories">
	
	<ul class="nav nav-tabs" id="categoryTab">
	    <li class="active"><a href="#create_category" data-toggle="tab"><spring:message code="admin.tab.category.create" /></a></li>
	    <li><a href="#all_categories" data-toggle="tab"><spring:message code="admin.tab.category.all" /></a></li>
  		</ul>
  		<div class="tab-content">
		<div class="tab-pane fade in active" id="create_category">
		
		<!-- Create new category -->
		
			<form:form>
			    <div class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
				    	<spring:message code="admin.tab.category.select.parent"/>
			    		<b class="caret"></b>
			    	</a>
				    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				    	<li role="presentation">
								<a href="${pageContext.request.contextPath}/admin/new-category/-1" tabindex="-1" role="menuitem">None</a>
						</li>
				    	<c:forEach items="${categories}" var="category">
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
				<c:when test="${!empty categories}">
					<div class="bs-docs-grid">
						<div class="row-fluid show-grid">
							<div class="thumbnails">
							<c:forEach items="${categories}" var="category">
									<div class="span4 thumbnail"  data-placement="right" data-toggle="tooltip" data-original-title="Tooltip on right">
										<a class="category-remove-icon" href="admin/category/delete/${category.id}"><i class="icon-remove" ></i></a>
										<a href="#">
											<img alt="260x180" data-src="holder.js/260x180" src="http://${pageContext.request.serverName}:1234/${category.image}">
											<h2>${category.name}</h2>
										</a>
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