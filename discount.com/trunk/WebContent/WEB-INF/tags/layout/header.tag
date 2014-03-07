<%@tag import="com.discount.dao.impl.ProductCategoryDAOImpl"%>
<%@tag import="com.discount.service.impl.ProductCategoryServiceImpl"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="com.discount.web.BaseController"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>

<div class="masthead">

	<!-- TOP OF HEADER -->

	<div id="head-top">
		<div id="title">
			<a href="${pageContext.request.contextPath}">
				<h3 class="muted">Alfero</h3>
			</a>
		</div>
		
		<!-- SEARCH -->
	    <model:search/>
	    
	    <!-- CART -->
	    
	    <div id="cart-container">
			<div id="cart">
				<c:choose>
					<c:when test="${!cart.isEmpty() && cart!=null}">
							<div>
					    		<spring:message code="cart.singleProductCount" arguments="${cart.size}" var="singleProductCount" />
								<spring:message code="cart.fewProductsCount" arguments="${cart.size}" var="fewProductsCount"/>
								<spring:message code="cart.multiProductCount" arguments="${cart.size}" var="multiProductCount"/>
								<c:choose>
									<c:when test="${cart.size==1}">
										<c:set var="productCountText" value="${singleProductCount}"></c:set>
									</c:when>
									<c:when test="${cart.size>1 && cart.size<5}">
										<c:set var="productCountText" value="${fewProductsCount}"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="productCountText" value="${multiProductCount}"></c:set>
									</c:otherwise>
								</c:choose>
					    	</div>
							
							<div id="cart-info">
								<div id="product-count">
									<a href="${pageContext.request.contextPath}/cart">
										<span><spring:message code="cart.in"/></span>
										<span class="total-count">${cart.size}</span>
										<span>${productCountText}</span>
										<br>
										<span><spring:message code="cart.on"/></span>
										<span class="total-price">${cart.totalPrice}</span>
							    		<span><spring:message code="product.currency"/></span>
									</a>
								</div>
							</div>
						    <div>	
						    	<a id="checkout" href="${pageContext.request.contextPath}/cart" class="btn"><spring:message code="cart.checkout" /></a>
					    	</div>
					</c:when>
					<c:otherwise>
						<span><spring:message code="cart.empty" /></span>
					</c:otherwise>
				</c:choose>
    		</div>

	    </div>
	</div>
	
	<!-- NAVIGATION -->
	
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<!-- ROOT CATEGORIES -->
					<c:forEach items="${rootCategoryList}" var="category">
						<li class="dropdown">
							<a id="drop1" class="dropdown-toggle disabled" data-toggle="dropdown" role="button" href="${pageContext.request.contextPath}/products/${category.id}">
								<label>${category.name}</label>
							</a>
							<ul class="dropdown-menu" aria-labelledby="drop1" role="menu">
								<c:forEach items="${category.childCategories}" var="childCategory">
									<li role="presentation">
										<a href="${pageContext.request.contextPath}/products/${childCategory.id}" tabindex="-1" role="menuitem">${childCategory.name}</a>
									</li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>