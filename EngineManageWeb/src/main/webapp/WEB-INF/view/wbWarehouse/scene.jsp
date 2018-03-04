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
<title>场景配置</title>
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
					<h1 class="title">场景配置</h1>
					<p class="description">配置业务场景及与其相关的数据维度</p>
				</div>
			</div>
      		<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">业务场景列表</h3>
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
                            <h5 class="text-muted">场景描述</h5>
                            <div class="form-group">
								<input class="form-control" id="s_sceneDesc" placeholder="场景描述"></input>
                            </div> 
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">条件名称</h5>
							<div class="form-group">
								<input class="form-control" id="s_condName" placeholder="条件名称"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">策略名称</h5>
							<div class="form-group">
								<input class="form-control" id="s_strategyName" placeholder="策略名称"></input>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">创建用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_lastUpdUser"></select>
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
						<div class="col-md-3">
							<h5 class="text-muted">最后编辑用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_lastUpdUser"></select>
							</div>
						</div>
					</div>
					<div class="row">
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
						<div class="col-md-6">
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
	                            <label class="btn btn-blue" id="editbutton">
	                                <input type="checkbox">编辑</input>
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
                                <th>场景ID</th>
                                <th>场景名称</th>
                                <th>场景描述</th>
                                <th>数据维度名称</th>
                                <th>数据维度HDFS路径</th>
                                <th>行唯一标识名称</th>
								<th>行名称HDFS路径</th>
                                <th>策略名称</th>
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
<div class="modal fade" id="editdetail">
   <div class="modal-dialog" >
		<div class="modal-content">
	      	<form id="editform" method="post"  onsubmit="return submitEditDetail();">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 id="modaltitle" class="modal-title"></h4>
			</div>
					<div class="modal-body">
						<div class="row" >
							<input name='e_id' class="hidden"></input>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">场景名称</label>
									<input class="form-control" name="e_name" id="e_name" placeholder="场景名称" data-validate="required" data-message-required="此项必须输入." rssequired="required"></input>
								</div>
							</div>
							<div class="col-md-6 hidden">
								<div class="form-group">
									<label for="name" class="control-label">策略名称定义</label>
									<input class="form-control" name="e_strategyName" id="e_strategyName" placeholder="策略名称定义" ></input>
								</div>			
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">场景描述</label>
									<textarea id="e_sceneDesc" name="e_sceneDesc" class="col-md-12" rows="4" ></textarea>
								</div>			
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">数据维度名称</label>
									<textarea id="e_condName" name="e_condName" class="col-md-12" rows="4" ></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-success" id="update_button">保存</button>
					</div>
			</form>
       </div>
   </div>
</div>
<div class="modal fade" id="detail">
   <div class="modal-dialog" >
       <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 id="modaltitle" class="modal-title"></h4>
			</div>
					<div class="modal-body">
						<form id="dataform" enctype="multipart/form-data" onsubmit="return submitDetail();">
						<div class="row" >
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">场景名称</label>
									<input class="form-control" name="name" id="name" placeholder="场景名称" data-validate="required" data-message-required="此项必须输入." rssequired="required"></input>
								</div>
							</div>
							<div class="col-md-6 hidden">
								<div class="form-group">
									<label for="name" class="control-label">策略名称定义</label>
									<input class="form-control" name="strategyName" id="strategyName" placeholder="策略名称定义" ></input>
								</div>			
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">场景描述</label>
									<textarea id="sceneDesc" name="sceneDesc" class="col-md-12" rows="4" ></textarea>
								</div>			
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">数据维度名称</label>
									<input type="file" name="file" id="file" style='width:100%'></input>
									<textarea id="condName" name="condName" class="col-md-12" rows="4" ></textarea>
								</div>
							</div>
						</div>
						<div class="row hidden">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">数据行唯一识别编号</label>
									<input type="file" name="fileRow" id="fileRow" style='width:100%'></input>
									<textarea id="shortRow" name="shortRow" class="col-md-12" rows="4" ></textarea>
								</div>
							</div>
						</div>
						
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" id="downbutton">模板下载</button>
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-success" id="insert_button">保存</button>
					</div>
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
	            "url" : "sceneList",
	            "type" : "POST",
	            "data" : function(d) {
	                var orders = d.order;
	                for (var i = 0; i < orders.length; i++) {
	                    d["norder[" + i + "][column]"] = d.columns[orders[i]['column']].data;
	                    d["norder[" + i + "][dir]"] = orders[i]['dir'];
	                }
	                d.name = $('#s_name').val();
	                d.sceneDesc = $('#s_sceneDesc').val();
	                d.condName = $('#s_condName').val();
	                d.strategyName = $('#s_strategyName').val();
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
	            { "data" : "name" },//条件适用数据特征码
	            { "data" : "sceneDesc" },//条件值
	            { "data" : "condName" },//条件类型
	            { "data" : "columnName" },//条件类型
	            { "data" : "shortRow" },//条件类型
	            { "data" : "rowName" },//条件类型
	            { "data" : "strategyName" },//条件描述
	            { "data" : "createUser" },//创建用户名
	            { "data" : "createTime" },//创建时间
	            { "data" : "lastUpdUser" },//最后编辑用户名
	            { "data" : "lastUpdTime" }//最后编辑时间
	        ]
	    };
	    var setparams = WebUtils.settings;
	    setparams.ordering = false;
	    var params = $.extend({}, setparams, initparams);
	    table = $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);
	    table.draw();
	    
	    //新增
		$('#addbutton').click( function () {
			$("#detail").on("shown.bs.modal",function(){
				$("#dataform").attr("action","sceneAdd");
				$(".modal-title").html("新增场景");
				$('#detail form')[0].reset();
				//$("#condType").val('').trigger("change");
			});
			$('#detail').modal({show:true,backdrop:"static"});
		});
		
		$('#insert_button').click(function() {
			
			uploadFile();
		});
		
		//修改
		$('#editbutton').click( function () {
			var data = table.row('.selected').data();
			if (data) {
				if(data.length>1)parent.WebUtils.alert("请选择一条记录");
				$("#editdetail").on("shown.bs.modal",function(){
					$("#editform").attr("action","sceneEdit");
					$(".modal-title").html("修改场景");
					$("#e_condName").val(data['condName']);
					$("#e_shortRow").val(data['shortRow']);
					//$("#condType").val(data['condType']).trigger("change");;
					$("input[name='e_strategyName']").val(data['strategyName']);
					$("input[name='e_id']").val(data['id']);
					$("#e_sceneDesc").val(data['sceneDesc']);
					$("input[name='e_name']").val(data['name']);
				});
				$('#editdetail').modal({show:true, backdrop:'static'});
			}else {
				parent.WebUtils.alert("请选择一条记录");
			}
	    });
		
		//删除
		$('#delbutton').click( function () {
	    	var data = table.rows('.selected').data();
	    	if (data) {
				$(".modal-title").html("删除场景");
	    		var sdata = [];
	    		for (var x =0; x< data.length; x ++) {
	    			sdata.push(data[x]);
	    		}
	    		var str =  JSON.stringify(sdata);
	    		WebUtils.ajaxSubmitJson('conditionDel',str,function(result){
	    			$('#sysmsg .modal-body').text(result.msg);
	    			$('#sysmsg').modal('show');
	    			table.draw();
				});
	    	}
	    });
		
		//验证是不是txt文件
		$("#file").change(function(ev) {
			var filePath = this.value;
			var fileExt = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
			if (!checkFileExt(fileExt)) {
				parent.WebUtils.alert("上传的文件不是txt格式,请重新选择上传文件！");
				this.value = "";
				return false;
			}
		});
		
		//验证是不是txt文件
		$("#fileRow").change(function(ev) {
			var filePath = this.value;
			var fileExt = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
			if (!checkFileExt(fileExt)) {
				parent.WebUtils.alert("上传的文件不是txt格式,请重新选择上传文件！");
				this.value = "";
				return false;
			}
		});
		
		//明细对话框消失后刷新
		$('#detail').on('hidden.bs.modal', function (event) {
			table.draw();
		});  
	    
	});
	
	function checkFileExt(ext) {
        if (!ext.match(/.txt/i)) {
            return false;
        }
        return true;
    }
	
	function uploadFile() {
    	var oData = new FormData();
    	var fileObj = document.getElementById("file").files[0]; // 获取文件对象
		var fileRowObj = document.getElementById("fileRow").files[0];
    	var sceneObj = document.getElementById("name"); // 获取部门
    	var sceneDescObj = document.getElementById("sceneDesc"); // 获取文件类型
    	var strategyObj = document.getElementById("strategyName"); // 获取文件描述
    	var condNameObj = document.getElementById("condName"); 
    	var shortRowObj = document.getElementById("shortRow"); // 获取文件描述
    	if(fileObj==null)oData.append("file","");
		else oData.append("file", fileObj);
		if(fileRowObj==null)oData.append("fileRow","");
		else oData.append("fileRow", fileRowObj); 
    	oData.append("name",sceneObj.value);  
    	oData.append("sceneDesc",sceneDescObj.value);  
    	oData.append("strategyName",strategyObj.value);  
    	oData.append("condName", condNameObj.value); 
		oData.append("shortRow", shortRowObj.value);  
    	var oReq = new XMLHttpRequest();  
    	oReq.open( "POST", "sceneAdd" , true );  
    	oReq.onload = function(oEvent) {  
    	     if (oReq.status == 200) {  
		        $('#detail').modal('hide');
		    	parent.WebUtils.alert("操作成功！");
    	     } else {  
		        $('#detail').modal('hide');
	    		parent.WebUtils.alert("操作失败！");
	         }  
    	};  
    	oReq.send(oData);
    }
	
	function submitEditDetail() {
		var form = $('#editdetail form');
		if (form.valid()) {
			var url = form.attr('action');
			var data = form.serialize();
			WebUtils.ajaxSubmit(url,data,function(result){
				$('#editdetail').modal('hide');
			    table.draw();
			});
		}
		return false;
	}
	
	function submitDetail() {
		var form = $('#detail form');
		if (form.valid()) {
			var url = form.attr('action');
			var data = form.serialize();
			WebUtils.ajaxSubmit(url,data,function(result){
				$('#detail').modal('hide');
			    table.draw();
			});
		}
		return false;
	}

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
	
	$("#downbutton").click(function(){  
    	window.location.href='downTrainFile';
   	});
	</script>
</body>
</html>