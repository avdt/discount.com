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
			<a href="${pageContext.request.contextPath}/index">
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
	    	<a href="#" class="btn"><i class="icon-shopping-cart"></i><spring:message code="header.cart" /></a>
	    </div>
	</div>
	
	<!-- NAVIGATION -->
	
	<div class="navbar">
		<div id="admin">
	    	<a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a>
    	</div>
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