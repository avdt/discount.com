<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<layout:page title="${product.name}">
	<jsp:attribute name="extraHeader">
		<link rel="stylesheet" type="text/css"
			href="<c:url value="/css/product-page.css" />" />
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="product">
		    <div class="left-area">
		    <a  href="#full-iamge-modal" role="button" data-toggle="modal">
		    	<img src="http://${pageContext.request.serverName}:1234/${product.image}" class="img-polaroid product-img">
	    	</a>
	    	<!-- Modal -->
			<div id="full-iamge-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<button type="button" class="close modal-close" data-dismiss="modal" aria-hidden="true">×</button>
				<div class="modal-body">
					<img src="http://${pageContext.request.serverName}:1234/${product.image}" class="img-rounded">
				</div>
			</div>
		    </div>
		    <div class=right-area>
		    	<div id="product-name">
		    		<h2>${product.name}</h2>
		    	</div>
		    	<div id="product-price">
		    		<h2>${product.price}</h2>
		    	</div>
		    	<div id="buy">
		    		 <button class="btn btn-large btn-primary" type="button"><spring:message code="buy"/></button>
		    	</div>
		    	<div>
		    		${product.description}
		    	</div>
		    	
		    	<div id="settings">
			    	<dl class="dl-horizontal">
			    		<c:forEach items="${product.settings}" var="setting">
												
							<dt class="setting-name">${setting.propertyName}</dt>
							<dd class="setting-value">${setting.propertyValue}</dd>
						
						</c:forEach>
					</dl>
				</div>
		    </div>
	    </div>
	    
	    <!-- COMMENTS -->
	    
	    <hr/>
	    <div class="comments">
	    	Comments will be here
	    </div>
	    
	    <!-- SIMILAR PRODUCTS -->
	    
	    <hr/>
	    <div id="similar-products">
	    
	    </div>
	</jsp:body>
</layout:page>
