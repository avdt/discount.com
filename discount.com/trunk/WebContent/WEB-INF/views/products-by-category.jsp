<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
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
			    	
					    <div id="child-categories" class="tab-pane fade in active">
					    	<div>
					    		<span>
					    			<spring:message code="general.categories" />
				    			</span>
				    		</div>
					    	<ul class="thumbnails">
					        	<c:forEach items="${category.childCategories}" var="category">
										
								    <li class="span3">
									    <div id="${category.id}" class="thumbnail category-small">
										    <a href="${category.id}">
											    <img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${category.image}">
											    <h4>${category.name}</h4>
										    </a>
									    </div>
								    </li>
							    
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
					    	<ul class="thumbnails">
					        	<c:forEach items="${category.producers}" var="producer">
										
								    <li class="span3">
									    <div id="${producer.id}" class="thumbnail category-small">
										    <a href="producer/${producer.id}">
											    <img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${producer.image}">
											    <h4>${producer.name}</h4>
										    </a>
									    </div>
								    </li>
							    
							    </c:forEach>
						    </ul>
					    </div>
		    	</c:when>
		    	
		    	
		    	<c:otherwise>
			    	<div id="products">
					    <div class="row-fluid">
					        <ul class="thumbnails">
					        	<c:forEach items="${productsByCategory}" var="product">
										
								    <li class="span3">
									    <div id="${product.id}" class="thumbnail product-small">
										    <a href="get/${product.id}">
											    <img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
											    <h4>${product.name}</h4>
										    </a>
										    <p>${product.category.name}</p>
										    <p>${product.price}</p>
										    
										    <div class="popup-metadata" style="display: none;">
											    <c:forEach items="${product.settings}" var="setting">
												    <dl class="dl-horizontal">
													    <dt class="setting-name">${setting.propertyName}</dt>
													    <dd class="setting-value">${setting.propertyValue}</dd>
												    </dl>
												</c:forEach>
											</div>
									    </div>
								    </li>
							    
							    </c:forEach>
						    </ul>
				    	</div>
					</div>	   
		    	</c:otherwise>
	    	</c:choose>
	    </div>
	    
		 
	    
	</jsp:body>
</layout:page>
