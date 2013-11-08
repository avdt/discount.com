$(document).ready(function() {
	$('.smartspinner').spinit({min:1,max:200,stepInc:1,pageInc:1, width:30, height: 15, callback: calculatePrice });
	
	function calculatePrice() {
		
	}
	
});