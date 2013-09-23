<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="masthead">
	<div id="head-top">
		<div id="title">
			<a href="${pageContext.request.contextPath}/index">
				<h3 class="muted">Alfero</h3>
			</a>
		</div>
		<div id="search">
		    <form class="form-search">
			    <input id="search-input" type="text" class="input-large" placeholder="<spring:message code="general.search" />">
			    <button type="submit" class="btn"><i class="icon-search"></i></button>
		    </form>
	    </div>
	</div>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a></li>
					<c:set var="rootCategoryList" value="${rootCategories}" scope="session" />
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