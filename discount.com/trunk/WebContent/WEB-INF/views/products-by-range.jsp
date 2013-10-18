<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${range.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}/index"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <c:if test="${producer.category.parentCategory!=null}">
			    	<li><a href="${category.parentCategory.id}">${category.parentCategory.name}</a> <span class="divider">/</span></li>
			    </c:if>
			    <li class="active">${producer.name}</li>
		    </ul>
		</div>		
	    <div id="category-title">
	    	<div>
	    		<h3>${producer.name}</h3>
	    	</div>
	    </div>
	    
	    <!-- PRODUCTS BY RANGE-->
	    
	    <div id="category-content">
	    	<div id="products">
		        <div class="thumbnails">
		        	<c:forEach items="${productsByRange}" var="product">
						<model:product product="${product}" url="../get/"></model:product>		
				    </c:forEach>
			    </div>
			</div>	   
	    </div>
	</jsp:body>
</layout:page>
