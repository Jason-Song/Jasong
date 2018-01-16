<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %><%@ taglib prefix="s" uri="/auth" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Main Page</title>

	<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/xenon-core.css">
	<link rel="stylesheet" href="../assets/css/xenon-forms.css">
	<link rel="stylesheet" href="../assets/css/xenon-components.css">
	<link rel="stylesheet" href="../assets/css/xenon-skins.css">
	<link rel="stylesheet" href="../assets/css/custom.css">

	<script src="../assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv.min.js"></script>
		<script src="../assets/js/respond.min.js"></script>
	<![endif]-->

</head>
<body class="page-body">
	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
	<div class="page-container">
    	<div class="main-content">

			<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">角色列表</h3>
					
					<div class="panel-options">
						<a href="#" data-toggle="panel">
							<span class="collapse-icon">&ndash;</span>
						<span class="expand-icon">+</span>
						</a>
					</div>
				</div>
			<div class="panel-body">
				<h4 class="text-muted">过滤条件设置</h4>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_roleId" placeholder="角色ID" >
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_roleName" placeholder="角色名称">
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_remark" placeholder="角色的具体信息">
						</div>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group pull-right">
							<button type="button" class="btn btn-success" id="filter_button">过滤</button>
						</div>	
					</div>
				</div>
			</div>
			<div class="panel-body-">
				
					<div class="row">
	                    <div class="col-md-9">
		                     <div class="btn-group" data-toggle="buttons">
								<s:authif key='insert' scope="m5_3">
								<label class="btn btn-blue glyphicon glyphicon-plus" id="addbutton">
									<input type="checkbox">新增</input>
								</label>
								</s:authif>
								<label class="btn btn-blue glyphicon glyphicon-pencil" id="updbutton">
									<input type="checkbox">修改</input>
								</label>
								<label class="btn btn-blue glyphicon glyphicon-trash" id="delbutton">
									<input type="checkbox">删除</input>
								</label>
								<label class="btn btn-blue glyphicon glyphicon-trash" id="bmenugrant">
									<input type="checkbox">菜单权限</input>
								</label>
								<label class="btn btn-blue glyphicon glyphicon-trash" id="burlgrant">
									<input type="checkbox">URL权限</input>
								</label>
								<label class="btn btn-blue glyphicon glyphicon-trash" id="bfuncgrant">
									<input type="checkbox">功能点权限</input>
								</label>
							</div>
	                	</div>
	                    <div class="col-md-3">
	                    	<div>
		                    	<li class="hiden-columns-title pull-right">
									<a href="#">
										<span>隐藏列<i class="fa-angle-down"></i>
										</span>
									</a>
									<ul class="hiden-columns">
									</ul>
								</li>
							</div>
	                    </div>
	                </div>
					<table class="table table-bordered table-striped nowrap" id="roletable" style="width:100%;">
						<thead>
							<tr>
								<th>角色ID</th>
								<th>角色名称</th>
								<th>角色具体描述</th>
								<th>更新用户</th>
								<th>更新时间</th>
							</tr>
						</thead>
						<tbody class="middle-align">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="detail">
		<div class="modal-dialog" >
			<div class="modal-content">
				<form method="post" class="validate" onsubmit="return submitDetail()">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title"></h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="roleId" class="control-label">角色ID</label>
								<input type="text" class="form-control" id="roleId" name="roleId" placeholder="请输入角色ID，以字母开头，字母和数字" 
								  data-validate="required" data-message-required="此项必须输入.">
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="roleName" class="control-label">角色名称</label>
								<input type="text" class="form-control" id="roleName" name="roleName" placeholder="请输入角色的中文名称"
									data-validate="required" data-message-required="此项必须输入.">
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group no-margin">
								<label for="remark" class="control-label">详细描述</label>
								
								<textarea class="form-control autogrow" id="remark" name="remark" placeholder="描述该角色的具体信息"></textarea>
							</div>	
							
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-blue" >保存</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<!-- Imported styles on this page -->
<link rel="stylesheet" href="../assets/js/datatables/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="../assets/js/select2/select2.css">
<link rel="stylesheet" href="../assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="../assets/js/multiselect/css/multi-select.css">
<link rel="stylesheet" href="../css/app.css">

<!-- Bottom Scripts -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/TweenMax.min.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/xenon-api.js"></script>
<script src="../assets/js/xenon-toggles.js"></script>
<script src="../assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/moment.min.js"></script>

<!-- Imported scripts on this page -->
<script src="../assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<script type="text/javascript">
$(function () {
	//初始化列表
	var initparams = {
			"ajax": {
	            "url": "role/list",
	            "type": "POST",
	            "data": function ( d ) {
	            	var orders = d.order;
	                for (var i =0; i < orders.length; i++) {
	                	d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
		                d["norder["+i+"][dir]"] = orders[i]['dir'];
	                }
	                d.s_roleId=$('#s_roleId').val();
	                d.s_roleName=$('#s_roleName').val();
	                d.s_remark=$('#s_remark').val();
	            }
	        },
			"columns": [
				{ "data": "roleId" },
				{ "data": "roleName" },
				{ "data": "remark" },
				{ "data": "updUser"},
				{ "data": "updTime"}
			]
		}
	var params = $.extend({},WebUtils.settings, initparams);
    var table= $("#roletable").DataTable(params);
	WebUtils.initColumnHider(table);

	//过滤条件设置按钮
	$('#filter_button').click( function () {
		table.draw();
		$('.panel-default').addClass('collapsed');
	});

	//删除
	$('#delbutton').click( function () {
		var table = $("#roletable").DataTable();
    	var data = table.rows('.selected').data();
    	if (data) {
    		var sdata = [];
    		for (var x =0; x< data.length; x ++) {
    			sdata.push(data[x]);
    		}
    		var str =  JSON.stringify(sdata);
    		WebUtils.ajaxSubmitJson('role/delete',str,function(result){
    			WebUtils.alert(result.msg)
    			table.draw();
			});
    	}
    } );
	
	//新增
	$('#addbutton').click( function () {
		jQuery('#detail').modal('show', {backdrop: 'static',action: "role/add",title:"新增角色"});
    });
	
	//修改
	$('#updbutton').click( function () {
		var table = $("#roletable").DataTable();
		var data = table.rows('.selected').data();
		if (data.length == 1) {
			jQuery('#detail').modal('show', {backdrop: 'static',action: "role/update",title:"修改角色"});
		}
		else {
			WebUtils.alert("请选择一个角色");
		}
    });
	
	//菜单权限
	$('#bmenugrant').click( function () {
		var table = $("#roletable").DataTable();
		var data = table.rows('.selected').data();
    	if (data) {
    		if (data.length == 1) {
    			var url= "/sys/menugrant?id=" + data[0].roleId + "&rolename=" + data[0].roleName;
    			parent.openPage("menugrant","菜单权限分配",url);
    		}
    		else {
    			WebUtils.alert("只能选一个角色");
    		}
    	}
    });
	//URL权限
	$('#burlgrant').click( function () {
		var table = $("#roletable").DataTable();
		var data = table.rows('.selected').data();
    	if (data) {
    		if (data.length == 1) {
    			var url = "/sys/urlgrant?id=" + data[0].roleId + "&rolename=" + data[0].roleName;
    			parent.openPage("urlgrant","URL权限分配",url);
    		}
    		else {
    			WebUtils.alert("只能选一个角色");
    		}
    	}
    });
	//功能点权限
	$('#bfuncgrant').click( function () {
		var table = $("#roletable").DataTable();
		var data = table.rows('.selected').data();
    	if (data) {
    		if (data.length == 1) {
    			var url = "/sys/funcgrant?id=" + data[0].roleId + "&rolename=" + data[0].roleName;
    			parent.openPage("funcgrant","功能点权限分配",url);
    		}
    		else {
    			WebUtils.alert("只能选一个角色");
    		}
    	}
    });
	//明细对话框消失后刷新
	$('#detail').on('hidden.bs.modal', function (event) {
		 $("#roletable").DataTable().draw();
	});
	
	//明细对话框显示后处理
	$('#detail').on('show.bs.modal', function (event) {
		//设置详细对话框内容
		var button = $(event.relatedTarget);
		var modal = $(this);
		modal.find('.modal-title').text(button.attr('title'));
		modal.find('form').attr("action", button.attr('action'));
        //清除原来的校验
        $('#detail form').validate().resetForm();
        $('#detail .form-group').removeClass('validate-has-error');

		if (button.attr('action') == 'role/add') {
			$('#roleId').removeAttr('readonly');
			$('#detail form')[0].reset();
		}
		else {
			$('#roleId').attr('readonly','true');
			var data = table.row('.selected').data();
			if (data) {
				$('#roleId').val(data['roleId']);
				$('#roleName').val(data['roleName']);
				$('#remark').val(data['remark']);
			}
		}
	});
});

function submitDetail() {
	var form = $('#detail form');
	if (form.valid()) {
		var url = form.attr('action');
		var data = form.serialize();
		WebUtils.ajaxSubmit(url,data,function(result){
			$('#detail').modal('hide');
		});
	}
	return false;
}
</script>
<s:enums keys="sex,batch_type"></s:enums>
</html>