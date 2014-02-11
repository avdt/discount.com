$(document).ready(function() {
	var $productProducers = $("#products .product-small .producer");
	var $products = $("#products .product-small");
	
	function filterByProducer() {
		
	}
	
	$(".producer-checkboxes :checkbox").change(function(e){
		var producer = $(this).attr("value");

		if ($(this).is(":checked")){
	        alert("checked Score: " + $(this).attr("value"));
	    }
	    else {
	        $.each($products, function(i, $product) {
	        	var actualProducer = $product.lastElementChild.textContent;
	        	if(actualProducer != producer){
	        		$product.attr("style","display: none;");
	        	}
        	});
	    }
	});
	
});
