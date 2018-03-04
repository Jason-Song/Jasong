<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>demo Maintain Page</title>

	<link rel="stylesheet" href="../../assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../../assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../../assets/css/xenon-core.css">
	<link rel="stylesheet" href="../../assets/css/xenon-forms.css">
	<link rel="stylesheet" href="../../assets/css/xenon-components.css">
	<link rel="stylesheet" href="../../assets/css/xenon-skins.css">
	<link rel="stylesheet" href="../../assets/css/custom.css">

	<script src="../../assets/js/jquery-1.11.1.min.js"></script>
	<style type="text/css">
		.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
    position: relative;
    min-height: 1px;
    padding-left: 0px;
    padding-right: 15px;
}
	</style>
	
</head>
<body class="page-body">
	<div class="page-container">
		<div class="main-content">
			<div class="page-title">
				<div class="title-env">
					<h1 class="title">业务模型</h1>
					<p class="description">对上传数据，应用业务模型进行结果预测</p>
				</div>
			</div>
			<div class="panel panel-default collapse show" id="contentPic">
				<div class="panel-heading">
					<h3 class="panel-title">业务模型</h3>
					<div class="panel-options">
						<a href="#" data-toggle="panel">
							<span class="collapse-icon">&ndash;</span>
							<span class="expand-icon">+</span>
						</a>
						<a href="#" data-toggle="remove">
							&times;
						</a>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-4">
							<input id='hdfsName' class="hidden"></input>		
							<input id='sceneId' class="hidden"></input>	
							<label class="control-label">业务数据</label>
							<select class="form-control" id="s_productData" name="s_productData"></select>
						</div>
						<div class="col-md-4">
							<label class="control-label">模型类型</label>
							<select class="form-control" id="s_produceModel" name="s_produceModel"></select>
						</div>
						<div class="col-md-4">
						   <div class="btn-group " data-toggle="buttons">
								<div style="width:50px;height:27px;" ></div>
								<label class="btn btn-blue" id="calcubutton">
									<input type="checkbox">计算</input>
								</label>
								<label class="btn btn-blue hidden" id="resbutton">
									<input type="checkbox">查看结果</input>
								</label>
						   </div>
						</div>
					</div>						
				</div>
				<div class="panel-body-">
					<div class="row">		
						<div class="col-md-12" id="calcuInfo"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  
	<div class="modal-dialog" role="document">  
		<div class="modal-content">  
			<label class="control-label" id="progressInfo">连接慧脑引擎...</label>
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
<script src="../../assets/js/TweenMax.min.js"></script>
<script src="../../assets/js/resizeable.js"></script>
<script src="../../assets/js/joinable.js"></script>
<script src="../../assets/js/xenon-api.js"></script>
<script src="../../assets/js/xenon-toggles.js"></script>
<script src="../../assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="../../assets/js/moment.min.js"></script>

<!-- Imported scripts on this page -->
<script src="../../assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="../../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../../assets/js/select2/select2.min.js"></script>
<script src="../../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../../assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="../../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="../../assets/js/tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="../../assets/js/typeahead.bundle.js"></script>
<script src="../../assets/js/handlebars.min.js"></script>
<script src="../../assets/js/multiselect/js/jquery.multi-select.js"></script>
<script src="../../assets/js/datepicker/bootstrap-datepicker.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../../assets/js/xenon-custom.js"></script>
<script src="../../assets/js/timepicker/bootstrap-timepicker.min.js"></script>
<script src="../../assets/js/datepicker/bootstrap-datepicker.js"></script>
<script src="../../js/WebUtils.js"></script>
<script src="../../assets/js/highcharts/exporting.js"></script>
<script src="../../assets/js/echarts/echarts.min.js"></script>
<script src="../../assets/js/echarts/macarons.js"></script>

	<script type="text/javascript">
	var msgstr = new Set();
	var resultId;
	var trainFlag=0;
	$(function(){
		//获取文件ID动态菜单
		$.ajax({    
		    "type":'post',    
		    "url": "fileList",  
		    "success" : function(data) {
			    var cond_list = data.data;
			    console.log(cond_list);
			    var opts = "";
			    for(var cond_index = 0;cond_index < cond_list.length;cond_index++){
			    	var cond = cond_list[cond_index]; 
			    	opts += "<option value='"+cond.ID+"'>"+cond.IDANDNAME+"</option>";  
			    }
			    $("#s_productData").append("<option value=''></option>"+opts);
			   // $("#condIds").append(opts);
		     }    
		});
	    $('#s_productData').select2({  
            placeholder: "文件Id[文件name]",  
            allowClear: true  
        });
		$("#s_productData").on("change",function(e){
			$("#s_produceModel").val("").trigger("change");
			$("#s_produceModel").html("");
			$.ajax({    
				"type":'get',    
				"url": "getProductData", 
				"data":	"fileId="+$("#s_productData").val(),	
				"success" : function(data) { 
					$("#hdfsName").val(data.data.HDFS_NAME);
					$("#sceneId").val(data.data.SCENE);
					$("s_produceModel").html("");
					$.ajax({    
						"type":'get',    
						"url": "produceModelList", 
						"data":	"sceneId="+$("#sceneId").val(),
						"success" : function(data) { 
							var model_list = data.data; 
							var opts = "";
							for(var model_index = 0;model_index < model_list.length;model_index++){
								var model = model_list[model_index]; 
								opts += "<option value='"+model.ID+"'>"+model.MODEL_NAME+"</option>";  
							}
							$("#s_produceModel").append("<option value=''></option>"+opts);
							//$("#s_produceModel").val(model_list[0]).trigger('change');
						 }    
					});
				 }    
			});
		});
		$('#s_produceModel').select2({  
			placeholder: "选择模型",  
			allowClear: true  
		});	

		$("#calcubutton").click(function(){ 
			$('#progressInfo').html("连接慧脑引擎...");
			msgstr.clear();
			trainFlag=0;
			var fileId = $("#s_productData").val();
			var hdfsName = $("#hdfsName").val();
			var scene = $("#sceneId").val();
			var modelId = $("#s_produceModel").val();
			var random = Math.random().toString().replace('.','');

			if(fileId!=""&&hdfsName!=""&&scene!=""&&modelId!=""){
				$.ajax({    
					"type":'post',    
					"url": "modelPredict", 
					"dataType":"json",
					"data":	{
						"fileId":$("#s_productData").val(),
						"hdfsName":$("#hdfsName").val(),
						"sceneId":$("#sceneId").val(),
						"modelId":$("#s_produceModel").val(),
						"random":random
					},	
					"success" : function(data) { 
					}				
				});
				setProgress("progressId", "0%");  
				// 开启进度条模态框  
				openModal("myModal1");  
				// 定时请求任务进度  
				//queryTaskProgress(resNo,1,1);
				t=setTimeout("queryTaskProgress('"+random+"','1','1')",1000); 
			}else{
				parent.WebUtils.alert("请选择数据源和模型信息！");
			}
		}); 
		
	});
	
	$("#resbutton").click(function(){
		if(resultId==""){
			parent.WebUtils.alert("没有可查看的结果，请在计算后查看！");
			return;
		}
		window.location.href="kMeansById?resultId="+resultId;
	});
	
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
	    $.ajax({  
	        type : "POST",  
	        url : "calcuMonitor",  
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
						}else if(info.indexOf("计算成功")>0){
							trainFlag=1;
						}
						$("#progressInfo").html(info);
						msgstr.add(info);
						
						var no = parseInt(data3);
						var percent = Math.floor((no/(no+2))*100).toString()+"%";
						setProgress("progressId", percent);  
					}
				}
				//alert(data2);
	            if(data2=="2"){// 不包含 ，任务运行完成（失败或成功）  
	                clearTimeout(t);// 关闭计时器  
	                // 关闭弹窗进度条  
	                $('#myModal1').modal("hide");  
	                // 开启提示条模态框  
					var trainTip;
					var hashidden = $("#resbutton").hasClass('hidden');
					if(trainFlag){
						trainTip = "计算成功！";
						if(hashidden)$("#resbutton").removeClass('hidden');
					}else{
						trainTip = "计算失败！";
						if(!hashidden)$("#resbutton").addClass('hidden');
					}
	                parent.WebUtils.alert(trainTip);  
	                  
	               // console.info("closed!"); 
				   var msg="";
				    msgstr.forEach(function (item) {
						msg+=item.toString() + "<br />";
					});
					$("#calcuInfo").html(msg);
					
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
	</script>
</body>
</html>