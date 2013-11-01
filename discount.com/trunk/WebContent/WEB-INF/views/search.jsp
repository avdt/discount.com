<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
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
								<model:product product="${product}" url="get/"></model:product>	
					    </c:forEach>
				    </ul>
		    	</div>
			</div>
		</div>
	</jsp:body>
</layout:page>
