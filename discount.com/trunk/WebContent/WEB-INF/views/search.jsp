<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="search.for" arguments="${searchResults.keyword}" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="search-results">
			<div class="title">
				<c:choose>
					<c:when test="${searchResults.keyword.length()<2}">
						<span><spring:message code="search.keywordToSmall"/></span>
					</c:when>
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
					<c:when test="${searchResults.matchedProducts==null}">
						<span><spring:message code="search.keywordToSmall"/></span>
					</c:when>
				</c:choose>
				<hr/>
			</div>
			<c:if test="${searchResults.matchedProducts!=null}">
				<div id="products">
				    <div>
			        	<c:forEach items="${searchResults.matchedProducts}" var="product">
							<model:product product="${product}" url="products/get/"></model:product>	
					    </c:forEach>
			    	</div>
				</div>	 
			</c:if>
		</div>
	</jsp:body>
</layout:page>
