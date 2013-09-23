<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="sale" var="sale"/>
<layout:page title="${sale}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <div id="category-title">
	    	<div>
	    		<h3><spring:message code="sale"/></h3>
	    		<hr>
	    	</div>
	    </div>
		<div id="products">
		
		    <div class="row-fluid">
		        <ul class="thumbnails">
		        	<c:forEach items="${saleProducts}" var="product">
							
					    <li class="span4">
						    <div class="thumbnail">
							    <a href="products/get/${product.id}">
								    <img data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
								    <h4>${product.name}</h4>
							    </a>
							    <p>${product.category.name}</p>
							    <p>${product.price}</p>
							    
							    <c:forEach items="${product.settings}" var="setting">
								    <dl class="dl-horizontal">
									    <dt class="setting-name">${setting.propertyName}</dt>
									    <dd class="setting-value">${setting.propertyValue}</dd>
								    </dl>
								</c:forEach>
						    </div>
					    </li>
				    
				    </c:forEach>
				    
			    </ul>
	    	</div>
		</div>	 
		
		<div class="product-info">
			<div id="settings">
				<div class="settings-names-area">
					<div class="row">
					    <span class="setting-name">Розмір</span>
				    </div>
					<div class="row">
					    <span class="setting-name">Розмір</span>
				    </div>
					<div class="row">
					    <span class="setting-name">Розмір</span>
				    </div>
					<div class="row">
					    <span class="setting-name">Розмір</span>
				    </div>
					
			    </div>
			    <div class="setting-values-area">
				    <div class="row">
					    <span class="setting-value">30х40х15</span>
				    </div>
				    <div class="row">
					    <span class="setting-value">30х40х15</span>
				    </div>
				    <div class="row">
					    <span class="setting-value">30х40х15</span>
				    </div>
				    <div class="row">
					    <span class="setting-value">30х40х15</span>
				    </div>
			    </div>
			</div>
			<hr/>
			<div class="buy">
				<button class="btn btn-large btn-primary" type="button"><spring:message code="buy"/></button>
			</div>
		</div>
		
	</jsp:body>
</layout:page>
