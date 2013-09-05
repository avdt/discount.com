<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<layout:page title="${category.name}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>

	    <div id="category-title">
	    	<div>
	    		<h3>${category.name}</h3>
	    		<hr>
	    	</div>
	    </div>
		<div id="products">
		
		    <div class="row-fluid">
		        <ul class="thumbnails">
		        	<c:forEach items="${productsByCategory}" var="product">
							
					    <li class="span4">
						    <div class="thumbnail">
							    <a href="get/${product.id}">
								    <img data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
								    <h4>${product.name}</h4>
							    </a>
							    <p>${product.category.name}</p>
							    <p>${product.price}</p>
							    
							    <c:forEach items="${product.settings}" var="setting">
								    <dl class="dl-horizontal">
									    <dt class="setting-name">${setting.propertyName}</dt>
									    <dd class="setting-value">${setting.propertyValue}</dd>
								    </dl>
								</c:forEach>
						    </div>
					    </li>
				    
				    </c:forEach>
			    </ul>
	    	</div>
		</div>	    
	    
	</jsp:body>
</layout:page>
