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
	    <div id="category-title" class="block-title">
    		<h3>${category.name}</h3>
	    </div>
	    <div id="category-content">
	    	<c:choose>
		    	<c:when test="${!category.childCategories.isEmpty()}">
			    	
			    	<!-- CATEGORIES -->
			    	
					    <div id="child-categories">
					    	<ul class="thumbnails">
					        	<c:forEach items="${category.childCategories}" var="category">
									<model:category category="${category}" url=""></model:category>
							    </c:forEach>
						    </ul>
					    </div>
					    
					    <hr/>
					    
					    <!-- PRODUCERS -->
					    
					    <div id="producers-list">
					    	<div class="block-title">
					    		<h3 class="block-title">
					    			<spring:message code="general.producers" />
				    			</h3>
					    	</div>
				        	<c:forEach items="${category.producers}" var="producer">
								<model:producer producer="${producer}" url="producer/"></model:producer>
						    </c:forEach>
					    </div>
		    	</c:when>
	    		
		    	<c:otherwise>
	    		<!-- PRODUCTS -->
		    		<div class="span3 producer-checkboxes">
						<div id="wrapper" class="ft-panel">
						    <ul class="menu">
						        <li class="item1"><a href="#"><spring:message code="general.producers" /> <span>${producers.size()}</span></a>
						            <ul>
						                <c:forEach items="${category.producers}" var="producer">
						    				<li class="subitem1">
						    					<input id="${producer.id}" type="checkbox" value="${producer.name}"/> 
						    					<a href="#">${producer.name}<span>${productsByCategoryAndProducer.get(producer.id).size()}</span>
						    					</a>
					    					</li>
							    		</c:forEach>
						            </ul>
						        </li>
						    </ul>
						</div>
		    		</div>
		    	
			    	<div id="products" class="span9">
			    		<div>
			    			<span><spring:message code="general.sort"/></span>
							<select id="sort-order" class="form-control" title='Choose one of the following...'>
								<option><spring:message code="general.sort.default"/></option>
								<option value="asc"><spring:message code="general.sort.cheap"/></option>
								<option value="desc"><spring:message code="general.sort.expensive"/></option>
								<option value="byName"><spring:message code="general.sort.byName"/></option>
							</select>
							
							<select class="selectpicker show-menu-arrow" multiple title='Choose one of the following...'>
								<option>Mustard</option>
								<option>Ketchup</option>
								<option>Relish</option>
							</select>
			    		</div>
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
