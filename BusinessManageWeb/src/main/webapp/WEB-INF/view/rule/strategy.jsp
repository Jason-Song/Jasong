<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="s" uri="/auth"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>策略配置</title>
<link rel="stylesheet"
	href="../../assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet"
	href="../../assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../../assets/css/bootstrap.css">
<link rel="stylesheet" href="../../assets/css/xenon-core.css">
<link rel="stylesheet" href="../../assets/css/xenon-forms.css">
<link rel="stylesheet" href="../../assets/css/xenon-components.css">
<link rel="stylesheet" href="../../assets/css/xenon-skins.css">
<link rel="stylesheet" href="../../assets/css/custom.css">

<script src="../../assets/js/jquery-1.11.1.min.js"></script>
<script src="../../assets/js/datepicker/bootstrap-datepicker.js"></script>
<jsp:include page="../comm/disableDialog.jsp"></jsp:include>

</head>
<body class="page-body">
	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
	<div class="page-container">
		<div class="main-content">
			<div class="page-title">
				<div class="title-env">
					<h1 class="title">策略配置</h1>
					<p class="description">配置满足自定义原子条件后，所需执行的策略</p>
				</div>
			</div>
      		<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">策略列表</h3>
					<div class="panel-options">
						<a href="#" data-toggle="panel"> <span class="collapse-icon">&ndash;</span>
							<span class="expand-icon">+</span>
						</a>
					</div>
				</div>
				<div class="panel-body" id="inputName">
					<h4 class="text-muted">过滤条件设置</h4>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">策略需满足的条件</h5>
							<div class="form-group">
								<input class="form-control" id="s_condIds" placeholder="策略需满足的条件"></input>
							</div>
						</div>
						<div class="col-md-3">
                            <h5 class="text-muted">策略执行码</h5>
                            <div class="form-group">
								<input class="form-control" id="s_exeCode" placeholder="策略执行码"></input>
                            </div> 
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">策略描述</h5>
							<div class="form-group">
								<input class="form-control" id="s_exeDesc" placeholder="策略描述"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">创建用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_lastUpdUser"></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">创建时间（始）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_crtStartTime"
									placeholder="创建时间（始）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">创建时间（至）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_crtEndTime"
									placeholder="创建时间（至）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>									
							</div>
						</div>	
						<div class="col-md-3">
							<h5 class="text-muted">最后编辑用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_lastUpdUser"></select>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">最后编辑时间（始）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_updStartTime"
									placeholder="上传时间（始）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">最后编辑时间（至）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_updEndTime"
									placeholder="上传时间（至）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>									
							</div>
						</div>						
						<div class="col-md-9">
							<h5 class="text-muted" style='height:20px;'></h5>
							<div class="form-group pull-right">
								<button type="button" class="btn btn-success" id="reset_button">重置</button>
							</div>
							<div class="form-group pull-right" style='width: 30px;'></div>
							<div class="form-group pull-right">
								<button type="button" class="btn btn-success" id="filter_button">过滤</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
	  				    <div class="col-md-12 ">
	  				       <div class="btn-group " data-toggle="buttons">
	                            <label class="btn btn-blue" id="addbutton">
	                                <input type="checkbox">新增</input>
	                            </label>
	                            <label class="btn btn-blue" id="expbutton">
	                                <input type="checkbox">编辑</input>
	                            </label>
	                            <label class="btn btn-blue" id="expbutton">
	                                <input type="checkbox">删除</input>
	                            </label>
	                        </div>
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
                    <table class="table table-bordered table-striped table-condensed nowrap" id="listtable" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>策略ID</th>
                                <th>策略需满足的条件</th>
                                <th>策略执行码</th>
                                <th>策略描述</th>
                                <th>创建用户</th>
                                <th>创建时间</th>
                                <th>最后编辑用户</th>
                                <th>最后编辑时间</th>
                            </tr>
                        </thead>
						<tbody id="msgTxt"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="detail">
   <div class="modal-dialog" >
       <div class="modal-content">
			<form id="uploadForm" enctype="multipart/form-data">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">新增条件</h4>
				</div>
				<div id="parent">
					<div class="modal-body">
						<div class="row" >
							<div class="col-md-12">
								<div class="form-group">
									<label for="scriptName" class="control-label">条件适用的数据特征码</label>
									<select class="form-control" id="c_feature" name="c_feature"></select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="name" class="control-label">条件值</label>
									<input class="form-control" id="c_condVal" placeholder="条件值"></input>
								</div>			
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">条件类型</label>
									<select class="form-control" id="c_condType" name="c_condType" data-validate="required" data-message-required="此项必须输入." >
	                                	<option value="txt" selected="selected">txt</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="name" class="control-label">条件描述</label>
									<textarea id="c_condDesc" class="col-md-12" rows="4"></textarea>
								</div>			
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success" id="insert_button">保存</button>
				</div>
           </form>
       </div>
   </div>
</div>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../../assets/js/datatables/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="../../assets/js/select2/select2.css">
	<link rel="stylesheet" href="../../assets/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="../../assets/js/multiselect/css/multi-select.css">
	<link rel="stylesheet" href="../../css/app.css">

	<!-- Bottom Scripts -->
	<script src="../../assets/js/bootstrap.min.js"></script>
	<script src="../../assets/js/datatables/js/jquery.dataTables.js"></script>
	<script src="../../assets/js/joinable.js"></script>
	<script src="../../assets/js/moment.min.js"></script>
	<script src="../../assets/js/resizeable.js"></script>
	<script src="../../assets/js/TweenMax.min.js"></script>
	<script src="../../assets/js/xenon-api.js"></script>
	<script src="../../assets/js/xenon-toggles.js"></script>

	<!-- Imported scripts on this page -->
	<script src="../../assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="../../assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="../../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
	<script src="../../assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="../../assets/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="../../assets/js/select2/select2.min.js"></script>
	<script src="../../assets/js/timepicker/bootstrap-timepicker.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="../../assets/js/xenon-custom.js"></script>
	<script src="../../js/WebUtils.js"></script>

	<script type="text/javascript">
	$(function(){
	    //初始化列表
	    var initparams = {
	        "ajax" : {
	            "url" : "strategyList",
	            "type" : "POST",
	            "data" : function(d) {
	                var orders = d.order;
	                for (var i = 0; i < orders.length; i++) {
	                    d["norder[" + i + "][column]"] = d.columns[orders[i]['column']].data;
	                    d["norder[" + i + "][dir]"] = orders[i]['dir'];
	                }
	                d.condIds = $('#s_condIds').val();
	                d.exeCode = $('#s_exeCode').val();
	                d.exeDesc = $('#s_exeDesc').val();
	                d.createUser = $('#s_createUser').val();
	                d.crtStartTime = $('#s_crtStartTime').val();
	                d.crtEndTime = $('#s_crtEndTime').val();
	                d.lastUpdUser = $('#s_lastUpdUser').val();
	                d.updStartTime = $('#s_updStartTime').val();
	                d.updEndTime = $('#s_updEndTime').val();
	            }
	        },
	        "columns" : [
	            { "data" : "id" },//条件ID
	            { "data" : "condIds" },//策略需满足的条件
	            { "data" : "exeCode" },//策略执行码
	            { "data" : "exeDesc" },//策略描述
	            { "data" : "crtUserName" },//创建用户名
	            { "data" : "createTime" },//创建时间
	            { "data" : "updUserName" },//最后编辑用户名
	            { "data" : "lastUpdTime" }//最后编辑时间
	        ]
	    };
	    var setparams = WebUtils.settings;
	    setparams.ordering = false;
	    var params = $.extend({}, setparams, initparams);
	    table = $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);
	    table.draw();
	    
		$('#addbutton').click( function () {
			$('#detail').modal('show', {backdrop: 'static',action: "conditionAdd",title:"新增条件"});
		});
	    
	});
	
	$('#insert_button').click(function() {

	});
    //过滤条件设置按钮
    $('#filter_button').click(function() {
        table.draw();
        //$('.panel-default').addClass('collapsed');
    });
    //过滤条件重置按钮
    $("#reset_button").click(function() {
        $("#inputName input").val('');
        $("#inputName select").val("");
    });
	</script>
	<s:enums keys="bl_batchScreen_status"></s:enums>
	<script type="text/javascript">
		$(function() {
			//下拉框数据绑定
			WebUtils.bindSelect('s_runStatus', 'bl_batchScreen_status', true);
		});
	</script>
</body>
</html>