<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<layout:page title="${product.name}">
	<jsp:attribute name="extraHeader">
		<link rel="stylesheet" type="text/css"
			href="<c:url value="/css/product-page.css" />" />
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div>
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}/index"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li><a href="../${product.category.parentCategory.id}">${product.category.parentCategory.name}</a> <span class="divider">/</span></li>
			    <li><a href="../${product.category.id}">${product.category.name}</a> <span class="divider">/</span></li>
			    <li class="active">${product.name}</li>
		    </ul>
		</div>
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
				<c:if test="${product.sale}">
					<div id="sale-container">
					    <img class="sale-img" alt="" src="http://${pageContext.request.serverName}:1234/images/sale2.jpg">
						<span class="sale-value">-${product.discount}%</span>
					</div>
			    </c:if>
		    </div>
		    <div class=right-area>
		    	<div id="product-name">
		    		<h2>${product.name}</h2>
		    	</div>
		    	<div id="producer-info">
		    	<a href="../producer/${product.producer.id}">
		    		<span>${product.producer.name}</span>
	    		</a>
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
	    
	    <div id="comments">
    		<hr/>
	    	Comments will be here
	    </div>
	    
	    <!-- SIMILAR PRODUCTS -->
	    <c:if test="${!productsByRange.isEmpty()}">
		    <div id="similar-products">
			    <hr/>
		    	<div id="similar-product-title">
		    		<span><spring:message code="product.similarProductsTitle"/></span>
		    	</div>
			    <div class="image_carousel">
					<div id="categories-carousel">
						<c:forEach items="${productsByRange}" var="product">
							<model:product product="${product}" url=""></model:product>
						</c:forEach>
					</div>
					<div class="clearfix"></div>
					<a class="carousel-control left" id="categories-carousel_prev" href="#" data-slide="prev">&lsaquo;</a>
			    	<a class="carousel-control right" id="categories-carousel_next" href="#" data-slide="next">&rsaquo;</a>
					<div class="pagination" id="categories-carousel_pag"></div>
				</div>
		    </div>
	    </c:if>
	</jsp:body>
</layout:page>
