<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<c:set var="title" value="${staticPage.title}"></c:set>
<layout:page title="${title}">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    ${staticPage.title}
	</jsp:body>
</layout:page>
