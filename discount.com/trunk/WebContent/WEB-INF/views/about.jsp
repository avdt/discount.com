<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<layout:page title="Admin Tools">
	<jsp:attribute name="extraHeader">
    	<link rel="stylesheet" type="text/css"
			href="<c:url value="/css/index.css" />" />
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
	    Info about us will be here.
	</jsp:body>
</layout:page>
