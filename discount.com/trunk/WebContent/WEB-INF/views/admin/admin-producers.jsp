<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="tab-pane fade" id="producers">
					
	<ul class="nav nav-tabs" id="categoryTab">
	    <li class="active"><a href="#create_producer" data-toggle="tab"><spring:message code="admin.tab.producer.create" /></a></li>
	    <li><a href="#all_producers" data-toggle="tab"><spring:message code="admin.tab.producer.all" /></a></li>
	</ul>
	<div class="tab-content">
  		
		<!-- CREATE PRODUCER -->
    
		<div class="tab-pane fade in active" id="create_producer">
		
	    	 <form:form method="post" action="admin/new-producer/add" commandName="producer" enctype="multipart/form-data">
				<spring:message code="admin.tab.producer.name" var="producerName"/>
					
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
							    <a href="producers/get/${producer.id}">
								    <img class="producer-img" data-src="holder.js/300x200" alt="" src="http://${pageContext.request.serverName}:1234/${producer.image}">
								    <h4>${producer.name}</h4>
							    </a>
						    </div>
					    </li>
				    
				    </c:forEach>
			    </ul>
	    	</div>
    
	    </div>
	</div>
</div>