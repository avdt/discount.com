<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<layout:page title="Checkout">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<sec:authorize access="authenticated" var="authenticated"/>
		<div>
		
	    <c:choose>
			<c:when test="${authenticated}">
				<div>
					<sec:authentication property="principal.name" />
					<c:forEach items="${cart.products}" var="product">
					<model:cart-product product="${product}"></model:cart-product>
	    			</c:forEach>
					
				</div>
			</c:when>
			<c:otherwise>
				<div>
				    <ul class="nav nav-tabs" id="categoryTab">
					    <li class="active"><a href="#new-user" data-toggle="tab"><spring:message code="cart.newUser" /></a></li>
					    <li><a href="#existing-user" data-toggle="tab"><spring:message code="cart.existingUser" /></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="new-user">
							New user
					    	
						</div>
						<div class="tab-pane fade" id="existing-user">
							Existing user
						</div>
					</div>
			    </div>			
		    </c:otherwise>
		</c:choose>
	    
		</div>
	</jsp:body>
</layout:page>
