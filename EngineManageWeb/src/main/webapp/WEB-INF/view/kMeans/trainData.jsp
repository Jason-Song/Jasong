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
<title>K均值聚类引擎训练数据</title>
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
					<h1 class="title">K均值聚类引擎训练数据</h1>
					<p class="description">按照模板格式上传训练数据，可进行K均值聚类模型训练</p>
				</div>
			</div>
      		<div class="panel panel-default collapsed">
				<div class="panel-heading">
					<h3 class="panel-title">训练数据列表</h3>
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
	                            <label class="btn btn-blue" id="trainbutton">
	                                <input type="checkbox">训练</input>
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
					<h4 class="modal-title">新增训练数据</h4>
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
<div class="modal fade" id="traindetail">
   <div class="modal-dialog" >
       <div class="modal-content">
       		<form id="trainForm" method="post" class="validate" onsubmit="return submitDetail();">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>				
					<h4 class="modal-title"></h4>
				</div>
				<div id="parent">
					<div class="modal-body">
						<div class="row">
							<input name='id' class="hidden"></input>	
							<input name='hdfsName' class="hidden"></input>		
							<input name='t_scene' class="hidden"></input>	
							<input name='random' class="hidden"></input>	
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">聚类数</label>
				                    <input name="numClusters" id="numClusters" style='width:100%' data-validate="required"></input>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">迭代次数</label>
				                    <input name="numIterations" id="numIterations" style='width:100%' data-validate="required"></input>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							  	<div class="form-group">
 		              		 		<h5 class="text-muted" style='height:10px;'></h5>
									<button type="submit" class="btn btn-success pull-right" id="train_button">开始训练</button>
		                        </div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group" id="trainInfo"></div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="modal-footer">				
				<button class="btn btn-success pull-left hidden" id="resbutton">查看训练结果</button>
			</div>
       </div>
   </div>
</div>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  
	<div class="modal-dialog" role="document">  
		<div class="modal-content">  
			<label class="control-label" id="progressInfo"></label>
			<div class="progress progress-striped active" style="margin-bottom: 0px; height: 25px; border-radius: 5px;">  
				<div id="progressId" class="progress-bar" style="width: 1%; height: 100%;">0%</div>  
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
	var msgstr = new Set();
	var resultId;
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
	            "url" : "trainDataList",
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
                	else if(data=="1")return "正在训练";
                	else if(data=="2")return "训练成功";
                	else if(data=="3")return "训练失败";
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
				$("#dataform").attr("action","trainDataAdd");
				$(".modal-title").html("新增训练数据");
				$('#detail form')[0].reset();
				$("#unit").val('').trigger("change");
				$("#fileType").val('txt').trigger("change");
			});
			$('#detail').modal({show:true,backdrop:"static"});
		});
		
		$('#trainbutton').click( function () {
			var data = table.row('.selected').data();
			var random = Math.random().toString().replace('.','');
			$("input[name='random']").val(random);
			if(data){
				$("#traindetail").on("shown.bs.modal",function(){
					$("#trainForm").attr("action","train");
					$(".modal-title").html("训练模型参数");
					$("input[name='id']").val(data['id']);
					$("input[name='hdfsName']").val(data['hdfsName']);
					$("input[name='numClusters']").val("2");
					$("input[name='numIterations']").val("20");
					$("input[name='t_scene']").val(data['scene']);
				});
				$('#traindetail').modal({show:true,backdrop:"static"});
			}else{
				parent.WebUtils.alert("请选择一条记录");
			}
		});
		$('#train_button').click(function(){
			$("#trainInfo").html("");
			$("#resbutton").addClass("hidden");
			var numClusters = $("input[name='numClusters']").val();
			var numIterations= $("input[name='numIterations']").val();
			var random = $("#random").val();
			if(numClusters!=""&&numIterations!=""&&random!=""){
				setProgress("progressId", "0%");  
				// 开启进度条模态框  
				openModal("myModal1");  
				// 定时请求任务进度  
				t=setTimeout("queryTaskProgress('"+random+"','1','1')",1000); 
			}
		});
	});
	
	$("#resbutton").click(function(){  
    	window.location.href='modelByKMeansId?kMeansId='+resultId;
   	}); 
	
	function submitDetail() {
		var form = $('#traindetail form');
		if (form.valid()) {
			var url = form.attr('action');
			var data = form.serialize();
			$.ajax({
        		type:"post",
        		data:data,
        		url:"train",
        		dataType:"json",
        		success:function(dt){
        		}
        	});
			
		    var numClusters = $("input[name='numClusters']").val();
			var numIterations= $("input[name='numIterations']").val();
			var random = $("input[name='random']").val();
			if(numClusters!=""&&numIterations!=""&&random!=""){
				setProgress("progressId", "0%");  
				// 开启进度条模态框  
				openModal("myModal1");  
				// 定时请求任务进度  
				queryTaskProgress(random,'1','1'); 
			}
			
			table.draw();
			return false;
		}	
	}

	$('#insert_button').click(function() {
		var fileType = $("#fileType").val();
		if(fileType == ""){
        	parent.WebUtils.alert("请选择文件类型...");
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
    	window.location.href='downTrainFile';
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
    	oReq.open( "POST", "trainDataAdd" , true );  
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
	
	/** 
     * 设置进度条 
     * @param id 
     * @param value 
     */  
    function setProgress(id,value){  
        $("#"+id).css("width",value);  
        $("#"+id).html(value);  
    }  
      
    /** 
     * 开启模态框 
     * @param id 
     */  
    function openModal(id){  
        $('#'+id).on('show.bs.modal', function(){  
            var $this = $(this);  
            var $modal_dialog = $this.find('.modal-dialog');  
            // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零  
            $this.css('display', 'block');  
            $modal_dialog.css({'margin-top': Math.max(0, ($(window).height() - $modal_dialog.height()) / 2) });  
       });  
        $('#'+id).modal({backdrop: 'static', keyboard: false});  
    }  
	
	/** 
     * 请求任务进度 
     */  
	function queryTaskProgress(resNo,fileType,lineNo){  
	    // ajax 发送请求获取任务运行状态，如果返回运行失败或成功则关闭弹框  
		if(resNo!="undefined"){
	    $.ajax({  
	        type : "POST",  
	        url : "trainMonitor",  
	        async:false,// 同步执行  
	        data:{
				"trainRes":resNo,
				"fileType":fileType,
				"lineNo":lineNo
			},  
	        success : function(data) {  
				var data=data.data;
				var data1=data.msgInfo;
				var data2=data.fileType;
				var data3=data.lineNo;
				
				var infolength = data1.length;
				for(var i=0;i<infolength;i++){
					var info=data1[i];
					if(info!=""){
						if(info.indexOf("结果ID:")==0){
							var resultInfos = info.split(":");
							resultId=resultInfos[1];
						}
						$("#progressInfo").html(info);
						msgstr.add(info); 
					}
				}
				
				var no = parseInt(data3);
				var percent = Math.floor((no/(no+2))*100).toString()+"%";
				setProgress("progressId", percent); 
				//alert(data2);
	            if(data2=="2"){// 不包含 ，任务运行完成（失败或成功）  
	                clearTimeout(t);// 关闭计时器  
	                // 关闭弹窗进度条  
	                $('#myModal1').modal("hide");  
	                // 开启提示条模态框  
	              
	                parent.WebUtils.alert("训练完成！");  
	                  
	               // console.info("closed!"); 
				    var msg="";
				    msgstr.forEach(function (item) {
						msg+=item.toString() + "\n";
					});
					$("#trainInfo").html("<label class='control-label'>训练信息：</label><textarea class='col-md-12' rows='4'>"+msg+"</textarea>");
					$("#resbutton").removeClass('hidden');
	                return ;  
	            }  

	            // 进度查询每次间隔1500ms  
	            t=setTimeout("queryTaskProgress('"+resNo+"','"+data2+"','"+data3+"')",1500);  
	        },  
	        error: function(data){  
	            console.info("error"+data);      
	        }  
	    });  
		}
	}  
	</script>
	<s:enums keys="em_fileType,em_status"></s:enums>
	<script type="text/javascript">
		$(function() {
			//下拉框数据绑定
			WebUtils.bindSelect('s_fileType', 'em_fileType', true);
			WebUtils.bindSelect('fileType', 'em_fileType', true);
			WebUtils.bindSelect('s_status', 'em_status', true);
			WebUtils.bindSelect('status', 'em_status', true);
		});
	</script>
</body>
</html>