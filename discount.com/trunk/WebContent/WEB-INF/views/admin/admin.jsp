<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>
<spring:message code="header.admin" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
	
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li class="active"><spring:message code="header.admin"/></li>
		    </ul>
		</div>
		<div class="title">
			<h3><spring:message code="header.admin"/></h3>
			<hr/>
		</div>
	
		<div id="child-categories">
	    	<ul class="thumbnails">
				<a href="admin/users">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/users.png">
								<h4>Manage Users</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/products">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/products.jpg">
								<h4>Manage Products</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/producers">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/producers.png">
								<h4>Manage Producers</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/categories">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/categories.jpg">
								<h4>Manage Category</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/static-pages">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/static-pages.png">
								<h4>Manage Static Pages</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/ranges">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/ranges.png">
								<h4>Manage Ranges</h4>
						</div>
					</div>
				</a>
				
				<a href="admin/notifications">
					<div class="span3">
						<div class="thumbnail category-small">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/images/notification.png">
								<h4>Manage Notification</h4>
						</div>
					</div>
				</a>
		    </ul>
	    </div>
	</jsp:body>
</layout:page>
