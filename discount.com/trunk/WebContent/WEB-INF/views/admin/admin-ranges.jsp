<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="product.ranges" var="title"/>
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
			    <li class="active"><spring:message code="product.ranges"/></li>
		    </ul>
		</div>
	    <div class="title">
			<h3><spring:message code="product.ranges"/></h3>
			<hr/>
		</div>
		<div id="ranges">
							
			<ul class="nav nav-tabs" id="rangeTab">
			    <li class="active"><a href="#create_range" data-toggle="tab"><spring:message code="admin.tab.ranges.create" /></a></li>
			    <li><a href="#all_ranges" data-toggle="tab"><spring:message code="admin.tab.ranges.all" /></a></li>
			</ul>
			<div class="tab-content">
		  		
				<!-- CREATE RANGE -->
		    
				<div class="tab-pane fade in active" id="create_range">
				
			     	<form:form class="select-category-form">
					    <div class="dropdown">
						    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
						    	<spring:message code="admin.tab.producer.select"/>
					    		<b class="caret"></b>
					    	</a>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
						    	<c:forEach items="${producers}" var="producer">
								    <li role="presentation">
										<a href="${pageContext.request.contextPath}/admin/new-range/${producer.id}" tabindex="-1" role="menuitem">${producer.name}</a>
									</li>
								</c:forEach>
						    </ul>
					    </div>	
					</form:form>
			    </div>
			     
			    <!-- ALL RANGES -->
			    
			    <div class="tab-pane fade" id="all_ranges">
				     <div>
				        <ul>
				        	<c:forEach items="${ranges}" var="range">
									
							    <div class="span3">
								    <div id="${range.id}" class="thumbnail range-small">
								    	<div class="action-icons">
									    	<a class="range-remove-icon" href="#deleteModal-${range.id}" data-toggle="modal"><i class="icon-remove" ></i></a>
									    	<a class="range-remove-icon" href="range/edit/${range.id}"><i class="icon-pencil" ></i></a>
								    		<spring:message var="modalQuestion" arguments="${range.name}" code="staticPage.delete.question"/>
									    	<spring:message var="modalTitle" arguments="${range.name}" code="staticPage.delete.title"/>
									    	<model:approve-window actionUrl="range/delete/${range.id}" id="${range.id}" question="${modalQuestion}" title="${modalTitle}"></model:approve-window>
								    	</div>
								    	<div class="small-img-container">
										    <a href="../products/producer/range/${range.id}">
											    <img class="range-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${range.image}">
											    <h4>${range.name}</h4>
										    </a>
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
