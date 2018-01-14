<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="disable_box" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<input type="hidden" id="delType">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="disable_title1">提示信息</h4>
			</div>
			<div class="modal-body">
				<span id="disable_title2">请确认是否删除?</span>
				<p id="disable_content"></p>
			</div>
			<div class="modal-footer">
				<button type="button" id="disable_ok" class="btn btn-success"
					data-dismiss="modal">是</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">否</button>
			</div>
		</div>
	</div>
</div>

<script>
$('#disable_box').on('show.bs.modal', function(event) {
	var target = $(event.relatedTarget);
	var text = target.attr('text');
	$("#disable_title2").text(text);
});

$('#disable_box').on('hidden.bs.modal', function(event) {
	$("#disable_ok").unbind("click");
});
</script>