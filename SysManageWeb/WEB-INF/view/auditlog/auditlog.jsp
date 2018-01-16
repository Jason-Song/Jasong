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
                <h3 class="panel-title">日志列表</h3>
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
                            <input type="text" class="form-control" id="s_operStaffName"  placeholder="员工名称"></input>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <select class="form-control" id="s_sysModel" placeholder="所属系统"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <select class="form-control" id="s_funcType" placeholder="操作类型"></select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <select class="form-control" id="s_execResult" placeholder="执行结果"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="s_operCode"  placeholder="操作代码"></input>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="s_operName"  placeholder="操作名称">
                        </div>
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="s_ipAddr"  placeholder="IP地址">
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
            <div>
                 <div class="row">
                    <div class="col-md-6">
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
                            <th>所属模块</th>
                            <th>员工姓名</th>
                            <th>操作类型</th>
                            <th>操作代码</th>
                            <th>操作名称</th>
                            <th>IP地址</th>
                            <th>执行结果</th>
                            <th>执行时间</th>
                            <th>明细</th>
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
<script src="../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        //初始化下拉框
        WebUtils.bindSelect('s_sysModel','sys_model');
        WebUtils.bindSelect('s_execResult','log_exec_result');
        WebUtils.bindSelect('s_funcType','log_func_type');

        //初始化列表
        var initparams = {
             "ajax": {
                 "url": "listAuditLog",
                 "type": "POST",
                 "data": function (d) {
                    var orders = d.order;
                    for (var i =0; i < orders.length; i++) {
                        d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
                        d["norder["+i+"][dir]"] = orders[i]['dir'];
                    }
                     d.s_operStaffName = $('#s_operStaffName').val();
                     d.s_sysModel = $('#s_sysModel').val();
                     d.s_funcType = $('#s_funcType').val();
                     d.s_execResult = $('#s_execResult').val();
                     d.s_operName = $('#s_operName').val();
                     d.s_operCode = $('#s_operCode').val();
                     d.s_ipAddr = $('#s_ipAddr').val();
                 }
             },
             "columns": [
                    { "data": "bizType" },
                    { "data": "staffName"},
                    { "data": "funcType" },
                    { "data": "operCode" },
                    { "data": "operName" },
                    { "data": "ipAddr" },
                    { "data": "execResult" },
                    { "data": "execTime"},
                    { "data": "logDetail"}
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
                         var hstr =  WebUtils.getCodeValue('log_func_type',data);
                         return hstr;
                     },
                     "targets": [ 2 ]
                 },
                 {
                     "render": function ( data, type, row ) {
                         var hstr =  WebUtils.getCodeValue('log_exec_result',data);
                         return hstr;
                     },
                     "targets": [ 6 ]
                 }
             ]
        }
        var params = $.extend({},WebUtils.settings, initparams);
        var table= $("#listtable").DataTable(params);
        WebUtils.initColumnHider(table);
        
        //过滤条件设置按钮
        $('#filter_button').click( function () {
            table.draw();
        });

    }) ;
    

</script>
<s:enums keys="sys_model,log_func_type,log_exec_result"></s:enums>
</html>
