<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ attribute name="product" required="true" type="com.discount.domain.Product" %>
<%@ attribute name="url" required="true"%>
 
<div class="span3">
    <div id="${product.id}" class="thumbnail product-small">
    	<div class="product-url-container">
		    <a href="${url}${product.id}">
			    <img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
			    <c:if test="${product.sale}">
				    <img class="sale-img" alt="" src="http://${pageContext.request.serverName}:1234/images/sale2.jpg">
					<span class="sale-value">-${product.discount}%</span>
			    </c:if>
		    </a>
	    </div>
	    <div class="product-metadata">
		    <a href="products/get/${product.id}">
				<h4>${product.name}</h4>
		    </a>
		    <p>${product.category.name}</p>
		    <p>${product.price} <spring:message code="product.currency"/></p>
	    </div>
	    <div class="popup-metadata" style="display: none;">
	    	<div>
	    		${product.category.name}
	    	</div>
	    	<div>
	    		${product.description}
	    	</div>
		    <c:forEach items="${product.settings}" var="setting">
			    <dl class="dl-horizontal">
				    <dt class="setting-name">${setting.propertyName}</dt>
				    <dd class="setting-value">${setting.propertyValue}</dd>
			    </dl>
			</c:forEach>
		</div>
    </div>
</div>