<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="product.ranges" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
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
									    	<a class="range-remove-icon" href="admin/range/delete/${range.id}"><i class="icon-remove" ></i></a>
									    	<a class="range-remove-icon" href="admin/range/edit/${range.id}"><i class="icon-pencil" ></i></a>
								    	</div>
								    	<div class="small-img-container">
										    <a href="ranges/get/${range.id}">
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
