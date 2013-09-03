<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="tab-pane fade" id="products">
					
	<ul class="nav nav-tabs" id="categoryTab">
	    <li class="active"><a href="#create_product" data-toggle="tab"><spring:message code="admin.tab.products.create" /></a></li>
	    <li><a href="#all_products" data-toggle="tab"><spring:message code="admin.tab.products.all" /></a></li>
	</ul>
	<div class="tab-content">
  		
		<!-- CREATE PRODUCT -->
    
		<div class="tab-pane fade in active" id="create_product">
		
	    	<form:form method="post" action="admin/category/add" commandName="product" enctype="multipart/form-data">
			    <div class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
				    	<spring:message code="admin.tab.category.select"/>
			    		<b class="caret"></b>
			    	</a>
				    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				    	<c:forEach items="${categories}" var="category">
						    <li role="presentation">
								<a href="${pageContext.request.contextPath}/admin/new-product/${category.id}" tabindex="-1" role="menuitem">${category.name}</a>
							</li>
						</c:forEach>
				    </ul>
			    </div>	
			</form:form>
	    </div>
	    
	    <!-- ALL PRODUCTS -->
	    
	    <div class="tab-pane fade" id="all_products">
	    All products
	    <div class="row-fluid">
	        <ul class="thumbnails">
	        	<c:forEach items="${products}" var="product">
						
				    <li class="span4">
					    <div class="thumbnail">
					    	<a class="category-remove-icon" href="admin/product/delete/${product.id}"><i class="icon-remove" ></i></a>
						    <a href="products/get/${product.id}">
							    <img data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
							    <h4>${product.name}</h4>
						    </a>
						    <p>${product.category.name}</p>
						    <p>${product.price}</p>
					    </div>
				    </li>
			    
			    </c:forEach>
		    </ul>
    	</div>
    
	    </div>
	</div>
</div>