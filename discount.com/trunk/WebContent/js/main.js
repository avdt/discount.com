$(document).ready(function() {
	$('#new-product-container #right-area :checkbox').change(function() {
		var $discount = $('#new-product-container #right-area #discount');
		
		if ($(this).prop('checked') == true) {
			$discount.show();
		} else {
			$discount.hide();
		}
	});
});