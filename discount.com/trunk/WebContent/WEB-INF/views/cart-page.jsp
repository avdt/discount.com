<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:message code="header.cart" var="title"/>
				
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div class="title">
			<h3><spring:message code="header.cart"/></h3>
			<hr/>
		</div>
	
	    <div id="cart-content">
	    	<jsp:include page="cart.jsp"/> 
	    </div>
	    
	    <c:if test="${cart!=null && cart.size!=0}">
		    <div id="cart-summary">
			    <div id="payment-container">
			    	<div id="payment">
			    		<span><spring:message code="cart.payment"/></span>
			    		<a href="payment"><spring:message code="general.readMore"/></a>
			    		<select>
			    			<option><spring:message code="cart.cash"/></option>
			    			<option>Webmoney</option>
			    		</select>
			    	</div>
			    </div>
			    
			    <div id="delivery-container">
			    	<div id="delivery">
			    		<span><spring:message code="cart.delivery"/></span>
			    		<a href="delivery"><spring:message code="general.readMore"/></a>
			    	</div>
			    	<div>
			    		<input type="radio" value="ololo" name="ololo">
			    	</div>
			    </div>
		    </div>
		    <div id="cart-actions">
		    	<a class="btn" href="cart/checkout"><spring:message code="cart.checkout"/></a>
		    	<a class="btn" href="#"><spring:message code="cart.continueShoping"/></a>
		    	<a class="btn" href="cart/clear"><spring:message code="cart.clear"/></a>
		    </div>
	    </c:if>
	</jsp:body>
</layout:page>
