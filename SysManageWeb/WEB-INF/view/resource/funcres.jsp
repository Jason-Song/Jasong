<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="s" uri="/auth"%>
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

			<div class="panel panel-default">
				<div class="row">
					<div class="col-sm-4 mailbox-left fuelux">
						<div class="panel panel-default">
							<div class="panel-heading">导航视图</div>
							<div class="panel-body">
								<ul id="myTree" class="tree tree-folder-select" role="tree"
									style="height: 350px;">
									<li class="tree-branch hide" data-template="treebranch"
										role="treeitem" aria-expanded="false">
										<div class="tree-branch-header">
											<button class="glyphicon icon-caret glyphicon-play">
												<span class="sr-only">Open</span>
											</button>
											<button class="tree-branch-name">
												<span class="glyphicon icon-folder glyphicon-folder-close"></span>
												<span class="tree-label"></span>
											</button>
										</div>
										<ul class="tree-branch-children" role="group"></ul>
										<div class="tree-loader" role="alert">Loading...</div>
									</li>
									<li class="tree-item hide" data-template="treeitem"
										role="treeitem">
										<button class="tree-item-name">
											<span class="glyphicon icon-item fueluxicon-bullet"></span><span
												class="tree-label"></span>
										</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<input type="hidden" id="s_resTnode" value="NONE">
					<div class="col-sm-8">
						<div class="panel panel-default">
							<div class="panel-heading">功能点列表</div>
							<div class="panel-body form-horizontal">
								<div class="row">
				                    <div class="col-md-6">
					                    <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-secondary glyphicon glyphicon-plus" id="binsert">
												<input type="checkbox">新增</input>
											</label>
											<label class="btn btn-blue glyphicon glyphicon-pencil" id="bmodify">
												<input type="checkbox">修改</input>
											</label>
											<label class="btn btn-blue glyphicon glyphicon-trash" id="bdelete">
												<input type="checkbox">删除</input>
											</label>
										</div>
				                	</div>
				                </div>
							
								<div class="form-group">
									<table class="table table-bordered table-striped nowrap" id="listtable" style="width:100%">
										<thead>
											<tr>
												<th>资源编码</th>
												<th>资源名称</th>
												<th>资源值</th>
												<th>资源描述</th>
<!-- 												<th>更新用户</th> -->
<!-- 												<th>更新时间</th> -->
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="modal fade" id="detail">
	<div class="modal-dialog" >
		<div class="modal-content">
			<form method="post" class="validate" onsubmit="return submitDetail()">
			<input type="hidden" name="resType" value="FUNCTION"/>
			<input type="hidden" name="resTnode" id="resTnode"/>
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
								data-validate="required" data-message-required="此项必须输入."/>
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
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="resType" class="control-label">资源类型</label> -->
<%-- 							<select class="form-control" id="resType" name="resType" placeholder="请输入资源类型"  --%>
<%-- 								data-validate="required" data-message-required="此项必须输入."> --%>
<%--                            	</select> --%>
<!-- 						</div>	 -->
<!-- 					</div> -->
<!-- 				</div> -->
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
<link rel="stylesheet" href="../assets/js/fuelux/fuelux.min.css" />
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
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="../assets/js/fuelux/fuelux.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<script type="text/javascript">
	function dynamicDataSource(openedParentData, callback) {
		var childNodesArray = [];
		// call API, posting options
		var url = 'menu/listitem';
		// first call with be an empty object
		if (!openedParentData.menuId) {
			openedParentData.menuId = 'sys';
		}
		var d = JSON.stringify(openedParentData);
		$.ajax({
			'type' : 'post',
			'url' : url,
			'contentType' : "application/json;charset=utf-8",
			'data' : d
		}).done(function(data) {
			// configure datasource
			var childObjectsArray = data;
			// pass an array with the key 'data' back to the tree
			// [ {'name': [string], 'type': [string], 'attr': [object] } ]
			for (var x = 0; x < childObjectsArray.length; x++) {
				childObjectsArray[x].attr = {
					"data-icon" : "glyphicon glyphicon-file",
					"id" : childObjectsArray[x].nodeId
				};
			}
			//alert(JSON.stringify(childObjectsArray));
			callback({
				data : childObjectsArray
			});

		});
	}

	$(function() {
		//下拉框数据绑定
		WebUtils.bindSelect('nodeVisible', 'yes_no');
		//图片选择下拉框样式更改
		$("#vnodeImg,#nodeImg").select2(
			{
				placeholder : 'Select icon ...',
				allowClear : true,
				minimumResultsForSearch : -1, // Hide the search bar
				formatResult : function(state) {
					return '<i class="' + state.id + '"></i>&nbsp;'
							+ state.text;
				}
			}).on(
			'select2-open',
			function() {
				// Adding Custom Scrollbar
				$(this).data('select2').results.addClass(
						'overflow-hidden').perfectScrollbar();
			});

		//树的初始化
		$('#myTree').tree({
			dataSource : dynamicDataSource,
			multiSelect : false,
			folderSelect : true
		});

		//树的节点选择事件
		$('#myTree').on(
				'selected.fu.tree',
				function(event, data) {
					// do something with data: { selected: [array], target: [object] }
					//alert(JSON.stringify(data));
					var url = "menu/item";
					WebUtils.ajaxSubmitJson(url, JSON.stringify(data.target), 
						function(result) {
							var item = result.data;
							$('#s_resTnode').val(item.nodeId);
							$("#listtable").DataTable().draw();
							$('#bmodify').removeAttr("disabled");
							$('#binsert').removeAttr("disabled");
							$('#bdelete').removeAttr("disabled");
						});
				});

		//删除
        $('#bdelete').click(
            function() {
                var data = table.rows('.selected').data();
                if (data.length > 0 ) {
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
                else {
                    WebUtils.alert("请先选择需要删除的记录!");
                }
        });

		//新增
		$('#binsert').click(function() {
			$('#detail').modal('show', {
				backdrop : 'static',
				action : "resource/add",
				title : "新增功能点"
			});
		});
		//修改
		$('#bmodify').click(function() {
			$('#detail').modal('show', {
				backdrop : 'static',
				action : "resource/update",
				title : "修改功能点"
			});
		});

		//明细对话框显示后处理
		$('#detail').on('show.bs.modal',
			function(event) {
				//设置详细对话框内容
				var button = $(event.relatedTarget);
				var modal = $(this);
				modal.find('.modal-title').text(button.attr('title'));
				modal.find('form').attr("action",button.attr('action'));

				var items = $('#myTree').tree('selectedItems');
				var item = items[0];
				$('#detail form')[0].reset();
				$('#resTnode').val(item.nodeId);
		        //清除原来的校验
		        $('#detail form').validate().resetForm();
		        $('.form-group').removeClass('validate-has-error');
		        
				if (button.attr('action') == 'resource/add') {
					//新增
					$('#resCode').removeAttr('readonly');
					$('#resCode').val(item.nodeId + "_" + (table.page.info().recordsTotal+1));
				} else {
					//修改
					$('#resCode').attr('readonly','true');
					var data = table.row('.selected').data();
					$('#resCode').val(data['resCode']);
					$('#resName').val(data['resName']);
					$('#resValue').val(data['resValue']);
					$('#resDesc').val(data['resDesc']);

					var validator = $('#detail form').validate();
					validator.resetForm();
				}
			});

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
                    d.s_resTnode=$('#s_resTnode').val();
                    d.s_resType='FUNCTION';
                }
            },
            "columns": [
                { "data": "resCode" },
                { "data": "resName" },
                { "data": "resValue" },
                { "data": "resDesc" }
//                 { "data": "updUser"},
//                 { "data": "updTime"}
            ]
        }
        var params = $.extend({},WebUtils.settings, initparams);
        var table= $("#listtable").DataTable(params);
        //表格行选择
        table.on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } );
    });

	function submitDetail() {
		var form = $('#detail form');
		if (form.valid()) {
			var url = form.attr('action');
			var data = form.serialize();
			WebUtils.ajaxSubmit(url,data,function(result){
				$('#detail').modal('hide');
				$("#listtable").DataTable().draw();
			});
		}
		return false;
	}
	
</script>
<s:enums keys="yes_no"></s:enums>
</html>