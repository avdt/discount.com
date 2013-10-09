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
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a></li>
					<!-- ROOT CATEGORIES -->
					<c:forEach items="${rootCategoryList}" var="category">
						<li class="dropdown">
							<a id="drop1" class="dropdown-toggle" data-toggle="dropdown" role="button" href="${pageContext.request.contextPath}/boilers">
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
					
					<li><a href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a></li>
					<li><a href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a></li>
					<li><a href="${pageContext.request.contextPath}/sale"><spring:message code="header.sale" /></a></li>
					
				</ul>
			</div>
		</div>
	</div>
</div>