<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<layout:page title="${user.fullName}">
	<jsp:attribute name="extraHeader">
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/product-page.css" />" />
		<script type="text/javascript" src="<c:url value="/js/product-page.js" /> "></script>
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div>
		    <ul class="breadcrumb">
			    <li><a href="${pageContext.request.contextPath}"><spring:message code="general.home"/></a> <span class="divider">/</span></li>
			    <li class="active"><spring:message code="profile"/></li>
		    </ul>
		</div>
		<div id="profile">
			<form:form method="post" action="${pageContext.request.contextPath}/profile/${user.login}/update" commandName="user" enctype="multipart/form-data">
			    <div class="left-area">
				    <a  href="#full-iamge-modal" role="button" data-toggle="modal">
				    	<img src="http://${pageContext.request.serverName}:1234/${user.image}" class="img-polaroid product-img">
			    	</a>
			    	<!-- Modal -->
					<div id="full-iamge-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<button type="button" class="close modal-close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="modal-body">
							<img src="http://${pageContext.request.serverName}:1234/${user.image}" class="img-rounded">
						</div>
					</div>
			    </div>
			    <div class=right-area>
			    	<div>
			    		<form:input path="firstName"/>
		    		</div>
		    		<div>
			    		<form:input path="login"/>
		    		</div>
		    		<div>
			    		<form:input path="email"/>
		    		</div>
		    		<div>
			    		<form:input path="phoneNumber"/>
		    		</div>
		    		<div>
			    		<form:input path="address"/>
		    		</div>
		    		<div>
				    	Roles:
				    	<form:checkboxes items="${roles}" itemLabel="role" path="${user.roles}"/>
				    	
				    	<%-- <c:forEach items="${user.roles}" var="role">
					    	<div>
					    		<span>${role.role}</span>
				    		</div>		    		
				    	</c:forEach> --%>
			    	</div>
			    </div>
			    
		     	<input type="submit" value="<spring:message code="general.save"/>" />
		    </form:form>
	    </div>
	</jsp:body>
</layout:page>
