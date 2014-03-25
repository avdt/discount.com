$(document).ready(function() {
	var $loginInput = $(".content #register-user-container .registration-input #login");
	var $errorMessage = $(".content #register-user-container .registration-input #duplicate-user-error");
	$loginInput.blur(function() {
	    
		var login = $(this).val();
		
		$.ajax({
			type : "GET",
			url : "/discount/rest/validate/" + login,
			async: false,  
	  	    success:function(data) {
	  	    	isValid = data;
	  	    }
		});
		
		if(!isValid){
			$errorMessage.show();
		} else {
			$errorMessage.hide();
		}
		
	});
});