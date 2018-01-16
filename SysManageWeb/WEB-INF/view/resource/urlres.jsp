<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
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
				<h3 class="panel-title">资源列表</h3>
				
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
							<input type="text" class="form-control" id="s_resCode" placeholder="资源码" >
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_resValue" placeholder="资源值">
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_resName" placeholder="资源名称">
						</div>	
					</div>
					<input type="hidden" id="s_resType" value="URL">
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="form-group"> -->
<%-- 							<select class="form-control" id="s_resType" placeholder="类型"></select> --%>
<!-- 						</div>	 -->
<!-- 					</div> -->
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
                    <div class="col-md-6">
	                    <div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary glyphicon glyphicon-plus" id="addbutton">
							<input type="checkbox">新增</input>
						</label>
						<label class="btn btn-blue glyphicon glyphicon-pencil" id="updbutton">
							<input type="checkbox">修改</input>
						</label>
						<label class="btn btn-blue glyphicon glyphicon-trash" id="delbutton">
							<input type="checkbox">删除</input>
						</label>
					</div>
                	</div>
                    <div class="col-md-6 ">
                    	<div class="haha" >
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
				<table class="table table-bordered table-striped nowrap" id="listtable" style="width: 100%;">
					<thead>
						<tr>
							<th>资源编码</th>
							<th>资源名称</th>
							<th>资源值</th>
							<th>资源类型</th>
							<th>资源描述</th>
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
								<label for="resCode" class="control-label">资源编码</label>
								<input type="text" class="form-control" id="resCode" name="resCode" placeholder="请输入资源名" 
								  data-validate="required" data-message-required="此项必须输入.">
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="resName" class="control-label">资源名称</label>
								<input type="text" class="form-control" id="resName" name="resName" placeholder="请输入资源名" 
								  data-validate="required" data-message-required="此项必须输入.">
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="resValue" class="control-label">资源值</label>
								<input type="text" class="form-control" id="resValue" name="resValue" placeholder="请输入资源名" 
								  data-validate="required" data-message-required="此项必须输入.">
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="resType" class="control-label">资源类型</label>
								<select class="form-control" id="resType" name="resType" placeholder="请输入资源类型" 
									data-validate="required" data-message-required="此项必须输入.">
                            	</select>
							</div>	
							
						</div>
					
					</div>

					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group no-margin">
								<label for="resDesc" class="control-label">资源描述</label>
								
								<textarea class="form-control autogrow" id="resDesc" name="resDesc" placeholder="描述该资源点的具体信息"></textarea>
							</div>	
							
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success" >保存</button>
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
	<script src="../assets/js/select2/select2.js"></script>
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
		            "url": "resource/list",
		            "type": "POST",
		            "data": function ( d ) {
		                var orders = d.order;
		                for (var i =0; i < orders.length; i++) {
		                	d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
			                d["norder["+i+"][dir]"] = orders[i]['dir'];
		                }
		                d.s_resCode=$('#s_resCode').val();
		                d.s_resValue=$('#s_resValue').val();
		                d.s_resType=$('#s_resType').val();
		                d.s_resName=$('#s_resName').val();
		            }
		        },
				"columns": [
					{ "data": "resCode" },
					{ "data": "resName" },
					{ "data": "resValue" },
					{ "data": "resType" },
					{ "data": "resDesc" },
					{ "data": "updUser"},
					{ "data": "updTime"}
				],
				"columnDefs": [
		             {
		                 "render": function ( data, type, row ) {
		                     var hstr =  WebUtils.getCodeValue('resource_type',data);
		                     return hstr;
		                 },
		                 "targets": [ 3 ]
		             }
		          ]
			}
		var params = $.extend({},WebUtils.settings, initparams);
	    var table= $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);

		//过滤条件设置按钮
		$('#filter_button').click( function () {
			table.draw();
			$('.panel-default').toggleClass('collapsed');
		});

		//删除
		$('#delbutton').click( function () {
	    	var data = table.rows('.selected').data();
	    	if (data) {
	    		var sdata = [];
	    		for (var x =0; x< data.length; x ++) {
	    			sdata.push(data[x]);
	    		}
	    		var str =  JSON.stringify(sdata);
	    		WebUtils.ajaxSubmitJson('resource/delete',str,function(result){
	    			WebUtils.alert(result.msg);
	    			table.draw();
				});
	    	}
	    } );
		
		//新增
		$('#addbutton').click( function () {
			jQuery('#detail').modal('show', {backdrop: 'static',action: "resource/add",title:"新增功能点资源"});
	    });
		
		//修改
		$('#updbutton').click( function () {
			var data = table.rows('.selected').data();
			if (data.length == 1) {
				jQuery('#detail').modal('show', {backdrop: 'static',action: "resource/update",title:"修改功能点资源"});
			}
			else {
				WebUtils.alert("请选择一条记录");
			}
		});
		
		//明细对话框消失后刷新
		$('#detail').on('hidden.bs.modal', function (event) {
			table.draw();
		});
		
		//明细对话框显示后处理
		$('#detail').on('show.bs.modal', function (event) {
			//设置详细对话框内容
			var button = $(event.relatedTarget);
			var modal = $(this);
			modal.find('.modal-title').text(button.attr('title'));
			modal.find('form').attr("action", button.attr('action'));

			$('#resType').select2("readonly",true);
			//一定要对话框显示后设置才有效
			setTimeout(function() {
				$('#resType').select2("val","URL")
			},200);
			
	        //清除原来的校验
	        $('#detail form').validate().resetForm();
	        $('.form-group').removeClass('validate-has-error');
	        
			if (button.attr('action') == 'resource/add') {
				$('#resCode').removeAttr('readonly');
				$('#detail form')[0].reset();
			}
			else {
				$('#resCode').attr('readonly','true');
				var data = table.row('.selected').data();
				if (data) {
					$('#resCode').val(data['resCode']);
					$('#resName').val(data['resName']);
					$('#resValue').val(data['resValue']);
					$('#resDesc').val(data['resDesc']);
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
	<s:enums keys="resource_type"></s:enums>
	<script type="text/javascript">
		$(function () {
			//下拉框数据绑定
			WebUtils.bindSelect('resType','resource_type');
		    $("#resType").select2().on("change",function(){
		        $(this).valid();
		    });
		});
	</script>
</html>