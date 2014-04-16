<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:message code="admin.tab.staticPages" var="title"/>
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
			    <li class="active"><spring:message code="admin.tab.staticPages"/></li>
		    </ul>
		</div>
	    <div class="title">
			<h3><spring:message code="admin.tab.staticPages"/></h3>
			<hr/>
		</div>
		<div id="static-pages">
			    <!-- ALL NOTIFICATIONS -->
			    
			    <div id="all_static_pages">
			    	<c:if test="${notifications!=null and !notifications.isEmpty()}">
					    <div>
					        <ul>
					        	<c:forEach items="${notifications}" var="notification">
										
								    <div class="span3">
									    <div id="${notification.id}">
									    	<div class="action-icons">
										    	<a role="button" data-toggle="modal" class="category-remove-icon" href="#deleteModal-${notification.id}"><i class="icon-remove" ></i></a>
										    	<a class="category-remove-icon" href="edit-notification/${notification.type}"><i class="icon-pencil" ></i></a>
										    	<spring:message var="modalQuestion" arguments="${notification.type.value}" code="staticPage.delete.question"/>
										    	<spring:message var="modalTitle" arguments="${notification.type.value}" code="staticPage.delete.title"/>
										    	<model:approve-window actionUrl="delete/${notification.id}" id="${notification.id}" question="${modalQuestion}" title="${modalTitle}"></model:approve-window>
									    	</div>
									    	<div class="small-img-container">
											    <a href="${pageContext.request.contextPath}${notification.id}">
												    <h4>${notification.type.value}</h4>
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
