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
	    
	    <div id="similar-products">
		    <hr/>
	    	<div id="similar-product-title">
	    		<span><spring:message code="product.similarProductsTitle"/></span>
	    	</div>
		    <div class="image_carousel">
				<div id="categories-carousel">
					<c:forEach items="${productsByCategory}" var="product">
						    <div id="${product.id}" class="span3 thumbnail product-small">
							    <a href="${product.id}">
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
					</c:forEach>
				</div>
				<div class="clearfix"></div>
				<a class="carousel-control left" id="categories-carousel_prev" href="#" data-slide="prev">&lsaquo;</a>
		    	<a class="carousel-control right" id="categories-carousel_next" href="#" data-slide="next">&rsaquo;</a>
				<div class="pagination" id="categories-carousel_pag"></div>
			</div>
	    </div>
	</jsp:body>
</layout:page>
