<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib tagdir="/WEB-INF/tags/model" prefix="model"%>
<layout:page title="Alfero">
	<jsp:attribute name="extraHeader">
    </jsp:attribute>
	<jsp:attribute name="extraBottom">
    </jsp:attribute>
	<jsp:body>
		<div id="producers-list">
			<c:forEach items="${allProducers}" var="producer">
				<model:producer producer="${producer}" url="products/producer/"></model:producer>
		    </c:forEach>
		</div>
	
		<div>
	        <div id="home-page-banner" class="carousel slide home-page-banner">
			    <ol class="carousel-indicators">
			    <li data-target="#home-page-banner" data-slide-to="0" class="active"></li>
			    <li data-target="#home-page-banner" data-slide-to="1"></li>
			    <li data-target="#home-page-banner" data-slide-to="2"></li>
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
			    <a class="carousel-control left" href="#home-page-banner" data-slide="prev">&lsaquo;</a>
			    <a class="carousel-control right" href="#home-page-banner" data-slide="next">&rsaquo;</a>
		    </div>
		</div>
	
	    <hr/>
	    <!-- ALL CATEGORIES -->
	    <div class="image_carousel">
			<div id="categories-carousel">
				<c:forEach items="${categories}" var="category">
					<model:category category="${category}" url="products/"></model:category>
				</c:forEach>
			</div>
			<div class="clearfix"></div>
			<a class="carousel-control left" id="categories-carousel_prev" href="#" data-slide="prev">&lsaquo;</a>
	    	<a class="carousel-control right" id="categories-carousel_next" href="#" data-slide="next">&rsaquo;</a>
			<div class="pagination" id="categories-carousel_pag"></div>
		</div>
	    
	</jsp:body>
</layout:page>
