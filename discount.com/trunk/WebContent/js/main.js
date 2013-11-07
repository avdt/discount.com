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
		        	var text = new Object();
		        	text = "<div class='product-info'><div id='settings'>";
		        	var $id = $(this).attr("id");
		        	text = buildProductTooltipText($id, text);
		        	
		            return text;
		        }
		    },
		    style: {
		        tip: {
		            corner: 'left center'
		        },
		        classes: 'qtip-bootstrap qtip-shadow qtip-rounded'
		    },
		    position: {
		        my: 'center left',
		        at: 'center right',
		        adjust: {
//		            x: 200
		        }
		    },
		    hide: {
		        fixed: true, // Let the user mouse into the tip
		        delay: 500 // Don't hide right away so that they can mouse into it
		     },
		     show: {
		         delay: 500
		     }
         });
	
	  var buildProductTooltipText = function(id, text) {
		  $.ajax({
			  url:"/discount/products/popup/" + id,
    	      async: false,  
    	      success:function(data) {
    	    	  text=data;
    	      },
    	      error:function(){
    	    	  alert("error");
    	      }
    	   });
		  return text;
	  };
	  
	  // tooltip for cart
	  $('#cart-info #product-count').qtip({
		  content: {
		        text: function(event, api) {
		        	var text = new Object();
		        	text = buildCartTooltipText(text);
		        	
		            return text;
		        }
		    },
		    style: {
		        tip: {
		            corner: 'top right'
		        },
		        classes: 'qtip-bootstrap qtip-shadow qtip-rounded'
		    },
		    position: {
		        my: 'top right',
		        at: 'bottom left',
		        adjust: {
		        	shift:true
		        }
		    },
		    hide: {
		        fixed: true, // Let the user mouse into the tip
		        delay: 500 // Don't hide right away so that they can mouse into it
		     },
		     show: {
		         delay: 500
		     }
         });
	  

	  var buildCartTooltipText = function(text) {
		  $.ajax({
			  url:"/discount/cart/popup/",
    	      async: false,  
    	      success:function(data) {
    	    	  text=data;
    	      },
    	      error:function(){
    	    	  alert("error");
    	      }
    	   });
		  return text;
	  };
});