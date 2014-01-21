<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="${producer.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}/index"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li class="active">${producer.name}</li>
		    </ul>
		</div>		
	    <div id="category-title">
	    	<div>
	    		<h3>${producer.name}</h3>
	    	</div>
	    </div>
	    
	    <!-- RANGES -->

	    <div id="ranges">
	        <div class="thumbnails">
				<c:forEach items="${producer.ranges}" var="range">
	    			<div class="span3">
						<div id="${range.id}" class="thumbnail category-small">
							<a href="range/${range.id}">
								<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${range.image}">
								<h4>${range.name}</h4>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
	    </div>
	    
	    <!-- PRODUCTS -->
	    
	    <div id="category-content">
	    	<hr/>
	    	<spring:message code="products.byProducer" arguments="${producer.name}"/>
			<div id="products">
			    <div>
		        	<c:forEach items="${productsByProducer}" var="product">
						<model:product product="${product}" url="../get/"></model:product>	
				    </c:forEach>
		    	</div>
			</div>	 
	    </div>
	    <div>
	    	<hr/>
	    	<div>
    			<h4><spring:message code="producer.about" arguments="${producer.name}"/></h4>
   			</div>
   			<div>
   				<span>${producer.description}</span>
   			</div>
	    </div>
	</jsp:body>
</layout:page>
