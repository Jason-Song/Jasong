<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
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
				<h3 class="panel-title">枚举值列表</h3>
				
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
					<div class="col-md-6">
						<div class="form-group">
							<select class="form-control" id="p_sysCode" placeholder="所属系统"></select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" id="p_enumType" placeholder="枚举名">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" id="p_enumDesc" placeholder="枚举名描述">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" id="p_enumValue" placeholder="枚举值">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group pull-right">
							<button type="button" class="btn btn-success" id="filter_button">过滤</button>
						</div>
					</div>
				</div>
			</div>

			<div class="panel-body-" id="filter_panel">
				<div class="row">
					<div class="col-md-6">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-secondary glyphicon glyphicon-plus" id="addType_button">
								<input type="checkbox">添加枚举名</input>
							</label>
							<label class="btn btn-blue glyphicon glyphicon-plus" id="updtType_button">
								<input type="checkbox">修改枚举名</input>
							</label>
							<label class="btn btn-blue glyphicon glyphicon-plus" id="delType_button">
								<input type="checkbox">删除枚举名</input>
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						 <table class="table table-bordered table-striped nowrap" id="parentTable" style="width:100%;">
							<thead>
								<tr>
									<th>枚举名</th>
									<th>枚举描述</th>
									<th>所属系统</th>
									<th>创建时间</th>
									<th>更新时间</th>
								</tr>
							</thead>
							<tbody class="middle-align">
							</tbody>
						</table>
					</div>
				</div>
								
				<div class="row" style="display:none">
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_sysCode" name="s_sysCode" placeholder="请输入所属系统"/>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<input type="text" class="form-control" id="s_enumType" name="s_enumType" placeholder="请输入枚举类型"/>
						</div>
					</div>
				</div>

			</div>
			<div class="panel-body-">
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
				<table class="table table-bordered table-striped nowrap" id="listtable" style="width: 100%;">
					<thead>
						<tr>
							<th>枚举名</th>
							<th>枚举ID</th>
							<th>枚举值</th>
							<th>所属系统</th>
							<th>排序号</th>
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
					<div id="parent">
						<div class="modal-body">
							<div class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="autoId" class="control-label">枚举编号</label>
										<input type="text" class="form-control" id="autoId" name="autoId" placeholder="请输入枚举类型"
										readonly>
									</div>
								</div>
							</div>
							<div class="row">		
								<div class="col-md-6">
									<div class="form-group">
										<label for="sysCode" class="control-label">所属系统编号</label>
										<select class="form-control" id="sysCode" name="sysCode" data-validate="required"></select>
									</div>
								</div>
							
								<div class="col-md-6">
									<div class="form-group">
										<label for="enumType" class="control-label">枚举名</label>
										<input type="text" class="form-control" id="enumType" name="enumType" placeholder="请输入枚举类型" 
											data-validate="required" data-message-required="此项必须输入." readonly>
									</div>			
								</div>
							</div>
						</div>
						<div id="child">
							<div class="row">	
								<div class="col-md-6">
									<div class="form-group">
										<label for="enumId" class="control-label">枚举id</label>
										<input type="text" class="form-control" id="enumId" name="enumId" placeholder="请输入枚举id" 
										  data-validate="required" data-message-required="此项必须输入.">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="enumValue" class="control-label">枚举值</label>
										<input type="text" class="form-control" id="enumValue" name="enumValue" placeholder="请输入枚举值" 
										  data-validate="required" data-message-required="此项必须输入.">
									</div>	
								</div>
							</div>
							<div class="row">	
								<div class="col-md-6">
									<div class="form-group">
										<label for="seqId" class="control-label">排序值</label>
										<input type="text" class="form-control" id="seqId" name="seqId" placeholder="请输入排序值" 
										  data-validate="required" data-message-required="此项必须输入." min="1">
									</div>
								</div>
						<!--<div class="col-md-6" style="display:none">
									<div class="form-group">
										<label for="crtUser" class="control-label">创建人</label>
										<input type="text" class="form-control" id="crtUser" name="crtUser" placeholder="请输入排序值"
										data-validate="required" data-message-required="此项必须输入.">
									</div>
								</div> -->
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group no-margin">
										<label for="resDesc" class="control-label">枚举描述</label>
										<textarea class="form-control autogrow" id="enumDesc" name="enumDesc" placeholder="描述该枚举类型的具体信息"></textarea>
									</div>
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
	
	<div class="modal fade" id="typedtl">
		<div class="modal-dialog" >
			<div class="modal-content">
				<form method="post" class="validate" onsubmit="return submitTypedtl()">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<div class="row" style="display:none">
							<div class="col-md-12">
								<div class="form-group">
									<label for="t_autoId" class="control-label">枚举编号</label>
									<input type="text" class="form-control" id="t_autoId" name="t_autoId" readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="t_sysCode" class="control-label">所属系统编号</label>
									<select class="form-control" id="t_sysCode" name="t_sysCode" data-validate="required"></select>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="t_enumType" class="control-label">枚举名</label>
									<input type="text" class="form-control" id="t_enumType" name="t_enumType" placeholder="请输入枚举类型"
										data-validate="required" data-message-required="此项必须输入.">
								</div>	
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group no-margin">
									<label for="t_enumDesc" class="control-label">枚举描述</label>
									<textarea class="form-control autogrow" id="t_enumDesc" name="t_enumDesc" placeholder="描述该枚举类型的具体信息"></textarea>
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
		initSelect();
		var initparams = {
				"ajax": {
		            "url": "enum/list",
		            "type": "POST",
		            "data": function ( d ) {
		                var orders = d.order;
						for (var i =0; i < orders.length; i++) {
						d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
						d["norder["+i+"][dir]"] = orders[i]['dir'];
						}
						d.s_enumType=$('#s_enumType').val();
						d.s_sysCode = $('#s_sysCode').val();
						return false;
		            }
		        },
				"columns": [
					{ "data": "enumType" },
					{ "data": "enumId" },
					{ "data": "enumValue" },
					{ "data": "sysCode"},
					{ "data": "seqId" },
					{ "data": "updUser"},
					{ "data": "updTime"}
				],////.
				"columnDefs": [
					{
						"render": function ( data, type, row ) {
						var hstr =  WebUtils.getCodeValue('sys_model',data);
						return hstr;
						},
						"targets": [ 3 ]
					}
				],
				"aLengthMenu": [[5, 10, 20], [5, 10, 20]]

	};
		var params = $.extend({},WebUtils.settings, initparams);
	    var table= $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);

		var initParents = {
				"ajax": {
		            "url": "enum/listParent",
		            "type": "POST",
		            "data": function ( d ) {
		            	var orders = d.order;
						for (var i =0; i < orders.length; i++) {
						d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
						d["norder["+i+"][dir]"] = orders[i]['dir'];
						}
		                d.p_sysCode=$('#p_sysCode').val();
						d.p_enumType=$('#p_enumType').val();
						d.p_enumDesc=$('#p_enumDesc').val();
						d.p_enumValue=$('#p_enumValue').val();
		            }
		        },
				"columns":[
					{ "data": "enumType" },
					{ "data": "enumDesc"},
					{ "data": "sysCode"},
					{ "data": "crtTime"},
					{ "data": "updTime"}
				],
				"columnDefs": [
					{
						"render": function ( data, type, row ) {
						var hstr =  WebUtils.getCodeValue('sys_model',data);
						return hstr;
						},
						"targets": [ 2 ]
					}
				],
				"iDisplayLength": 5,
				"bLengthChange": false
			}; 
		var parentParams = $.extend({},WebUtils.settings, initParents);
	    var parentTable= $("#parentTable").DataTable(parentParams);

	    //枚举名列表
		$('#parentTable tbody').on('click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				parentTable.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}

			var data = parentTable.row('.selected').data();
			if (data) {
				$('#s_enumType').val(data['enumType']);
				$('#s_sysCode').val(data['sysCode']);
				table.draw();
			}
		});


		//下拉框改变修改
		$('#p_enumType').change( function () {
			if (parentTable) {
				parentTable.destroy();
			}
			var params = $.extend({},WebUtils.settings, initParents);
			parentTable = $("#parentTable").DataTable(params);
		});

	    //过滤
	    $('#filter_button').click(function(){
			parentTable.draw();
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
	    		WebUtils.ajaxSubmitJson('enums/delete',str,function(result){
	    			WebUtils.alert(result.msg);
	    			table.draw();
				});
	    	}
	    } );
		
		//新增
		$('#addbutton').click( function () {
			$('#detail').modal('show', {backdrop: 'static',action: "enums/add",title:"新增枚举参数"});
			<%--$("#enumType").val($("#s_enumType").val());--%>
			<%--$("#sysCode").val($("#s_sysCode").val());--%>
	    });
		
		//修改
		$('#updbutton').click( function () {
			$('#child').show();
			var data = table.row('.selected').data();
			if (data) {
				jQuery('#detail').modal('show', {backdrop: 'static',action: "enums/update",title:"修改枚举参数"});
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
            //清除原来的校验
            $('#detail form').validate().resetForm();
            $('#detail .form-group').removeClass('validate-has-error');

			if (button.attr('action') == 'enums/add') {
				$('#child').show();
				var sysCodeVal = $('#s_sysCode').val();

				if(sysCodeVal){
					<%--$('#autoId').val($('#s_enumType').val());--%>
					$('#detail form')[0].reset();
					$('#sysCode').select2("val",sysCodeVal);
					$('#sysCode').select2("readonly", true);
					$('#enumType').val($('#s_enumType').val());
					$('#enumType').attr('readonly','true');
				}
				
			}else{
				var data = table.row('.selected').data();
				if (data) {
					$('#sysCode').select2("val",data['sysCode']);
					$('#sysCode').select2("readonly", true);
					$('#enumType').val(data['enumType']);
					$('#autoId').val(data['autoId']);
					$('#crtUser').val(data['crtUser']);
					$('#enumId').val(data['enumId']);
					$('#enumValue').val(data['enumValue']);
					$('#seqId').val(data['seqId']);

				}
			}
		});

		
		//添加枚举名
		$('#addType_button').click( function () {
			$('#typedtl').modal('show', {backdrop: 'static',action: "enums/addEnumType",title:"新增枚举名"});
		});
		
		
		//修改枚举名 
		$('#updtType_button').click( function () {
			var data = parentTable.row('.selected').data();
			if (data) {
				$('#typedtl').modal('show', {backdrop: 'static',action: "enums/updateEnumType",title:"修改枚举名参数"});
			}
			else {
				WebUtils.alert("请选择一条记录");
			}
	    });
		
		//删除枚举名 
		$('#delType_button').click( function () {
	    	var data =  parentTable.rows('.selected').data();
	    	if (data) {
	    		var sdata = [];
	    		for (var x =0; x< data.length; x ++) {
	    			sdata.push(data[x]);
	    		}
	    		var str =  JSON.stringify(sdata);
	    		WebUtils.ajaxSubmitJson('enums/delEnumTypes',str,function(result){
	    			WebUtils.alert(result.msg);
					parentTable.draw();
					table.draw();
				});
	    	}
	    } );


		//枚举名对话框消失后刷新
		$('#typedtl').on('hidden.bs.modal', function (event) {
			parentTable.draw();
		});
		
		//枚举名对话框的显示处理
		$('#typedtl').on('show.bs.modal', function (event) {

			//设置详细对话框内容
			var button = $(event.relatedTarget);
			var modal = $(this);
			modal.find('.modal-title').text(button.attr('title'));
			modal.find('form').attr("action", button.attr('action'));
            //清除原来的校验
            $('#typedtl form').validate().resetForm();
            $('#typedtl .form-group').removeClass('validate-has-error');

			if(button.attr('action') == 'enums/addEnumType') {
					$('#t_enumType').removeAttr('readonly');
					$('#typedtl form')[0].reset();
			}else{
				var data = parentTable.row('.selected').data();
				var sysCodeVal = data['sysCode'];
				var enumDesc = data['enumDesc'];
				if (data) {
					$("#t_autoId").val(data['autoId']);
					$('#t_sysCode').select2("val",sysCodeVal);
					$('#t_sysCode').select2("readonly", true);
					$("#t_enumType").val(data['enumType']);
					$("#t_enumType").attr("readonly","true");
					$("#t_enumDesc").val(data['enumDesc']);

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
	
	function submitTypedtl() {
		var form = $('#typedtl form');
		if (form.valid()) {
			var url = form.attr('action');
			var enumTypeVal = $("#t_enumType").val();
			var sysCodeVal =$("#t_sysCode").val();
			var enumDescVal =$("#t_enumDesc").val();
			var autoIdVal =$("#t_autoId").val();
			var data ={autoId:autoIdVal,enumType:enumTypeVal,sysCode:sysCodeVal,enumDesc:enumDescVal};
			WebUtils.ajaxSubmit(url,data,function(result) {
				$('#typedtl').modal('hide');
			});
			
		}
		return false;
	}
	
	//初始化下拉框
	function initSelect() {
		WebUtils.bindSelect('sysCode','sys_model');
		WebUtils.bindSelect('p_sysCode','sys_model');
		WebUtils.bindSelect('t_sysCode','sys_model');
	}
	</script>

	<s:enums keys="sys_model"></s:enums>

</html>
