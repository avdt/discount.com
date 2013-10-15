<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
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
						<model:product product="${product}" url="products/get/"></model:product>	
				    </c:forEach>
				    
			    </ul>
	    	</div>
		</div>	 
	</jsp:body>
</layout:page>
