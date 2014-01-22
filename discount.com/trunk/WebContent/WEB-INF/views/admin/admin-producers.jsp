<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="general.producers" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div class="title">
			<h3><spring:message code="general.producers"/></h3>
			<hr/>
		</div>
	
		<div id="producers">
							
			<ul class="nav nav-tabs" id="categoryTab">
			    <li class="active"><a href="#create_producer" data-toggle="tab"><spring:message code="admin.tab.producer.create" /></a></li>
			    <li><a href="#all_producers" data-toggle="tab"><spring:message code="admin.tab.producer.all" /></a></li>
			</ul>
			<div class="tab-content">
		  		
				<!-- CREATE PRODUCER -->
		    
				<div class="tab-pane fade in active" id="create_producer">
				
			    	 <form:form method="post" action="admin/new-producer/add" commandName="producer" enctype="multipart/form-data">
						<spring:message code="admin.tab.producer.name" var="producerName"/>
						<spring:message code="admin.tab.products.description" var="producerDescription"/>
							
					    <div class="categories">
					    	<form:checkboxes items="${allCategories}" path="categoriesIds" itemLabel="name" itemValue="id" />
					    </div>
					    <div id="proerties">
						    <div>
								<form:input path="file" type="file" id="upload" name="upload"/>
							</div>
					     	<div>
								<form:input path="name" type="text" placeholder="${producerName}"/>
							</div>
							<div>
								<form:textarea path="description" type="text" placeholder="${producerDescription}"/>
							</div>
						</div>
						<div id="create-producer-btn">
				     		<input type="submit" value="<spring:message code="general.save"/>" />
			     		</div>
					</form:form>
			    </div>
			    
			    <!-- ALL PRODUCERS -->
			    
			    <div class="tab-pane fade" id="all_producers">
				    <div class="row-fluid">
				        <ul class="thumbnails">
				        	<c:forEach items="${producers}" var="producer">
									
							    <li class="span3">
								    <div id="${producer.id}" class="thumbnail producer-small">
								    	<a class="category-remove-icon" href="admin/producer/delete/${producer.id}"><i class="icon-remove" ></i></a>
								    	<a class="category-remove-icon" href="admin/producer/edit/${producer.id}"><i class="icon-pencil" ></i></a>
									    <a href="products/producer/${producer.id}">
										    <img class="producer-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${producer.image}">
									    </a>
								    </div>
							    </li>
						    
						    </c:forEach>
					    </ul>
			    	</div>
		    
			    </div>
			</div>
		</div>
	</jsp:body>
</layout:page>
