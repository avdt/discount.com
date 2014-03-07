$(document).ready(function() {
	
	$(window).bind('scroll', function(){
	    var $btn = $('.container .masthead #head-top #search');
	    var smallHeader = $("#header-small");
	    
	    var scorllTop = $(window).scrollTop();
	    var a = ($btn.offset().top+$btn.height());
	    
	    if(scorllTop > a) {
	        smallHeader.slideDown(200);
	    } else {
	    	smallHeader.slideUp(200);
	    }
	});
});