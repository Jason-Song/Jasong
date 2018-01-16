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
					<input type="hidden" id="s_resTnode" value="NONE">
					<div class="col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">用户数据权限设置(${staffid}:${staffname})</div>
							<div class="panel-body form-horizontal">
								<div class="form-group">
									<label for="sysModel" class="control-label">当前作用域</label>
									<select class="form-control" id="sysModel" name="sysModel"></select>
								</div>
								<div class="form-group">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-blue glyphicon glyphicon-save" id="bupdate">
										<input type="checkbox">保存</input>
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="listtable" class="control-label">当前数据范围列表</label>
									<table class="table table-bordered table-striped nowrap" id="listtable">
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 fuelux datactl">
						<div class="panel panel-default">
							<div class="panel-heading">机构选择</div>
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
				</div>
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
		var url = 'datactl/listitem';
		// first call with be an empty object
		if (!openedParentData.dataUnit) {
			openedParentData.dataUnit = '';
		}
		openedParentData.sysCode = currVal;
		openedParentData.staffId = '${staffid}';
		var d = JSON.stringify(openedParentData);
		$.ajax({
			'type' : 'post',
			'url' : url,
			'contentType' : "application/json;charset=utf-8",
			'data' : d
		}).done(function(data) {
			var childObjectsArray = data;
			var select_class_name = 'tree-selected';
			for (var x = 0; x < childObjectsArray.length; x++) {
				var selectedclass = "";
				if (childObjectsArray[x].ext == '1' ) {
					selectedclass = select_class_name;
				}
				childObjectsArray[x].attr = {
					"data-icon" : "glyphicon glyphicon-file",
					"id" : childObjectsArray[x].dataUnit,
					"className":selectedclass
				};
			}
			callback({
				data : childObjectsArray
			});
		});
	}

	var changed = false;
	var currVal = "DEFAULT";
	$(function() {
		//下拉框数据绑定
		WebUtils.bindSelect('sysModel', 'sys_model_spec',false);
		
		//树的初始化
		var tree = $('#myTree').tree({
			dataSource : dynamicDataSource,
			multiSelect : true,
			folderSelect : true
		});

		//树的节点选择事件
		$('#myTree').on('selected.fu.tree',
			function(event, data) {
				var target = data.target;
				var row = getUnit(target);
				table.row.add(row).draw();
				changed = true;
			});
		$('#myTree').on('deselected.fu.tree',
			function(event, data) {
				var target = data.target;
				var row = getUnit(target);
				var r = table.rows(function ( idx, data, node ) {
			        return data.dataUnit == row.dataUnit? true : false;
			    } );
				changed = true;
				r.remove().draw();
			});
		
		function getUnit(obj) {
			var ret = {};
			ret['dataUnit'] = (obj.nodeId);
			ret['dataUnitName'] = (obj.name);
			ret['sysCode'] = currVal;
			return ret;
		}

		$('#sysModel').on("select2-selecting",function(e){
			if (changed) {
				WebUtils.alert("当前作用域的数据已更改，请先保存！");
				e.preventDefault();
				$(this).select2('close');
			}
			else {
				changeSysCode(e.val);
			}
		});

		function changeSysCode(val) {
			try{
				var t = tree;
				currVal = val;
				t.tree("refreshFolder",$('ul#myTree.tree > li.tree-branch:not(.hide)'));
				var data = {"staffId":'${staffid}',"sysCode":currVal};
				WebUtils.ajaxSubmitJson("datactl/list",JSON.stringify(data),function(result){
					table.rows().remove();
					var rowsdata = result.data;
					for (var x=0; x< rowsdata.length; x++) {
						table.row.add(rowsdata[x]);
					}
					table.draw();
				});
			}catch(e) {
				WebUtils.alert(e);
			}
		}
		//修改
		$('#bupdate').click(function() {
			var data = table.rows().data();
			if (data) {
				var sdata = [];
				for (var x =0; x < data.length; x ++) {
					sdata.push(data[x]);
				}
				var str = JSON.stringify(sdata);
				WebUtils.ajaxSubmitJson('datactl/save/${staffid}/' +currVal ,str,function(result){
					WebUtils.alert(result.msg)
					changed = false;
				});
			}
		});

		//初始化列表
		var initparams = {
			"data" :[],
			"columns": [
				{ "title": "机构编码" ,"data":"dataUnit"},
				{ "title": "机构名称" ,"data":"dataUnitName"}
			],
			"serverSide": false,
			"scrollXInner":"100%",
			"dom":'t'
		}
		var params = $.extend({},WebUtils.settings, initparams);
		var table= $("#listtable").DataTable(params);

		$('#sysModel').select2("val","DEFAULT");
		changeSysCode("DEFAULT");
		
	});

</script>
<s:enums keys="sys_model_spec"></s:enums>
</html>