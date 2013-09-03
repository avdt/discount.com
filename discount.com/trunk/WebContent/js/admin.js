$(document).ready(function() {
	var categorySettingsCount=0;
	
	$("#toolll").hover(
		function () {
			$(this).tooltip('toggle');
		});
	
	
	$("#toolllllll").hover(
		function () {
			$(this).tooltip('toggle');
		});
	
	
	$('#adminTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	
	$('#add-category-setting').click(function(e) {
		categorySettingsCount++;
		var categorySettings = '<div class="category-setting"><input id="settings0.fieldName" type="text" value="" placeholder="Property name" name="settings['+ categorySettingsCount +'].fieldName"><select id="settings0.fieldType" name="settings['+ categorySettingsCount +'].fieldType"><option>TEXT</option><option>NUMBER</option></select></div>';
		$('.category-settings-container').append(categorySettings);
	});
	
	$("#field-type-select").change(function () {
		if($( "#myselect option:selected" ).text()=="NUMBER")
		{
			$("category-setting").append();
		}
		
		})
		.trigger('change');
});