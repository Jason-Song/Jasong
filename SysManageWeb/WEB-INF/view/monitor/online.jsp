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

        <div class="panel panel-default collapsed">
            <div class="panel-heading">
                <h3 class="panel-title">在线用户列表</h3>
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
                            <input type="text" class="form-control" id="s_userId" placeholder="登录ID" >
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="s_userName" placeholder="用户名称">
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="s_ipAddress" placeholder="登录地址">
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
                            <th>登录ID</th>
                            <th>用户名称</th>
                            <th>登录地址</th>
                            <th>登录时间</th>
                            <th>浏览器类型</th>
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
var table;
$(function () {
    //初始化列表
    var initparams = {
            "ajax": {
                "url": "online/list",
                "type": "POST",
                "data": function ( d ) {
                    var orders = d.order;
                    for (var i =0; i < orders.length; i++) {
                        d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
                        d["norder["+i+"][dir]"] = orders[i]['dir'];
                    }
                    d.s_userId=$('#s_userId').val();
                    d.s_userName=$('#s_userName').val();
                    d.s_ipAddress=$('#s_ipAddress').val();
                }
            },
            "columns": [
                { "data": "userId"},
                { "data": "userName" },
                { "data": "ipAddress" },
                { "data": "logonTime"},
                { "data": "explorerType"},
                { "data": "action"}
            ],
            "columnDefs": [
                {
                    "render": function ( data, type, row ) {
                        var hstr =  "<button onclick='forceOut(\"" + row.sessionId + "\")'>强制退出</button>";
                        return hstr;
                    },
                    "targets": [ 5 ]
                }
            ]
        }
    var params = $.extend({},WebUtils.settings, initparams);
    table= $("#listtable").DataTable(params);
    WebUtils.initColumnHider(table);

    table.on( 'click', 'tr', function () {
        $(this).removeClass('selected');
    });

    //过滤条件设置按钮
    $('#filter_button').click( function () {
        table.draw();
        $('.panel-default').addClass('collapsed');
    });
    

});

function forceOut(sid) {
    var data = {sessionId:sid};
    WebUtils.ajaxSubmitJson("online/delete",JSON.stringify(data),function(result) {
        parent.WebUtils.alert(result.msg);
        table.draw();
    });
}
</script>
</html>
