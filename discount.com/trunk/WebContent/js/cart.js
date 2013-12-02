$(document).ready(function() {

	$( ".spinner" ).spinner({ 
		min: 1, 
		change: function( event, ui ) {change();},
		spin: function( event, ui ) {calculatePrice(event, ui);}
	});
	
	function change() {
		alert(1);
		// do post call to update cart object
		
		// $.ajax({
		// type : "PUT",
		// url : "/rest/",
		// data : {
		// "productId" : "id",
		// "productCount" : "count"
		// }
		// });
	}
	
	function calculatePrice(event, ui) {
		
		var productCount = ui.value;
		var productId = event.target.id;
		
		
		var $product = $("#" + productId + "-value");
		
		var productPrice = getProductPrice(productId);
		
		$product.text(productPrice * productCount);
	}
	
	function getProductPrice(productId) {
		var productPrice;
		
		 $.ajax({
			  url:"/discount/rest/product/get/" + productId,
   	      async: false,  
   	      success:function(data) {
   	    	  productPrice = data.price;
   	      },
   	      error:function(){
   	    	  alert("error");
   	      }
   	   });
		  return productPrice;
	}

});