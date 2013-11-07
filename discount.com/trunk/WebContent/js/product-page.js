$(document).ready(function() {

	var showNewReviewForm = function() {
		$("#new-review").show();
	};

	$("#add-review a").click(function(e) {
		showNewReviewForm();
	});
});