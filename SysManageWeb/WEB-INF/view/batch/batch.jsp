<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="s" uri="/auth"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>批量控制维护</title>
<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/css/xenon-core.css">
<link rel="stylesheet" href="../assets/css/xenon-forms.css">
<link rel="stylesheet" href="../assets/css/xenon-components.css">
<link rel="stylesheet" href="../assets/css/xenon-skins.css">
<link rel="stylesheet" href="../assets/css/custom.css">
<link rel="stylesheet" href="../assets/js/select2/select2.css">
<link rel="stylesheet" href="../assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="../css/app.css">

<script src="../assets/js/jquery-1.11.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<style type="text/css">
#edit,#monitor {margin:10px;width:80px;}
#choice1,#choice2 {width:10px;}
.disabled {background-color: #eeeeee;}
body {overflow:hidden;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
<s:enums keys='batstep_type' />
<div class="page-container">
	<div class="main-content">
		<form id="myform">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">批处理设置</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="s_unitId" class="control-label">批处理编号</label>
							
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input id="choice1" type="radio" value="0" name="choice" checked="checked">存在</input>
							<select name="batchId" id="batchId" validate='{required:true}' ></select>
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							
						</div>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="s_unitId" class="control-label"></label>
							
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="s_unitId" class="control-label"></label>
							<input id="choice2" type="radio" value="1" name="choice">新建</input>
							<input type="text" id='newbatchid' class='form-control disabled' disabled='disabled'></input>
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
						</div>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-blue glyphicon glyphicon-plus" id="edit">
								<input type="checkbox" >维护</input>
							</label>

							<label class="btn btn-blue glyphicon glyphicon-pencil" id="monitor">
								<input type="checkbox" >监控</input>
							</label>
						</div>
					</div>
					<div class="col-md-4">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>

</body>
<script type='text/javascript'>
	var type = '${param.type}';
	$( function() {
		$('#edit').bind('click', editBatch);
		$('#monitor').bind('click', monitorBatch);
		$('#choice1').bind('click',changeType1);
		$('#choice2').bind('click',changeType2);
		WebUtils.bindSelectFromUrl("batchId","batch/ids","data","batchId","batchId");
	});
	function changeType1(e) {
		if ( e.target.checked) {
			$('#newbatchid').addClass('disabled').attr('disabled','disabled');
			$('#batchId').removeClass('disabled').removeAttr('disabled');
			$('#monitor').addClass('l-button').removeAttr('disabled');
		}
	};
	function changeType2(e) {
		if ( e.target.checked) {
			$('#batchId').addClass('disabled').attr('disabled','disabled');
			$('#newbatchid').removeClass('disabled').removeAttr('disabled');
			$('#monitor').removeClass('l-button').attr('disabled','disabled');
		}
	};
	function editBatch() {
		var bid = '';
		var type = '';
		if ($('#choice1:checked').val()) {
			bid = $('#batchId').val();
			type = 'old';
		}
		else {
			type = 'new';
			bid = $('#newbatchid').val();
			if (!bid) {
				WebUtils.alert('新建时，必须输入新ID');
				return;
			}
		}
		parent.WebUtils.openTab('batchedit' + bid,'批处理' + bid,'batchedit?type='+type+'&bid=' + bid);
	};
	function monitorBatch() {
		if ($('#choice1').attr('checked')) {
			var url = '${_CONTEXT_PATH}/jsp/sysmgr/batch/choiceinst.jsp?bid=' + $('#batchId').val();
			$.dialogBox.openDialog(url, {id : 'choiceinst',height : '180px',width : '380px',lock : true,opacity : 0.07,title : '选择监控实例ID'}, toMonitorPage,true);
		}
	};
	function toMonitorPage(p) {
		var instid = p.getInstId();
		var bid = $('#batchId').val();
		if (instid) {
			WebUtils.openTab('batchmonitor' + bid,'监控' + bid,'${_CONTEXT_PATH}/jsp/sysmgr/batch/batchmonitor.jsp?bid=' + bid +'&iid=' +instid);
		}
		else {
			return false;
		}
	};
	
</script>
</html>