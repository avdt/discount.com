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
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap-responsive.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/bootstrap/bootstrap.css" /> " />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/qtip/jquery.qtip.min.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/libs/jquery-ui/jquery-ui-1.10.3.custom.css" />" />

<script type="text/javascript" src="<c:url value="/js/libs/jquery/jquery-1.10.2.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/libs/bootstrap/bootstrap.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/libs/caroufredsel/jquery.carouFredSel-6.2.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/libs/qtip/jquery.qtip.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/libs/smartspinner/smartspinner.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/main.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/admin.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/cart.js" /> "></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<jsp:invoke fragment="extraHeader" />
</head>
<body>
	<layout:grt-header/>
	<div class="container">
		<layout:header />
		<div class="content">
			<jsp:doBody />
		</div>
	</div>
	<layout:footer />
	<jsp:invoke fragment="extraBottom" />
</body>
</html>
