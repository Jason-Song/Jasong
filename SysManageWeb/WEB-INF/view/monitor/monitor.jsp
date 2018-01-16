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
<div class="page-container">
	<div class="main-content">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">机器列表</h3>
			</div>
			<div class="panel-body">
				<div class="row">
                    <div class="col-md-6">
	                     <div class="btn-group" data-toggle="buttons">
						</div>
                	</div>
                    <div class="col-md-6 ">
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
				<table class="table table-bordered table-striped nowrap" id="listtable" style="width: 100%;">
					<thead>
						<tr>
							<th>应用模块</th>
							<th>应用服务器类型</th>
							<th>IP地址</th>
							<th>应用服务器内存</th>
							<th>服务端口</th>
							<th>JVM版本</th>
							<th>JVM内存</th>
							<th>JVM可用内存</th>
							<th>操作</th>
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

<script type="text/javascript">
$(function () {
	//初始化列表
	var initparams = {
			"ajax": {
	            "url": "monitor/list",
	            "type": "POST",
	            "data": function ( d ) {
	                var orders = d.order;
	                for (var i =0; i < orders.length; i++) {
	                	d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
		                d["norder["+i+"][dir]"] = orders[i]['dir'];
	                }
	            }
	        },
			"columns": [
				{ "data": "baseInfo.appModel"},
				{ "data": "baseInfo.appMachineType"},
				{ "data": "baseInfo.machineIp" },
				{ "data": "baseInfo.appMatchineMem" },
				{ "data": "baseInfo.servicePort"},
				{ "data": "jvmInfo.jvmVersion"},
				{ "data": "jvmInfo.jvmMemory"},
				{ "data": "jvmInfo.jvmAvlMe"},
				{ "data": "action"}
			],
			"columnDefs": [
				{
                    "render": function ( data, type, row ) {
                        var hstr =  WebUtils.getCodeValue('sys_model',data);
                        return hstr;
                    },
                    "targets": [ 0 ]
                },
                {
                    "render": function ( data, type, row ) {
                        var hstr =  "<button onclick='freshCache(this)'>刷新缓存</button>";
                        return hstr;
                    },
                    "targets": [ 8 ]
                }
            ]
		};
	var params = $.extend({},WebUtils.settings, initparams);
    table= $("#listtable").DataTable(params);
	WebUtils.initColumnHider(table);
    table.on( 'click', 'tr', function () {
        $(this).removeClass('selected');
    });
    
 
});
var table;
function freshCache(b) {
	var tr =  $(b).parents("tr");
	var rowdata = table.row(tr).data();
    WebUtils.ajaxSubmitJson("monitor/sync",JSON.stringify(rowdata.baseInfo),function(result) {
        parent.WebUtils.alert(result.msg);
    });
}
</script>
<s:enums keys="sys_model"></s:enums>
</html>
