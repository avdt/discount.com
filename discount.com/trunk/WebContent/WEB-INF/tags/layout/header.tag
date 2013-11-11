<%@tag import="com.discount.dao.impl.ProductCategoryDAOImpl"%>
<%@tag import="com.discount.service.impl.ProductCategoryServiceImpl"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="com.discount.web.BaseController"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="masthead">

	<!-- TOP OF HEADER -->

	<div id="head-top">
		<div id="title">
			<a href="${pageContext.request.contextPath}">
				<h3 class="muted">Alfero</h3>
			</a>
		</div>
		
		<!-- SEARCH -->
		
		<div id="search">
		    <form:form class="form-search" method="get" action="${pageContext.request.contextPath}/search" commandName="searchResults">
				<spring:message code="general.search" var="search"/>
			    <form:input id="search-input" path="keyword" type="text" class="input-large" placeholder="${search}" ></form:input>
			    <button type="submit" class="btn"><i class="icon-search"></i></button>
		    </form:form>
	    </div>
	    
	    <!-- CART -->
	    
	    <div id="cart">
			<c:choose>
				<c:when test="${!cart.isEmpty() && cart!=null}">
					<div>
						<spring:message code="header.cart.singleProductCount" arguments="${cart.size}" var="singleProductCount" />
						<spring:message code="header.cart.fewProductsCount" arguments="${cart.size}" var="fewProductsCount"/>
						<spring:message code="header.cart.multiProductCount" arguments="${cart.size}" var="multiProductCount"/>
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
						<div id="cart-info">
							<div id="product-count">
								<a href="${pageContext.request.contextPath}/cart">${productCountText}</a>
							</div>
							<div>
								<span><spring:message code="header.cart.totalPrice" arguments="${cart.totalPrice}"/></span>
							</div>
						</div>
					    <div>	
					    	<a id="checkout" href="${pageContext.request.contextPath}/cart/checkout" class="btn"><spring:message code="header.cart.checkout" /></a>
				    	</div>
		    		</div>
				</c:when>
				<c:otherwise>
					<span><spring:message code="header.cart.empty" /></span>
				</c:otherwise>
			</c:choose>

	    </div>
		<div id="admin">
	    	<a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a>
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