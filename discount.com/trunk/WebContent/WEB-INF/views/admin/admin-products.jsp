<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="products.title" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="breadcrumb">
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li><a href="${pageContext.request.contextPath}/admin"><spring:message code="header.admin"/></a> <span class="divider">/</span></li>
			    <li class="active"><spring:message code="products.title"/></li>
		    </ul>
		</div>
	    <div class="title">
			<h3><spring:message code="products.title"/></h3>
			<hr/>
		</div>
		<div id="products">
							
			<ul class="nav nav-tabs" id="categoryTab">
			    <li class="active"><a href="#create_product" data-toggle="tab"><spring:message code="admin.tab.products.create" /></a></li>
			    <li><a href="#all_products" data-toggle="tab"><spring:message code="admin.tab.products.all" /></a></li>
			</ul>
			<div class="tab-content">
		  		
				<!-- CREATE PRODUCT -->
		    
				<div class="tab-pane fade in active" id="create_product">
				
			    	<form:form class="select-category-form">
					    <div class="dropdown">
						    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
						    	<spring:message code="admin.tab.category.select"/>
					    		<b class="caret"></b>
					    	</a>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
						    	<c:forEach items="${childCategories}" var="category">
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
				    <div>
				        <ul>
				        	<c:forEach items="${products}" var="product">
									
							    <div class="span3">
								    <div id="${product.id}" class="thumbnail product-small">
								    	<div class="action-icons">
									    	<a class="category-remove-icon" href="#deleteModal-${product.id}" data-toggle="modal"><i class="icon-remove" ></i></a>
									    	<a class="category-remove-icon" href="product/edit/${product.id}"><i class="icon-pencil" ></i></a>
									    	<spring:message var="modalQuestion" arguments="${product.name}" code="staticPage.delete.question"/>
									    	<spring:message var="modalTitle" arguments="${product.name}" code="staticPage.delete.title"/>
									    	<model:approve-window actionUrl="product/delete/${product.id}" id="${product.id}" question="${modalQuestion}" title="${modalTitle}"></model:approve-window>
								    	</div>
								    	<div class="small-img-container">
										    <a href="../products/get/${product.id}">
											    <img class="product-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${product.image}">
											    <h4>${product.name}</h4>
										    </a>
									    </div>
									    <div class="properties-container">
										    <p>${product.category.name}</p>
										    <p>${product.price}</p>
									    </div>
								    </div>
							    </div>
						    
						    </c:forEach>
					    </ul>
			    	</div>
		    
			    </div>
			</div>
		</div>
	</jsp:body>
</layout:page>
