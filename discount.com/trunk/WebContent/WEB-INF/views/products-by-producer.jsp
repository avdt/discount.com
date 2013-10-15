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
	    <div id="category-content">
	    	<div id="products">
			    <div class="row-fluid">
			        <ul class="thumbnails">
			        	<c:forEach items="${productsByProducer}" var="product">
							<model:product product="${product}" url="../get/"></model:product>		
					    </c:forEach>
				    </ul>
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
