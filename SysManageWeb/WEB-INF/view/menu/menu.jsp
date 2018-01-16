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
<link rel="stylesheet" href="../css/app.css">

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
							<div class="panel-heading">菜单视图</div>
							<div class="panel-body">
								<ul id="myTree" class="tree tree-folder-select" role="tree"
									style="min-height: 400px;">
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
											<span class="glyphicon icon-item fueluxicon-bullet"></span> <span
												class="tree-label"></span>
										</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="panel panel-default">
							<div class="panel-heading">菜单项明细</div>
							<div class="panel-body form-horizontal">
								<div class="form-group">
									<label for="menuId" class="col-sm-2 control-label">菜单ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="menuId"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="parentNode" class="col-sm-2 control-label">父节点ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="parentNode"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="nodeId" class="col-sm-2 control-label">节点ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="nodeId"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="nodeName" class="col-sm-2 control-label">节点名称</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="nodeName"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="nodeUrl" class="col-sm-2 control-label">节点URL</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="nodeUrl"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="seqId" class="col-sm-2 control-label">节点顺序号</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="seqId"
											readonly="readonly"></input>
									</div>
								</div>
								<div class="form-group">
									<label for="nodeVisible" class="col-sm-2 control-label">是否显示</label>
									<div class="col-sm-9">
										<select name="nodeVisible" id="nodeVisible"
											readonly="readonly"></select>
									</div>
								</div>
								<div class="form-group">
									<label for="nodeImg" class="col-sm-2 control-label">节点图标</label>
									<div class="col-sm-9">
										<select id="nodeImg" readonly="readonly">
											<option value="linecons-music">linecons-music</option>
											<option value="linecons-search">linecons-search</option>
											<option value="linecons-mail">linecons-mail</option>
											<option value="linecons-heart">linecons-heart</option>
											<option value="linecons-star">linecons-star</option>
											<option value="linecons-user">linecons-user</option>
											<option value="linecons-videocam">linecons-videocam</option>
											<option value="linecons-camera">linecons-camera</option>
											<option value="linecons-photo">linecons-photo</option>
											<option value="linecons-attach">linecons-attach</option>
											<option value="linecons-lock">linecons-lock</option>
											<option value="linecons-eye">linecons-eye</option>
											<option value="linecons-tag">linecons-tag</option>
											<option value="linecons-thumbs-up">linecons-thumbs-up</option>
											<option value="linecons-pencil">linecons-pencil</option>
											<option value="linecons-comment">linecons-comment</option>
											<option value="linecons-location">linecons-location</option>
											<option value="linecons-cup">linecons-cup</option>
											<option value="linecons-trash">linecons-trash</option>
											<option value="linecons-doc">linecons-doc</option>
											<option value="linecons-note">linecons-note</option>
											<option value="linecons-cog">linecons-cog</option>
											<option value="linecons-params">linecons-params</option>
											<option value="linecons-calendar">linecons-calendar</option>
											<option value="linecons-sound">linecons-sound</option>
											<option value="linecons-clock">linecons-clock</option>
											<option value="linecons-lightbulb">linecons-lightbulb</option>
											<option value="linecons-tv">linecons-tv</option>
											<option value="linecons-desktop">linecons-desktop</option>
											<option value="linecons-mobile">linecons-mobile</option>
											<option value="linecons-cd">linecons-cd</option>
											<option value="linecons-inbox">linecons-inbox</option>
											<option value="linecons-globe">linecons-globe</option>
											<option value="linecons-cloud">linecons-cloud</option>
											<option value="linecons-paper-plane">linecons-paper-plane</option>
											<option value="linecons-fire">linecons-fire</option>
											<option value="linecons-graduation-cap">linecons-graduation-cap</option>
											<option value="linecons-megaphone">linecons-megaphone</option>
											<option value="linecons-database">linecons-database</option>
											<option value="linecons-key">linecons-key</option>
											<option value="linecons-beaker">linecons-beaker</option>
											<option value="linecons-truck">linecons-truck</option>
											<option value="linecons-money">linecons-money</option>
											<option value="linecons-food">linecons-food</option>
											<option value="linecons-shop">linecons-shop</option>
											<option value="linecons-diamond">linecons-diamond</option>
											<option value="linecons-t-shirt">linecons-t-shirt</option>
											<option value="linecons-wallet">linecons-wallet</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-4"></div>
									<div class="col-md-4">
										<button id="bmodify" type="button" class="btn btn-success"
											disabled="disabled">修改</button>
										<button id="binsert" type="button" class="btn btn-success"
											disabled="disabled">新增</button>
										<button id="bdelete" type="button" class="btn btn-success"
											disabled="disabled">删除</button>
									</div>
									<div class="col-md-4"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="detail">
			<form method="post" class="form-horizontal validate"
				onsubmit="return submitDetail()">
				<div class="modal-dialog" style="width: 50%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">新增菜单项</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="vmenuId" class="col-sm-2 control-label">菜单ID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vmenuId"
										name="vmenuId" readonly="readonly"></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vparentNode" class="col-sm-2 control-label">父节点ID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vparentNode"
										name="vparentNode" data-validate="required"
										data-message-required="此项必须输入.（根节点除外）" readonly="readonly"></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vnodeId" class="col-sm-2 control-label">节点ID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vnodeId"
										name="vnodeId" placeholder="请输入菜单节点ID，以字母开头，字母和数字"
										data-validate="required" data-message-required="此项必须输入."></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vnodeName" class="col-sm-2 control-label">节点名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vnodeName"
										name="vnodeName" placeholder="请输入菜单节点名称，以字母开头，字母和数字"
										data-validate="required" data-message-required="此项必须输入."></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vnodeUrl" class="col-sm-2 control-label">节点URL</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vnodeUrl"
										name="vnodeUrl" placeholder="请输入菜单节点URL"
										data-message-required="此项必须输入."></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vseqId" class="col-sm-2 control-label">节点顺序号</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="vseqId"
										name="vseqId" placeholder="请输入菜单节点顺序号"
										data-validate="required,number"
										data-message-required="此项必须输入."></input>
								</div>
							</div>
							<div class="form-group">
								<label for="vnodeVisible" class="col-sm-2 control-label">是否显示</label>
								<div class="col-sm-9">
									<select name="vnodeVisible" id="vnodeVisible"
										data-validate="required" data-message-required="此项必须输入."></select>
								</div>
							</div>
							<div class="form-group">
								<label for="vnodeImg" class="col-sm-2 control-label">节点图标</label>
								<div class="col-sm-9">
									<select name="vnodeImg" id="vnodeImg" data-validate="required" data-message-required="此项必须输入.">
										<option value=""></option>
										<option value="linecons-music">linecons-music</option>
										<option value="linecons-search">linecons-search</option>
										<option value="linecons-mail">linecons-mail</option>
										<option value="linecons-heart">linecons-heart</option>
										<option value="linecons-star">linecons-star</option>
										<option value="linecons-user">linecons-user</option>
										<option value="linecons-videocam">linecons-videocam</option>
										<option value="linecons-camera">linecons-camera</option>
										<option value="linecons-photo">linecons-photo</option>
										<option value="linecons-attach">linecons-attach</option>
										<option value="linecons-lock">linecons-lock</option>
										<option value="linecons-eye">linecons-eye</option>
										<option value="linecons-tag">linecons-tag</option>
										<option value="linecons-thumbs-up">linecons-thumbs-up</option>
										<option value="linecons-pencil">linecons-pencil</option>
										<option value="linecons-comment">linecons-comment</option>
										<option value="linecons-location">linecons-location</option>
										<option value="linecons-cup">linecons-cup</option>
										<option value="linecons-trash">linecons-trash</option>
										<option value="linecons-doc">linecons-doc</option>
										<option value="linecons-note">linecons-note</option>
										<option value="linecons-cog">linecons-cog</option>
										<option value="linecons-params">linecons-params</option>
										<option value="linecons-calendar">linecons-calendar</option>
										<option value="linecons-sound">linecons-sound</option>
										<option value="linecons-clock">linecons-clock</option>
										<option value="linecons-lightbulb">linecons-lightbulb</option>
										<option value="linecons-tv">linecons-tv</option>
										<option value="linecons-desktop">linecons-desktop</option>
										<option value="linecons-mobile">linecons-mobile</option>
										<option value="linecons-cd">linecons-cd</option>
										<option value="linecons-inbox">linecons-inbox</option>
										<option value="linecons-globe">linecons-globe</option>
										<option value="linecons-cloud">linecons-cloud</option>
										<option value="linecons-paper-plane">linecons-paper-plane</option>
										<option value="linecons-fire">linecons-fire</option>
										<option value="linecons-graduation-cap">linecons-graduation-cap</option>
										<option value="linecons-megaphone">linecons-megaphone</option>
										<option value="linecons-database">linecons-database</option>
										<option value="linecons-key">linecons-key</option>
										<option value="linecons-beaker">linecons-beaker</option>
										<option value="linecons-truck">linecons-truck</option>
										<option value="linecons-money">linecons-money</option>
										<option value="linecons-food">linecons-food</option>
										<option value="linecons-shop">linecons-shop</option>
										<option value="linecons-diamond">linecons-diamond</option>
										<option value="linecons-t-shirt">linecons-t-shirt</option>
										<option value="linecons-wallet">linecons-wallet</option>
									</select>
								</div>
							</div>

						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-success">保存</button>
						</div>
					</div>
				</div>
			</form>
		</div>
</body>
<!-- Imported styles on this page -->
<link rel="stylesheet" href="../assets/js/select2/select2.css">
<link rel="stylesheet" href="../assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="../assets/js/multiselect/css/multi-select.css">
<link rel="stylesheet" href="../assets/js/fuelux/fuelux.min.css" />

<!-- Bottom Scripts -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/TweenMax.min.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/xenon-api.js"></script>
<script src="../assets/js/xenon-toggles.js"></script>
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
			openedParentData.menuId = '${menuid}';
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

		$('#nodeVisible').select2("readonly",true);
		$('#nodeImg').select2("readonly",true);
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
					WebUtils.ajaxSubmitJson(url, JSON
							.stringify(data.target), function(result) {
						var item = result.data;
						$('#menuId').val(item.menuId);
						$('#parentNode').val(item.parentNode);
						$('#nodeId').val(item.nodeId);
						$('#nodeName').val(item.nodeName);
						$('#nodeUrl').val(item.nodeUrl);
						$('#nodeVisible').select2("val", item.nodeVisible);
						$('#seqId').val(item.seqId);
						$('#nodeImg').select2("val", item.nodeImg)
						$('#bmodify').removeAttr("disabled");
						$('#binsert').removeAttr("disabled");
						$('#bdelete').removeAttr("disabled");
					});
				})

		//删除
		$('#bdelete').click(
				function() {
					var items = $('#myTree').tree('selectedItems');
					var item = items[0];
					var url = "menu/delete";
					WebUtils.ajaxSubmitJson(url, JSON.stringify(item),
							function(result) {
								WebUtils.alert("删除成功!");
								refreshTree(item.parentNode);
							});
				});

		//新增
		$('#binsert').click(function() {
			$('#detail').modal('show', {
				backdrop : 'static',
				action : "menu/add",
				title : "新增菜单项"
			});
		});
		//修改
		$('#bmodify').click(function() {
			$('#detail').modal('show', {
				backdrop : 'static',
				action : "menu/update",
				title : "修改菜单项"
			});
		});

		//明细对话框显示后处理
		$('#detail').on(
				'show.bs.modal',
				function(event) {
					//下拉框数据绑定
					WebUtils.bindSelect('vnodeVisible', 'yes_no');
					//设置详细对话框内容
					var button = $(event.relatedTarget);
					var modal = $(this);
					modal.find('.modal-title').text(
							button.attr('title'));
					modal.find('form').attr("action",
							button.attr('action'));

					var items = $('#myTree').tree('selectedItems');
					var item = items[0];
					$('#detail form')[0].reset();
					
		            //清除原来的校验
		            $('#detail form').validate().resetForm();
		            $('#detail .form-group').removeClass('validate-has-error');

					if (button.attr('action') == 'menu/add') {
						//新增
						$('#vmenuId').val(item.menuId);
						$('#vparentNode').val(item.nodeId);
						$('#vnodeId').removeAttr('readonly');
						$('#vnodeVisible').select2("val", '1');
						$('#vnodeImg').select2("val", '');
					} else {
						//修改
						$('#vnodeId').attr('readonly', 'readonly');
						$('#vmenuId').val($('#menuId').val());
						$('#vparentNode').val($('#parentNode').val());
						$('#vnodeId').val($('#nodeId').val());
						$('#vnodeName').val($('#nodeName').val());
						$('#vnodeUrl').val($('#nodeUrl').val());
						$('#vnodeVisible').select2("val",$('#nodeVisible').val());
						$('#vseqId').val($('#seqId').val());
						$('#vnodeImg').select2("val",$('#nodeImg').val());

						var validator = $('#detail form').validate();
						validator.resetForm();
					}
				});

	});

	function submitDetail() {
		var form = $('#detail form');
		if (form.valid()) {
			var url = form.attr('action');
			var data = {};
			//此处用v+变量名，为了避免jquery的bug，数据中有parentNode 或nodeName 会发生死循环
			data.menuId = $('#vmenuId').val();
			data.parentNode = $('#vparentNode').val();
			data.nodeId = $('#vnodeId').val();
			data.nodeName = $('#vnodeName').val();
			data.nodeUrl = $('#vnodeUrl').val();
			data.nodeVisible = $('#vnodeVisible').select2("val");
			data.seqId = $('#vseqId').val();
			data.nodeImg = $('#vnodeImg').select2("val");
			WebUtils.ajaxSubmit(url,  data,
					function(result) {
						WebUtils.alert("保存成功");
						$('#detail').modal('hide');
					});
		}
		return false;
	}
	function refreshTree(menuid) {
		//FIXME
		//$('#myTree').tree('refreshFolder',$('#'+ menuid));
	}
</script>
<s:enums keys="yes_no"></s:enums>
</html>