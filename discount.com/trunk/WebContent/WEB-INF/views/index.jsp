<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<layout:page title="Alfero">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
        <div id="myCarousel" class="carousel slide">
		    <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		    <!-- Carousel items -->
		    <div class="carousel-inner">
		    <div class="active item">
		    	<img alt="" src="http://localhost:1234/images/bootstrap-mdo-sfmoma-01.jpg">
		    </div>
		    <div class="item">
		    	<img alt="" src="http://localhost:1234/images/bootstrap-mdo-sfmoma-02.jpg">
		    </div>
		    <div class="item">
		    	<img alt="" src="http://localhost:1234/images/bootstrap-mdo-sfmoma-03.jpg">
		    </div>
		    </div>
		    <!-- Carousel nav -->
		    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	    </div>
	</jsp:body>
</layout:page>
