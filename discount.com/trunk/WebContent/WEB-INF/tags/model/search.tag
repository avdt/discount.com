<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="search">
	<form:form class="form-search" method="get" action="${pageContext.request.contextPath}/search" commandName="searchResults">
		<spring:message code="general.search" var="search"/>
	    <form:input id="search-input" path="keyword" type="text" class="input-large" placeholder="${search}" ></form:input>
	    <spring:message code="admin.tab.category.all" var="allCategories"/>
	    <form:select class="searchCategories" path="serchedCategoryId">
	    	<form:option value="-1" label="${allCategories}"></form:option>
	    	<c:forEach var="category" items="${childCategories}">
	    		<form:option value="${category.id}" label="${category.name}"/>
	    	</c:forEach>
	    </form:select>
    
    	<button id="search-botton" type="submit" class="btn"><i class="icon-search"></i></button>
	</form:form>
</div>