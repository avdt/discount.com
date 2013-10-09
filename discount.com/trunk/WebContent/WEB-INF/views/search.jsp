<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="search-results">
			<div class="title">
				<c:choose>
					<c:when test="${searchResults.matchedProducts.size()==0}">
						<span><spring:message code="search.noResults" arguments="${searchResults.keyword}" /></span>
					</c:when>
					<c:when test="${searchResults.matchedProducts.size()==1}">
						<span><spring:message code="search.foundSingleResult" arguments="${searchResults.matchedProducts.size()}" /></span>
					</c:when>
					<c:when test="${searchResults.matchedProducts.size()>1 && searchResults.matchedProducts.size()<5}">
						<span><spring:message code="search.foundFewResults" arguments="${searchResults.matchedProducts.size()}" /></span>
					</c:when>
					<c:when test="${searchResults.matchedProducts.size()>=5}">
						<span><spring:message code="search.foundResultNumer" arguments="${searchResults.matchedProducts.size()}" /></span>
					</c:when>
				</c:choose>
				<hr/>
			</div>
		    <div id="products">
			    <div class="row-fluid">
			        <ul class="thumbnails">
			        	<c:forEach items="${searchResults.matchedProducts}" var="product">
								
						    <li class="span3">
							    <div id="${product.id}" class="thumbnail product-small">
								    <a href="products/get/${product.id}">
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
		</div>
	</jsp:body>
</layout:page>
