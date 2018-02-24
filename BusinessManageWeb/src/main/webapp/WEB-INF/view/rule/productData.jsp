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
<title>业务数据</title>
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
					<h1 class="title">业务数据</h1>
					<p class="description">按照模板格式，上传需要分析的业务数据</p>
				</div>
			</div>
      		<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">业务数据列表</h3>
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
							<h5 class="text-muted">状态</h5>
							<div class="form-group">
								<select class="form-control" id="s_status" required></select>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">适用场景</h5>
							<div class="form-group">
								<select class="form-control" id="s_scene" required></select>
							</div>
						</div>
						<div class="col-md-3">
                            <h5 class="text-muted">上传文件名称</h5>
                            <div class="form-group">
								<input class="form-control" id="s_fileName" placeholder="上传文件名称"></input>
                            </div> 
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">文件存储位置</h5>
							<div class="form-group">
								<input class="form-control" id="s_hdfsName" placeholder="文件存储位置"></input>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">文件类型</h5>
							<div class="form-group">
								<select class="form-control" id="s_fileType"></select>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">文件描述</h5>
							<div class="form-group">
								<input class="form-control" id="s_fileDesc" placeholder="文件名称"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">文件大小（从）</h5>
							<div class="form-group">
								<input class="form-control" id="s_sizeMin" placeholder="文件大小（从）"></input>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">文件大小（到）</h5>
							<div class="form-group">
								<input class="form-control" id="s_sizeMax" placeholder="文件大小（到）"></input>								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5 class="text-muted">上传用户</h5>
							<div class="form-group">
								<select class="form-control" id="s_uploadUser"></select>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">上传时间（始）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_upStartTime"
									placeholder="上传时间（始）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>
							</div>
						</div>
						<div class="col-md-3">
							<h5 class="text-muted">上传时间（至）</h5>
							<div class="input-group">
								<input type="text" class="form-control datepicker" id="s_upEndTime"
									placeholder="上传时间（至）" />
	                            <div class="input-group-addon">
				                   <a href="#"><i class="linecons-calendar"></i></a>
				                </div>									
							</div>
						</div>						
						<div class="col-md-3">
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
	                            <label class="btn btn-blue" id="downbutton">
	                                <input type="checkbox">下载</input>
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
                                <th>文件ID</th>
                                <th>状态</th>
                                <th>上传文件名称</th>
                                <th>文件位置</th>
                                <th>文件类型</th>
                                <th>文件大小</th>
                                <th>文件描述</th>
                                <th>适用场景</th>
                                <th>扩展信息</th>
                                <th>上传用户</th>
                                <th>上传时间</th>
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
					<h4 class="modal-title">新增业务数据</h4>
				</div>
				<div id="parent">
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="name" class="control-label">文件类型</label>
									<select class="form-control" id="fileType" name="fileType" data-validate="required" data-message-required="此项必须输入." >
									</select>
								</div>			
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="name" class="control-label">适用场景</label>
									<select class="form-control" id="scene" name="scene" data-validate="required" data-message-required="此项必须输入." >
									</select>
								</div>			
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">文件描述</label>
									<textarea id="fileDesc" class="col-md-12" rows="4"></textarea>
								</div>
							</div>
						</div>
						<div class="row">		
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">数据文件</label>
				                    <input type="file" name="file" id="file" style='width:100%' data-validate="required"></input>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="downbutton">模板下载</button>
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
		//获取scene动态菜单
		$.ajax({    
		    "type":'get',    
		    "url": "sceneList",  
		    "success" : function(data) { 
			    var scene_list = data.data;  
			    var opts = "";
			    for(var scene_index = 0;scene_index < scene_list.length;scene_index++){
			    	var scene = scene_list[scene_index]; 
			    	opts += "<option value='"+scene.ID+"'>"+scene.NAME+"</option>";  
			    }
			    $("#s_scene").append("<option value=''></option>"+opts);
			    $("#scene").append(opts);
		     }    
		});
	    $('#scene').select2({  
            placeholder: "选择场景",  
            allowClear: true  
        });  	
	    $('#s_scene').select2({  
            placeholder: "选择场景",  
            allowClear: true  
        });	
	    //初始化列表
	    var initparams = {
	        "ajax" : {
	            "url" : "productDataList",
	            "type" : "POST",
	            "data" : function(d) {
	                var orders = d.order;
	                for (var i = 0; i < orders.length; i++) {
	                    d["norder[" + i + "][column]"] = d.columns[orders[i]['column']].data;
	                    d["norder[" + i + "][dir]"] = orders[i]['dir'];
	                }
	                d.unit = '';
	                d.status = $('#s_status').val();
	                d.fileName = $('#s_fileName').val();
	                d.hdfsName = $('#s_hdfsName').val();
	                d.fileType = $('#s_fileType').val();
	                d.fileDesc = $('#s_fileDesc').val();
	                d.sizeMin = $('#s_sizeMin').val();
	                d.sizeMax = $('#s_sizeMax').val();
	                d.uploadUser = $('#s_uploadUser').val();
	                d.upStartTime = $('#s_upStartTime').val();
	                d.upEndTime = $('#s_upEndTime').val();
	            }
	        },
	        "columns" : [
	            { "data" : "id" },//文件ID
	            { "data" : "status" },//状态
	            { "data" : "fileName" },//文件名称
	            { "data" : "hdfsName" },//文件位置
	            { "data" : "fileType" },//文件类型
	            { "data" : "fileSize" },//文件大小
	            { "data" : "fileDesc" },//文件描述
	            { "data" : "scene" },//文件描述
	            { "data" : "extra" },//扩展信息
	            { "data" : "uploadUser" },//上传用户
	            { "data" : "uploadTime" },//上传时间
	        ],
	        "columnDefs" : [{
                "render" : function (data, type, row) {
                	return "<a href='modelById?fileId="+row.id+"'>"+data+"</a>";
                },
                "targets" : [0]
	        },{
                "render" : function (data, type, row) {
                	if(data=="0")return "未处理";
                	else if(data=="1")return "正在计算";
                	else if(data=="2")return "计算成功";
                	else if(data=="3")return "计算失败";
                },
                "targets" : [1]
	        }]
	    };
	    var setparams = WebUtils.settings;
	    setparams.ordering = false;
	    var params = $.extend({}, setparams, initparams);
	    table = $("#listtable").DataTable(params);
	    WebUtils.initColumnHider(table);
	    table.draw();
	    
		$('#addbutton').click( function () {
			$("#detail").on("shown.bs.modal",function(){
				$("#dataform").attr("action","productDataAdd");
				$(".modal-title").html("新增训练数据");
				$('#detail form')[0].reset();
				$("#unit").val('').trigger("change");
				$("#fileType").val('txt').trigger("change");
			});
			$('#detail').modal({show:true,backdrop:"static"});
		});
		
		$('#downbutton').click( function () {
			//$("#traindetail").on("shown.bs.modal",function(){
				//$("#dataform").attr("action","trainDataAdd");
			//});
			
		});
	});
	
	

	$('#insert_button').click(function() {
		var fileType = $("#fileType").val();
		var sceneId = $("#scene").val();
		if(fileType == ""){
        	parent.WebUtils.alert("请选择文件类型...");
            return false;
		}
		if(sceneId == ""){
        	parent.WebUtils.alert("请选择适用场景...");
            return false;
		}
        var text = $("#file").val();
        if (text == "") {
        	parent.WebUtils.alert("请先上传txt文件...");
            return false;
        }
        if (!text.match(/.txt/i)) {
            return false;
        }
        uploadFile();
	});
    //过滤条件设置按钮
    $('#filter_button').click(function() {
        table.draw();
    });
    //过滤条件重置按钮
    $("#reset_button").click(function() {
        $("#inputName input").val('');
        $("#inputName select").val("");
    });
    
	//验证是不是txt文件
    $("#file").change(function(ev) {
        var filePath = this.value;
        var fileExt = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
        if (!checkFileExt(fileExt)) {
        	parent.WebUtils.alert("上传的文件不是txt格式,请重新上传！");
            this.value = "";
            return false;
        }
    });

    $("#downbutton").click(function(){  
    	window.location.href='downProductFile';
   	}); 
    function checkFileExt(ext) {
        if (!ext.match(/.txt/i)) {
            return false;
        }
        return true;
    }
  
    function checkFile() {
        var text = $("#file").val();
        if (text == "") {
        	parent.WebUtils.alert("请先上传txt文件...");
            return false;
        }
        if (!text.match(/.txt/i)) {
            return false;
        }
        uploadFile();
    }
   //附件上传
    function uploadFile() {
    	var oData = new FormData();
    	var fileObj = document.getElementById("file").files[0]; // 获取文件对象
    	//var unitObj = document.getElementById("unit"); // 获取部门
    	var fileTypeObj = document.getElementById("fileType"); // 获取文件类型
    	var fileDescObj = document.getElementById("fileDesc"); // 获取文件描述
    	var sceneObj = document.getElementById("scene"); // 获取文件描述
    	oData.append("file", fileObj);  
    	//oData.append("unit", unitObj.value);  
    	oData.append("fileType", fileTypeObj.value);  
    	oData.append("fileDesc", fileDescObj.value);  
    	oData.append("scene", sceneObj.value);  
    	var oReq = new XMLHttpRequest();  
    	oReq.open( "POST", "productDataAdd" , true );  
    	oReq.onload = function(oEvent) {  
    	     if (oReq.status == 200) {  
		        $('#detail').modal('hide');
		    	parent.WebUtils.alert("上传训练数据文件成功！");
    	     } else {  
		        $('#detail').modal('hide');
	    		parent.WebUtils.alert("上传训练数据文件失败！");
	         }  
    	};  
    	oReq.send(oData);
    }
	</script>
	<s:enums keys="market_fileType,market_status"></s:enums>
	<script type="text/javascript">
		$(function() {
			//下拉框数据绑定
			WebUtils.bindSelect('s_fileType', 'market_fileType', true);
			WebUtils.bindSelect('fileType', 'market_fileType', true);
			WebUtils.bindSelect('s_status', 'market_status', true);
			WebUtils.bindSelect('status', 'market_status', true);
		});
	</script>
</body>
</html>