<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<layout:page title="${product.name}">
	<jsp:attribute name="extraHeader">
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/product-page.css" />" />
		<script type="text/javascript" src="<c:url value="/js/product-page.js" /> "></script>
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
		    		<h2>${product.price} <spring:message code="product.currency"/></h2>
		    	</div>
		    	<div id="buy">
		    		 <button class="btn btn-large btn-primary" type="button"><spring:message code="buy"/></button>
		    	</div>
		    </div>
	    </div>
	    
	    <div>
		    <ul class="nav nav-tabs" id="categoryTab">
			    <li class="active"><a href="#description" data-toggle="tab"><spring:message code="products.description" /></a></li>
			    <li><a href="#reviews" data-toggle="tab"><spring:message code="product.reviews" /></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="description">
				
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
				<div class="tab-pane fade" id="reviews">
					<div>
						<c:forEach items="${product.comments}" var="comment">
							<div class="review">
								<div class="title">
									<span class="owner-name">${comment.ownerName}</span>
									<span class="review-date">${comment.date}</span>
								</div>
								<div class="content">
									<span>${comment.content}</span>
								</div>
							</div>				
						</c:forEach>
						<div id="add-review">
							<a href="#reviews" onclick="showNewReviewForm(); return false;"><spring:message code="product.addReview"/></a>
						</div>
						
						<div id="new-review" style="display: none;">
							<form:form method="post" action="${product.id}/add-comment" commandName="comment" >
								
								<spring:message code="general.name" var="name"/>
							
								<form:textarea path="content"/>
								<sec:authorize access="authenticated" var="authenticated"/>
								<c:choose>
									<c:when test="${authenticated}">
										<sec:authentication property="principal.name" var="ownerName" />
										<form:hidden path="ownerName" value="${ownerName}"/>
									</c:when>
									<c:otherwise>
										<form:input path="ownerName" placeholder="${name}"/>
									</c:otherwise>
								</c:choose>
					
								<input id="new-review-btn" type="submit" value="<spring:message code="product.addReview"/>" />
							</form:form>
						</div>
					</div>	
				</div>
			</div>
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
