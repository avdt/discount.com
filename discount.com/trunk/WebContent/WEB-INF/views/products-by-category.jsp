<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${category.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}/index"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <c:if test="${category.parentCategory!=null}">
			    	<li><a href="${category.parentCategory.id}">${category.parentCategory.name}</a> <span class="divider">/</span></li>
			    </c:if>
			    <li class="active">${category.name}</li>
		    </ul>
		</div>		
	    <div id="category-title">
	    	<div>
	    		<h3>${category.name}</h3>
	    	</div>
	    </div>
	    <div id="category-content">
	    	<c:choose>
		    	<c:when test="${!category.childCategories.isEmpty()}">
			    	
			    	<!-- CATEGORIES -->
			    	
					    <div id="child-categories">
					    	<div>
					    		<span>
					    			<spring:message code="general.categories" />
				    			</span>
				    		</div>
					    	<ul class="thumbnails">
					        	<c:forEach items="${category.childCategories}" var="category">
									<model:category category="${category}" url=""></model:category>
							    </c:forEach>
						    </ul>
					    </div>
					    
					    <hr/>
					    
					    <!-- PRODUCERS -->
					    
					    <div id="producers">
					    	<div>
					    		<span>
					    			<spring:message code="general.producers" />
				    			</span>
					    	</div>
				        	<c:forEach items="${category.producers}" var="producer">
								<model:producer producer="${producer}" url="producer/"></model:producer>
						    </c:forEach>
					    </div>
		    	</c:when>
		    	
		    	
		    	<c:otherwise>
			    	<div id="products">
					    <div>
				        	<c:forEach items="${productsByCategory}" var="product">
								<model:product product="${product}" url="get/"></model:product>	
						    </c:forEach>
				    	</div>
					</div>	   
		    	</c:otherwise>
	    	</c:choose>
	    </div>
	    
		 
	    
	</jsp:body>
</layout:page>
