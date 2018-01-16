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
<body class="page-body" style="overflow-x: hidden;">
<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
<div class="page-container">
    <div class="main-content">

        <div class="panel panel-default collapsed">
            <div class="panel-heading">
                <h3 class="panel-title">员工列表</h3>
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
                            <label for="s_staffId" class="control-label">员工编号</label>
                            <input type="text" class="form-control" id="s_staffId">
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="s_staffName" class="control-label">员工名称</label>
                            <input type="text" class="form-control" id="s_staffName">
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="s_staffStatus" class="control-label">员工状态</label>
                            <select class="form-control" id="s_staffStatus" name="s_staffStatus">
                            </select>
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
                    <div class="col-md-8">
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
                            <label class="btn btn-blue glyphicon glyphicon-pencil" id="grantbutton">
                                <input type="checkbox">分配角色</input>
                            </label>
                            <label class="btn btn-blue glyphicon glyphicon-trash" id="grprlassign">
                                <input type="checkbox">分配角色组</input>
                            </label>
                            <label class="btn btn-blue glyphicon glyphicon-trash" id="bdatactl">
                                <input type="checkbox">数据权限设置</input>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="haha" >
                            <li class="hiden-columns-title pull-right">
                                <a href="#" >
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
                            <th>员工编号</th>
                            <th>员工姓名</th>
                            <th>所属机构</th>
                            <th>员工性别</th>
                            <th>员工状态</th>
                            <th>更新用户</th>
                            <th>更新时间</th>
                        </tr>
                    </thead>
                    <tbody class="middle-align">
                    </tbody>
                </table>
            </div>
        </div>
    

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
                   "url": "staff/list",
                   "type": "POST",
                   "data": function ( d ) {
                       var orders = d.order;
                       for (var i =0; i < orders.length; i++) {
                           d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
                           d["norder["+i+"][dir]"] = orders[i]['dir'];
                       }
                       d.s_staffId = $('#s_staffId').val();
                       d.s_staffName = $('#s_staffName').val();
                       d.s_staffStatus = $('#s_staffStatus').val();
                     }
                },
                "columns": [
                   { "data": "staffId" },
                   { "data": "staffName" },
                   { "data": "unitName"},
                   { "data": "sex"},
                   { "data": "staffStatus"},
                   { "data": "updUser"},
                   { "data": "updTime"}
                ],
                "columnDefs": [
                     {
                         "render": function ( data, type, row ) {
                             var hstr =  WebUtils.getCodeValue('sex',data);
                             return hstr;
                         },
                         "targets": [ 3 ]
                     },
                     {
                         "render": function ( data, type, row ) {
                             var hstr =  WebUtils.getCodeValue('valid_type',data);
                             return hstr;
                         },
                         "targets": [ 4 ]
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
            
            //删除
            $('#delbutton').click( function () {
                var data = table.rows('.selected').data();
                if (data) {
                    var sdata = [];
                    for (var x =0; x< data.length; x ++) {
                        sdata.push(data[x]);
                    }
                    var str =  JSON.stringify(sdata);
                    WebUtils.ajaxSubmitJson('staff/delete',str,function(result){
                        WebUtils.alert(result.msg);
                        table.draw();
                    });
                }
            } );
            
            //新增
            $('#addbutton').click( function () {
                jQuery('#detail').modal('show', {backdrop: 'static',action: "staff/add",title:"新增员工"});
            });
            
            //修改
            $('#updbutton').click( function () {
                var data = table.rows('.selected').data();
                if (data.length == 1) {
                    jQuery('#detail').modal('show', {backdrop: 'static',action: "staff/update",title:"修改员工"});
                } else {
                     WebUtils.alert("请选择一条记录！");
                }
            });
            //分配角色
            $('#grantbutton').click( function () {
                var data = table.rows('.selected').data();
                if (data) {
                    if (data.length == 1) {
                        var url = "/sys/roleassign?id=" + data[0].staffId+"&name="+ data[0].staffName;
                        parent.openPage("roleassign","分配角色",url);
                    }
                    else {
                        WebUtils.alert("请选择一条记录！");
                    }
                }
            });
            
            //角色组分配
            $('#grprlassign').click( function () {
                var data = table.rows('.selected').data();
                if (data) {
                    if (data.length == 1) {
                        var url = "/sys/grprlassign?id=" + data[0].staffId + "&name=" + data[0].staffName;
                        parent.openPage("grprlassign","角色组分配",url);
                    }
                    else {
                        WebUtils.alert("只能选一个人员");
                    }
                }
            });
            
            //数据权限设置
            $('#bdatactl').click( function () {
                var data = table.rows('.selected').data();
                if (data) {
                    if (data.length == 1) {
                        var url = "/sys/datactl?id=" + data[0].staffId + "&name=" + data[0].staffName;
                        parent.openPage("datactl","数据权限设置",url);
                    }
                    else {
                        WebUtils.alert("只能选一个人员");
                    }
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

                if (button.attr('action') == 'staff/add') {
                    $('#staffId').removeAttr('readonly');
                    $('#detail form')[0].reset();
                    $('#sex').select2('val','');
                    $('#staffStatus').select2('val','');
                } else {
                    $('#staffId').attr('readonly','true');
                    var data = table.row('.selected').data();
                    if (data) {
                        $('#staffId').val(data['staffId']);
                        $('#staffName').val(data['staffName']);
                        $('#sex').select2('val',data['sex']);
                        $('#ownerUnitName').val(data['unitName']);
                        $('#ownerUnitid').val(data['ownerUnitid']);
                        $('#staffStatus').select2('val',data['staffStatus']);
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
                       <div class="col-md-6">
                           <div class="form-group">
                               <label for="staffId" class="control-label">员工编码</label>
                               <input type="text" class="form-control" id="staffId" name="staffId" placeholder="请输入员工编码，只可输入数字" 
                                 data-validate="required" data-message-required="此项必须输入.">
                           </div>    
                       </div>
                       <div class="col-md-6">
                           <div class="form-group">
                               <label for="staffName" class="control-label">员工姓名</label>
                               <input type="text" class="form-control" id="staffName" name="staffName" placeholder="请输入员工的中文名称"
                                   data-validate="required" data-message-required="此项必须输入.">
                           </div>    
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-md-6">
                           <div class="form-group">
                               <label for="ownerUnitid" class="control-label">所属机构</label>
                               <input type="text" class="form-control" id="ownerUnitName" name="ownerUnitName" placeholder="请输入上级组织" data-validate="required" data-message-required="此项必须输入."/>
                               <input type="hidden" class="form-control" id="ownerUnitid" name="ownerUnitid"></input>
                           </div>    
                       </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="sex" class="control-label">性别</label>
                            <select class="form-control" id="sex" name="sex" data-validate="required" data-message-required="此项必须输入.">
                            </select>
                        </div>    
                    </div>
                   </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="staffStatus" class="control-label">员工状态</label>
                            <select class="form-control" id="staffStatus" name="staffStatus" data-validate="required" data-message-required="此项必须输入.">
                            </select>
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
<jsp:include page="/WEB-INF/view/selectunit.jsp"><jsp:param value="SYS" name="systype"/></jsp:include>
<s:enums keys="sex,valid_type"></s:enums>
<script type="text/javascript">
    $(function () {
        //下拉框数据绑定
        WebUtils.bindSelect('sex','sex');
        WebUtils.bindSelect('staffStatus','valid_type');
        WebUtils.bindSelect('s_staffStatus','valid_type');
        
        $('#ownerUnitName').on(
   		    'click',
   		    function() {
   		        //this.blur();
   		        var selected = '{\'ownerUnitName\':\'unitName\',\'ownerUnitid\':\'unitId\'}';
   		        jQuery('#comm_selectUnit').modal(
   		            'show',
   		            {
   		                backdrop : 'static',
   		                id : selected,
   		                selectMode : 'radio',
   		                selectedIds : $('#ownerUnitid').val(),
   		                selectedNames : $('#ownerUnitName').val()
   		            });
   		    });
    	
    });
</script>
</body>
</html>