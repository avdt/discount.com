<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.discount.domain.FieldTypes" %>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
	
    </jsp:attribute>
	<jsp:body>
	
	
		 <div class="tabbable tabs-left">
	        <ul class="nav nav-tabs" id="adminTab">
			    <li class="active"><a href="#users" data-toggle="tab"><spring:message code="admin.tab.users" /></a></li>
			    <li><a href="#categories" data-toggle="tab"><spring:message code="admin.tab.categories" /></a></li>
			    <li><a href="#products" data-toggle="tab"><spring:message code="admin.tab.products" /></a></li>
			    <li><a href="#producers" data-toggle="tab"><spring:message code="admin.tab.producer" /></a></li>
	   		</ul>
	   		
	   		<div class="tab-content">
	   		
	   			<!-- USERS -->
				<jsp:include page="admin-users.jsp"/> 
				
				<!-- CATEGORIES -->
				<jsp:include page="admin-categories.jsp"/> 
				
				<!-- PRODUCTS -->
				<jsp:include page="admin-products.jsp"/> 
				
				<!-- PRODUCERS -->
				<jsp:include page="admin-producers.jsp"/> 
			 </div>
		</div>
	</jsp:body>
</layout:page>
