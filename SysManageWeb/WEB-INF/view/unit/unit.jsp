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
<%-- 	<script src="../js/colResizable-1.6.js"></script> --%>

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
<!-- 		    <div class="page-title"> -->
<!-- 		        <div class="title-env"> -->
<!-- 		            <h1 class="title">组织维护</h1> -->
<!-- 		            <p class="description">系统中组织机构的管理</p> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
		    
		    <div class="panel panel-default collapsed">
		        <div class="panel-heading">
		            <h3 class="panel-title">组织列表</h3>
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
								<label for="s_unitId" class="control-label">组织编号</label>
								<input type="text" class="form-control" id="s_unitId">
							</div>	
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="s_unitName" class="control-label">组织名称</label>
								<input type="text" class="form-control" id="s_unitName">
							</div>	
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="s_staffStatus" class="control-label">组织状态</label>
				                <select class="form-control" id="s_unitStatus" name="s_unitStatus">
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
			        <div class="col-md-6 ">
			            <div class="btn-group " data-toggle="buttons">
			                <s:authif key="insert" scope="m5_1">
			                <label class="btn btn-secondary glyphicon glyphicon-plus" id="addbutton">
			                    <input type="checkbox">新增</input>
			                </label>
			                </s:authif>
			                <label class="btn btn-blue glyphicon glyphicon-pencil" id="updbutton">
			                    <input type="checkbox">修改</input>
			                </label>
			                <s:authif key="delete" scope="m5_1">
			                <label class="btn btn-blue glyphicon glyphicon-trash" id="delbutton">
			                    <input type="checkbox">删除</input>
			                </label>
			                </s:authif>
			            </div>
			        </div>
		            <div class="col-md-6 ">

	                    	<li class="hiden-columns-title pull-right">
								<a href="#">
									<span>隐藏列<i class="fa-angle-down"></i>
									</span>
								</a>
								<ul class="hiden-columns">
								</ul>
							</li>
                    </div>
		            <table class="table table-bordered table-striped nowrap" id="unittable" style="width: 100%;">
		                <thead>
		                    <tr>
		                        <th>组织编号</th>
		                        <th>组织名称</th>
		                        <th>上级组织</th>
		                        <th>组织级别</th>
		                        <th>组织状态</th>
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
 <div class="modal fade" id="unit_detail">
    <div class="modal-dialog" style="width: 60%">
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
                            <label for="unitId" class="control-label">机构编码</label>
                            <input type="text" class="form-control" id="unitId" name="unitId" placeholder="请输入机构编码，不能输入汉字" 
                              data-validate="required" data-message-required="此项必须输入.">
                        </div>    
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="uitName" class="control-label">机构名称</label>
                            <input type="text" class="form-control" id="unitName" name="unitName" placeholder="请输入机构的中文名称"
                                data-validate="required" data-message-required="此项必须输入.">
                        </div>    
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                        	
                            <label for="superUnitId" class="control-label">上级机构</label>
                            <input type="text" class="form-control" id="superUnitName" name="superUnitName" placeholder="请输入上级组织">
                            <input type="hidden" class="form-control" id="superUnitId" name="superUnitId" data-validate="required" data-message-required="此项必须输入."></input>
                        </div>    
                    </div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="unitKind" class="control-label">组织类型</label>
							<select class="form-control" id="unitKind" name="unitKind">
							</select>
						</div>	
					</div>
                </div>
             <div class="row">
              	<div class="col-md-6">
                        <div class="form-group">
                            <label for="unitLevel" class="control-label">组织级别</label>
                            <input type="text" class="form-control" id="unitLevel" name="unitLevel" placeholder="请输入组织级别">
                        </div>    
                    </div>
                 <div class="col-md-6">
                     <div class="form-group">
                         <label for="unitStatus" class="control-label">组织状态</label>
                         <select class="form-control" id="unitStatus" name="unitStatus"></select>
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
<script src="../assets/js/datatables/js/jquery.dataTables.js"></script>
<script src="../assets/js/moment.min.js"></script>

<jsp:include page="/WEB-INF/view/selectunit.jsp"><jsp:param value="SYS" name="systype"/></jsp:include>

<!-- Imported scripts on this page -->
<script src="../assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>

<script type="text/javascript">
$(function () {
	
	$('#superUnitName').on(
		    'click',
		    function() {
		        //this.blur();
		        var selected = '{\'superUnitName\':\'unitName\',\'superUnitId\':\'unitId\'}';
		        jQuery('#comm_selectUnit').modal(
		            'show',
		            {
		                backdrop : 'static',
		                id : selected,
		                selectMode : 'radio'
		               // selectedIds : $('#organId').val(),
		               // selectedNames : $('#organName').val()
		            });
		    });
	
	
    //初始化列表
    var initparams = {
        "ajax": {
            "url": "unit/list",
            "type": "POST",
            "data": function ( d ) {
            	var orders = d.order;
                for (var i =0; i < orders.length; i++) {
                	d["norder["+i+"][column]"] = d.columns[orders[i]['column']].data;
	                d["norder["+i+"][dir]"] = orders[i]['dir'];
                }
                d.s_unitId = $('#s_unitId').val();
                d.s_unitName = $('#s_unitName').val();
                d.s_unitStatus = $('#s_unitStatus').val();
            }
        },
        "columns": [
            { "data": "unitId" },
            { "data": "unitName" },
            { "data": "superUnitId"},
            { "data": "unitLevel"},
            { "data": "unitStatus"},
            { "data": "updUser"},
            { "data": "updTime"}
         ],
         "columnDefs": [
             {
                 "render": function ( data, type, row ) {
                     var hstr =  WebUtils.getCodeValue('valid_type',data);
                     return hstr;
                 },
                 "targets": [ 4 ]
             }
          ]
    };
    var params = $.extend({},WebUtils.settings, initparams);
    var table= $("#unittable").DataTable(params);

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
            WebUtils.ajaxSubmitJson('unit/delete',str,function(result){
                $('#sysmsg .modal-body').text(result.msg);
                $('#sysmsg').modal('show');
                table.draw();
            });
        }
    } );
    
    //新增
    $('#addbutton').click( function () {
        jQuery('#unit_detail').modal('show', {backdrop: 'static',action: "unit/add",title:"新增组织"});
    });
    
    //修改
    $('#updbutton').click( function () {
        var data = table.rows('.selected').data();
        if (data.length == 1) {
            jQuery('#unit_detail').modal('show', {backdrop: 'static',action: "unit/update",title:"修改组织"});
        } else {
            WebUtils.alert("请选择一条记录");
        }
    });
    
    //明细对话框消失后刷新
    $('#unit_detail').on('hidden.bs.modal', function (event) {
        table.draw();
    });
    
    //明细对话框显示后处理
    $('#unit_detail').on('show.bs.modal', function (event) {
        //设置详细对话框内容
        var button = $(event.relatedTarget);
        var modal = $(this);
        modal.find('.modal-title').text(button.attr('title'));
        modal.find('form').attr("action", button.attr('action'));
        //清除原来的校验
        $('#unit_detail form').validate().resetForm();
        $('.form-group').removeClass('validate-has-error');
        
        if (button.attr('action') == 'unit/add') {
            $('#unitId').removeAttr('readonly');
            $('#unit_detail form')[0].reset();
        } else {
            $('#unitId').attr('readonly','true');
            var data = table.row('.selected').data();
            if (data) {
                $('#unitId').val(data['unitId']);
                $('#unitName').val(data['unitName']);
                $('#superUnitId').val(data['superUnitId']);
                $('#unitKind').select2('val',data['unitKind']);
                $('#unitStatus').select2('val',data['unitStatus']);
                $('#unitLevel').val(data['unitLevel']);
            }
        }
    });
});

function submitDetail() {
    var form = $('#unit_detail form');
    if (form.valid()) {
        var url = form.attr('action');
        var data = form.serialize();
        WebUtils.ajaxSubmit(url,data,function(result){
            $('#unit_detail').modal('hide');
        });
    }
    return false;
}
</script>
<s:enums keys="valid_type,unit_kind"></s:enums>
<script type="text/javascript">
	$(function () {
		//下拉框数据绑定
		WebUtils.bindSelect('unitKind','unit_kind');
		WebUtils.bindSelect('unitStatus','valid_type');
		WebUtils.bindSelect('s_unitStatus','valid_type');
	});
</script>

</body>
</html>
   
