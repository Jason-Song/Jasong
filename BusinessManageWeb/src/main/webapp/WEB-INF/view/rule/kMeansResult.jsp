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
<title>K均值聚类预测结果</title>
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
					<h1 class="title">K均值聚类预测结果</h1>
					<p class="description">展示K均值聚类模型预测结果</p>
				</div>
			</div>
      		<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">K均值聚类预测结果列表</h3>
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
							<h5 class="text-muted">场景名称</h5>
							<div class="form-group">
								<input class="form-control" id="s_scene" placeholder="场景名称"></input>
							</div>
						</div>
						<div class="col-md-3">
                            <h5 class="text-muted">源文件</h5>
                            <div class="form-group">
								<input class="form-control" id="s_fileId" placeholder="源文件"></input>
                            </div> 
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">性能范围（始）</h5>
							<div class="form-group">
								<input class="form-control" id="s_performMin" placeholder="性能范围（始）"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">性能范围（至）</h5>
							<div class="form-group">
								<input class="form-control" id="s_performMax" placeholder="性能范围（至）"></input>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">集合内误差平方和</h5>
							<div class="form-group">
								<input class="form-control" id="s_wssse" placeholder="集合内误差平方和"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">平均中心距离</h5>
							<div class="form-group">
								<input class="form-control" id="s_distanceMean" placeholder="平均中心距离"></input>
							</div>
						</div>
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
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">创建用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_createUser"></select>
							</div>
						</div>
						<div class="col-md-9">
							<div style="height:25px"></div>
							<div class="form-group pull-right">
								<button type="button" class="btn btn-success" id="reset_button">重置</button>
							</div>
							<div class="form-group pull-right">
								<button type="button" class="btn btn-success" id="filter_button">过滤</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
	  				    <div class="col-md-12 ">

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
                                <th>ID</th>
                                <th>文件名</th>
								<th>适用场景</th>
                                <th>训练结果</th>
                                <th>集合内误差平方和</th>
                                <th>平均中心距离</th>
                                <th>处理性能（ms/条）</th>
								<th>输入参数</th>
								<th>创建应用</th>
                                <th>创建用户</th>
                                <th>创建时间</th>
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
			<form method="post" class="validate" id="dataform" onsubmit="return submitDetail();">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 id="modaltitle" class="modal-title"></h4>
			</div>
					<div class="modal-body">
						<div class="row" >
							<input name='id' class="hidden"></input>
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">场景名称</label>
									<input class="form-control" name="name" placeholder="场景名称" data-validate="required" data-message-required="此项必须输入." required="required"></input>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">场景描述</label>
									<textarea id="sceneDesc" name="sceneDesc" class="col-md-12" rows="4" data-validate="required" data-message-required="此项必须输入." required="required"></textarea>
								</div>			
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">数据维度名称</label>
									<textarea id="condName" name="condName" class="col-md-12" rows="4" data-validate="required" data-message-required="此项必须输入." required="required"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="name" class="control-label">策略名称</label>
									<input class="form-control" name="strategyName" placeholder="策略名称" data-validate="required" data-message-required="此项必须输入." required="required"></input>
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
	            "url" : "kMeansList",
	            "type" : "POST",
	            "data" : function(d) {
	                var orders = d.order;
	                for (var i = 0; i < orders.length; i++) {
	                    d["norder[" + i + "][column]"] = d.columns[orders[i]['column']].data;
	                    d["norder[" + i + "][dir]"] = orders[i]['dir'];
	                }
	                d.fileId = $('#s_fileId').val();
	                d.scene = $('#s_scene').val();
	                d.trainRes = $('#s_trainRes').val();
	                d.wssse = $('#s_wssse').val();
					d.distanceMean = $('#s_distanceMean').val();
					d.performMin = $('#s_performMin').val();
	                d.performMax = $('#s_performMax').val();
	                d.createUser = $('#s_createUser').val();
	                d.crtStartTime = $('#s_crtStartTime').val();
	                d.crtEndTime = $('#s_crtEndTime').val();
	            }
	        },
	        "columns" : [
	            { "data" : "id" },//条件ID
	            { "data" : "fileId" },//源文件
	            { "data" : "scene" },//适用场景
	            { "data" : "trainRes" },//预测结果
	            { "data" : "wssse" },//总体均方差
				{ "data" : "distanceMean" },//总体均方差
				{ "data" : "performance" },//处理性能
	            { "data" : "modelArgs" },//模型参数
				{ "data" : "createApp" },//创建应用
	            { "data" : "createUser" },//创建用户名
	            { "data" : "createTime" }//创建时间
	        ],
			"columnDefs" : [{
                "render" : function (data, type, row) {
                	return "<a href='kMeansById?resultId="+row.id+"'>"+data+"</a>";
                },
                "targets" : [3]
	        }]
	    };
	    var setparams = WebUtils.settings;
	    setparams.ordering = false;
	    var params = $.extend({}, setparams, initparams);
	    table = $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);
	    table.draw();
	    
		
		//明细对话框消失后刷新
		$('#detail').on('hidden.bs.modal', function (event) {
			table.draw();
		});
	    
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
</body>
</html>