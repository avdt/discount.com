<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ attribute name="producer" required="true" type="com.discount.domain.Producer" %>
<%@ attribute name="url" required="true"%>

<div class="span3">
	<div id="${producer.id}" class="thumbnail producer-small">
		<a href="${url}${producer.id}">
			<img class="producer-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${producer.image}">
		</a>
	</div>
</div>