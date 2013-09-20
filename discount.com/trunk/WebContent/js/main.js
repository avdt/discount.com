$(document).ready(function() {
	$('#new-product-container #right-area :checkbox').change(function() {
		var $discount = $('#new-product-container #right-area #discount');
		
		if ($(this).prop('checked') == true) {
			$discount.show();
		} else {
			$discount.hide();
		}
	});
	
	$("#categories-carousel").carouFredSel({
		circular: false,
		infinite: false,
		auto 	: false,
		width	: 960,
		items	: {
			visible	: 4
		},
		prev	: {	
			button	: "#categories-carousel_prev",
			key		: "left"
		},
		next	: { 
			button	: "#categories-carousel_next",
			key		: "right"
		},
		pagination	: "#categories-carousel_pag"
	});


	$('#pop').popover();
	

	$('.product-small').popover();
	
	// tooltip for small products
	  $('.product-small').qtip({
		  content: {
		        text: function(event, api) {
		            // Retrieve content from custom attribute of the $('.selector') elements.
		        	var text = $(this).find(".popup-metadata");
		            return text;
		        }
		    },
		    style: {
		        tip: {
		            corner: 'left center'
		        }
		    }
	         });
	
});