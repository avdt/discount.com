<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ attribute name="user" required="true" type="com.discount.domain.User" %>
<%@ attribute name="url" required="true"%> 
<a href="${url}${user.login}">
	<div class="span3">
		<div id="${user.id}" class="thumbnail category-small">
				<img class="category-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${user.image}">
				<h4>${user.fullName}</h4>
		</div>
	</div>
</a>