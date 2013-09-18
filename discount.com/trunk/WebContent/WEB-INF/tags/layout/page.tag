<%@ tag description="Page layout"%>
<%@ attribute name="title" required="true" description="Page title"%>
<%@ attribute name="extraHeader" fragment="true"
	description="Extra header code"%>
<%@ attribute name="extraBottom" fragment="true"
	description="Extra body code"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Essential scripts -->
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-responsive.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css" />" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/jquery.carouFredSel-6.2.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/main.js" /> "></script>
<!-- Process the given input fragment -->
<jsp:invoke fragment="extraHeader" />
</head>
<body>
	<div class="container">
		<layout:header />
		<div class="content">
			<jsp:doBody />
		</div>
		<layout:footer />
	</div>
	<jsp:invoke fragment="extraBottom" />
</body>
</html>
