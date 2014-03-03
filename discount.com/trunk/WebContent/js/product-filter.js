$(document).ready(function() {
	
	$(function() {
		 
	    var menu_ul = $('.menu > li > ul'),
	        menu_a  = $('.menu > li > a');
	     
	    menu_ul.hide();
	 
	    menu_a.click(function(e) {
	        e.preventDefault();
	        if(!$(this).hasClass('active')) {
	            menu_a.removeClass('active');
	            menu_ul.filter(':visible').slideUp('normal');
	            $(this).addClass('active').next().stop(true,true).slideDown('normal');
	        } else {
	            $(this).removeClass('active');
	            $(this).next().stop(true,true).slideUp('normal');
	        }
	    });
	 
	});
	
	$(".producer-checkboxes :checkbox").change(function(e){
		if ($(this).is(":checked")){
			$("#products .product-small").each(function () {
	        	var actualProducer = $(this).find(".producer").text();
	        	if(matchSelectedValues(actualProducer)){
	        		$(this).parent().show();
	        	} else {
	        		$(this).parent().hide();
	        	}
        	});
	    }
	    else {
	    	if(isAllUnchecked()){
	    		$("#products .product-small").parent().show();
	    	} else {
		    	$("#products .product-small").each(function () {
		        	var actualProducer = $(this).find(".producer").text();
		        	if(matchSelectedValues(actualProducer)){
		        		$(this).parent().show();
		        	} else {
		        		$(this).parent().hide();
		        	}
	        	});
	    	}
	    }
	});
	
	function matchSelectedValues(actualValue) {
		var result = false;
		
		$(".producer-checkboxes :checkbox").each(function () {
			if ($(this).is(":checked")){
				var producer = $(this).attr("value");
				if(producer == actualValue){
					result = true;
				}
			}
    	});
		return result;
	}
	
	function isAllUnchecked() {
		var result = true;
		$(".producer-checkboxes :checkbox").each(function () {
			if ($(this).is(":checked")){
				result = false;
			}
    	});
		return result;
	}
	

	//	Product sorting
	$('#sort-order').change(function() {
	    var sortOrder = $(this).find('option:selected').val();
	    var $products = $('#products .span3');
	    if(sortOrder=="asc"){
	    	$products.tsort({order:"asc", attr:'data-price'});
	    } else if(sortOrder == "desc"){
	    	$products.tsort({order:"desc", attr:'data-price'});
	    } else if(sortOrder=="byName") {
	    	$products.tsort({order:"asc", attr:'data-name'});
	    }
	});
	
	
});
