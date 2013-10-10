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
	    
	    <hr/>
	    <!-- ALL CATEGORIES -->
	    <div class="image_carousel">
			<div id="categories-carousel">
				<c:forEach items="${categories}" var="category">
					<div class="span3 thumbnail category-small"  data-placement="right" data-toggle="tooltip" data-original-title="Tooltip on right">
						<a href="${pageContext.request.contextPath}/products/${category.id}">
							<img class="category-img" alt="260x180" data-src="holder.js/260x180" src="http://${pageContext.request.serverName}:1234/${category.image}">
							<h4>${category.name}</h4>
						</a>
					</div>
				</c:forEach>
			</div>
			<div class="clearfix"></div>
			<a class="carousel-control left" id="categories-carousel_prev" href="#" data-slide="prev">&lsaquo;</a>
	    	<a class="carousel-control right" id="categories-carousel_next" href="#" data-slide="next">&rsaquo;</a>
			<div class="pagination" id="categories-carousel_pag"></div>
		</div>
	    
	</jsp:body>
</layout:page>
