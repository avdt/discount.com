<%@ attribute name="title" required="true" %>
<%@ attribute name="question" required="true"%>
<%@ attribute name="pageUrl" required="true"%>

<div id="deleteModal-${pageUrl}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3 id="myModalLabel">${title}</h3>
	</div>
	<div class="modal-body">
		<p>${question}</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
		<a href="delete/${pageUrl}" class="btn btn-primary">Yes</a>
	</div>
</div>
