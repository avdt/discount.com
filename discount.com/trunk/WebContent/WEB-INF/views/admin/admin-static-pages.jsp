<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="admin.tab.staticPages" var="title"/>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    <div class="title">
			<h3><spring:message code="admin.tab.staticPages"/></h3>
			<hr/>
		</div>
		<div id="static-pages">
							
		  		
				<!-- CREATE STATIC PAGE -->
		    
				<div id="create_static_page">
					<a href="content/add-static-page"><spring:message code="staticPage.create"/><i class="icon-plus-sign"></i></a>
			    	
			    </div>
			    
			    <!-- ALL STATIC PAGES -->
			    
			    <div id="all_static_pages">
			    	<c:if test="${staticPages!=null and !staticPages.isEmpty()}">
					    <div>
					        <ul>
					        	<c:forEach items="${staticPages}" var="staticPage">
										
								    <div class="span3">
									    <div id="${staticPage.id}">
									    	<div class="action-icons">
										    	<a class="category-remove-icon" href="admin/product/delete/${staticPage.id}"><i class="icon-remove" ></i></a>
										    	<a class="category-remove-icon" href="admin/product/edit/${staticPage.id}"><i class="icon-pencil" ></i></a>
									    	</div>
									    	<div class="small-img-container">
											    <a href="${pageContext.request.contextPath}/${staticPage.url}">
												    <h4>${staticPage.title}</h4>
											    </a>
										    </div>
									    </div>
								    </div>
							    
							    </c:forEach>
						    </ul>
				    	</div>
		    		</c:if>
			    </div>
			</div>
	</jsp:body>
</layout:page>
