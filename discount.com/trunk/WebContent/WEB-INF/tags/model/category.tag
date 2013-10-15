<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ attribute name="category" required="true" type="com.discount.domain.ProductCategory" %>
<%@ attribute name="url" required="true"%> 
<div class="span3">
	<div id="${category.id}" class="thumbnail category-small">
		<a href="${url}${category.id}">
			<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${category.image}">
			<h4>${category.name}</h4>
		</a>
	</div>
</div>