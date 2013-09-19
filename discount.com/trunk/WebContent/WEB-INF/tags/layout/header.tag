<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="masthead">
	<a href="${pageContext.request.contextPath}/index">
		<h3 class="muted">Alfero</h3>
	</a>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin" /></a></li>
					
					<!-- ROOT CATEGORIES -->
					<c:forEach items="${categories}" var="category">
						<c:if test="${category.root}">
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
						</c:if>
					</c:forEach>
					
					<li><a href="${pageContext.request.contextPath}/about"><spring:message code="header.aboutUs" /></a></li>
					<li><a href="${pageContext.request.contextPath}/contacts"><spring:message code="header.contacts" /></a></li>
					<li><a href="${pageContext.request.contextPath}/sale"><spring:message code="header.sale" /></a></li>
					
				</ul>
			</div>
		</div>
	</div>
</div>