<%@ attribute name="title" required="true" %>
<%@ attribute name="question" required="true"%>
<%@ attribute name="id" required="true"%>
<%@ attribute name="actionUrl" required="true"%>

<div id="deleteModal-${id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3 id="myModalLabel">${title}</h3>
	</div>
	<div class="modal-body">
		<p>${question}</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
		<a href="${actionUrl}" class="btn btn-primary">Yes</a>
	</div>
</div>
