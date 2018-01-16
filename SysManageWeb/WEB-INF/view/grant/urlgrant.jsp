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
					<h3 class="panel-title">角色(${roleid}:${rolename})的URL授权</h3>
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
								<input type="text" class="form-control" id="s_resName" placeholder="资源名称"/>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" class="form-control" id="s_resValue" placeholder="资源值"/>
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
				<div class="row" >
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-white glyphicon glyphicon-pencil" id="bupdate">
							<input type="checkbox">保存修改</input>
						</label>
					</div>
					<table class="table table-bordered table-striped" id="listtable">
						<thead>
							<tr>
								<th>资源代码</th>
								<th>资源名称</th>
								<th>资源值</th>
								<th>可应用</th>
								<th>可分配</th>
							</tr>
						</thead>
						<tbody class="middle-align">
						</tbody>
					</table>
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
<script src="../assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
<script src="../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<s:enums keys="resource_type"></s:enums>
<script type="text/javascript">
$(function () {
	//下拉框数据绑定
	WebUtils.bindSelect('s_resType','resource_type');
	//初始化列表
	var initparams = {
			"scrollX":false,
			"ajax": {
	            "url": "resgrant/list",
	            "type": "POST",
	            "data": function ( d ) {
	                var orders = d.order;
	                for (var i =0; i < orders.length; i++) {
	                	d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
		                d["norder["+i+"][dir]"] = orders[i]['dir'];
	                }
	                d.s_roleId='${roleid}';
	                d.s_resType='URL';
	                d.s_resName=$('#s_resName').val();
	                d.s_resValue=$('#s_resValue').val();
	            }
	        },
			"columns": [
				{ "data": "resCode" },
				{ "data": "resName" },
				{ "data": "resValue" },
				{ "data": "runFlag"},
				{ "data": "assFlag"}
			],
			"columnDefs": [
	            {
	                "render": function ( data, type, row ) {
	                	var hstr = '<input type="checkbox" class="cbr" ' + (data?'checked' :'') +  ' />';
	                    return hstr;
	                },
	                "targets": [ 3,4 ]
	            }
	        ],
	        "drawCallback": function (settings) {
	        	//重新初始化cbr
	        	cbr_replace();
	        	$('.cbr-replaced').bind('click',function(e){
	        		var target = e.target;
	        		var xtr = $(target).parentsUntil('tbody');
	        		var rowdata = table.row(xtr[3]).data();
	        		var ischange = false;
	        		$('.cbr-replaced',xtr[3]).each(function(i,dem) {
	        			var nval = $(dem).hasClass('cbr-checked') ;
	        			var vflag = ((i == 0)? rowdata['runFlag']:rowdata['assFlag']);
	        			if (vflag != nval) {
	        				ischange = true;
	        			}
	        			if (i == 1) {
	        				if (ischange) {
	        					$(xtr[3]).addClass('selected');
	        				}
	        				else {
			        			$(xtr[3]).removeClass('selected');
	        				}
		        	    }
	        	    });
	            });
	        }
		}
	var params = $.extend({},WebUtils.settings, initparams);
    var table= $("#listtable").DataTable(params);
	//过滤条件设置按钮
	$('#filter_button').click( function () {
		table.draw();
	});
	//保存修改
	$('#bupdate').click( function () {
		var rowsObj = table.rows('.selected');
		if (rowsObj[0]) {
			var changed = [];
			var rows = rowsObj[0];
			if (rows.length == 0) {
				return;
			}
			for (var i = 0 ; i < rows.length; i++) {
				var row = table.row(rows[i]);
				var ndata = WebUtils.deepCopy(row.data());
				var boxes = $('.cbr-replaced',row.node());
				ndata.runFlag = $(boxes[0]).hasClass('cbr-checked');
				ndata.assFlag = $(boxes[1]).hasClass('cbr-checked');
				changed.push( ndata );
			}
			WebUtils.ajaxSubmitJson('resgrant/save/${roleid}',JSON.stringify(changed),function(result) {
				alert (result.msg);
				table.draw();
			});
		}
    });

});

</script>
</html>
