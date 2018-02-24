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
	
	<title>K均值聚类模型分析</title>

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
					<h1 class="title">K均值聚类模型分析</h1>
					<p class="description">根据K均值聚类引擎反馈的模型指标，对训练模型进行分析</p>
				</div>
			</div>
			<div class="panel panel-default collapse show" id="contentPic">
				<div class="panel-heading">
					<h3 class="panel-title">分析列表</h3>
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
						<div class="col-md-3">
							<label class="control-label">文件Id</label>
							<input class="hidden" id="s_fileId" name="s_fileId" value=<c:if test="${not empty fileId}">${requestScope.fileId}</c:if> />
							<input class="form-control" readonly="readonly" id="s_fileName" name="s_fileName" />
						</div>
						<div class="col-md-3">
							<input class="hidden" id="s_sceneId"></input>
							<label class="control-label">适用场景</label>
							<input class="form-control" readonly="readonly" id="s_sceneName"></input>
						</div>
						<div class="col-md-3">
							<label class="control-label">模型序列号</label>
							<select class="form-control" id="s_modelNo" ></select>
						</div>
						<div class="col-md-3">
							<div class="btn-group " data-toggle="buttons">
	  				       		<div style="width:50px;height:27px;" ></div>
	                            <label class="btn btn-blue" id="applybutton">
	                                <input type="checkbox">应用</input>
	                            </label>
	                       </div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
						<div class="col-md-4">
							<input name='predictId' id='predictId' class="hidden"></input>		
							<label class="control-label">集合内误差平方和(WSSSE)：</label>
							<div id="wssse" ></div>
						</div>
						<div class="col-md-4">
							<label class="control-label">每条记录训练耗时(ms/条)：</label>
							<div class="" id="performance"></div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
						<div class="col-md-12" id="cont" style="width: 1100px;height:700px; margin: 0 auto"></div>
					</div>
					<div class="row">
						<h3 class="control-label">聚类单轴散点图</h3>
						<div class="col-md-12" id="points" style="width: 1100px;height:1000px; margin: 0 auto"></div>
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
	// var msgstr = new Set();
	$(function(){
		$.ajax({    
			"type":'get',    
			"url": "sceneFileInfo", 
			"data":	"fileId="+$("#s_fileId").val(),	
			"success" : function(data) { 
				$("#s_fileName").val(data.data.FILENAME);
				$("#s_sceneId").val(data.data.SCENEID);
				$("#s_sceneName").val(data.data.SCENENAME);
			}    
		});		
		$.ajax({    
			"type":'get',    
			"url": "modelNoList", 
			"data":	"fileId="+$("#s_fileId").val(),	
			"success" : function(data) { 
				var model_list = data.data;  
				var opts = "";
				for(var model_index = 0;model_index < model_list.length;model_index++){
					var model = model_list[model_index]; 
					opts += "<option value='"+model+"'>"+model+"</option>";  
				}
				$("#s_modelNo").append(opts);
				$("#s_modelNo").val(model_list[0]).trigger('change');
			}    
		});
		$('#s_modelNo').select2({  
			placeholder: "选择模型",  
			//allowClear: true  
		});	
		$("#applybutton").click(function(){  
			var random = Math.random().toString().replace('.','');
			var modelNo = $("#s_modelNo").val();
			var predictId = $("#predictId").val();	
			if(modelNo!=""&&predictId!=""&&random!=""){
				$.ajax({    
					"type":'post',    
					"url": "modelApply", 
					"data":	{
						"predictId":$("#predictId").val(),
						"modelName":"K均值聚类模型",
						"modelNo":$("#s_modelNo").val(),
						"sceneId":$("#s_sceneId").val(),
						"random":random
					},	
					"success" : function(data) { 
					}    
				});
				setProgress("progressId", "0%");  
				// 开启进度条模态框  
				openModal("myModal1");  
				// 定时请求任务进度  
				t=setTimeout("queryTaskProgress('"+random+"','1','1')",1000);
			}else{
				parent.WebUtils.alert("请选择一个模型进行应用！");
			}					
		});
		$("#s_modelNo").on("change",function(e){
			var myChart = echarts.init(document.getElementById('cont'));  
			var pChart = echarts.init(document.getElementById('points'));  
   			myChart.showLoading();			
   			pChart.showLoading();			

			$.ajax({
				type:"post",
				url:"getLineData",
				data:{
					"fileId":$("#s_fileId").val(),
					"modelNo":$("#s_modelNo").val()
				},
				dataType:"json",
				success:function(dt){    			

					if(dt.data!=null){
						var datas = [];
						var xs = [];
						var ys = [];
						var distance=dt.data.distances;
						var center=dt.data.centers;
						$("#wssse").html(dt.data.trainRes.WSSSE);
						$("#performance").html(dt.data.trainRes.PERFORMANCE);
						$("#predictId").val(dt.data.trainRes.ID);
						var dlength = distance.length;
						var categorys=[];
						var pdatas = [];
						var centermap=[];
						for(var i=0;i<center.length;i++)centermap[center[i].CLUSTER_ID]=center[i].CENTER;
						
						var inarray="";
						var j=1;
						// for(var i = dlength;i>0;i--){
							// var index = i-1;
							// var clusters = distance[index].split("|");
							// datas.push(clusters[0]);
							// var cluno = parseInt(clusters[1])+1;
							// ys.push("第"+i+"行记录（"+"属于第"+cluno+"类）");
							// var token = ","+clusters[1]+",";
							// if(inarray.indexOf(token)<0){
								// categorys.push("第"+j+"类\n聚类中心：\n"+centermap[clusters[1]]);
								// j++;
							// }
							// inarray+=token;

							// pdatas.push([clusters[1],clusters[0],2]);
						// }
						for(var i = dlength;i>0;i--){
							var index = i-1;
							var clusters = distance[index].split("|");
							datas.push(clusters[1]);
							var cluno = parseInt(clusters[2])+1;
							var rowflag = (clusters[0]==""?"第"+i+"行记录":clusters[0]);
							ys.push(rowflag+"（"+"属于第"+cluno+"类）");
							var token = ","+clusters[2]+",";
							if(inarray.indexOf(token)<0){
								categorys.push("第"+j+"类\n聚类中心：\n"+centermap[clusters[2]]);
								j++;
							}
							inarray+=token;

							pdatas.push([clusters[2],clusters[1],rowflag]);
						}
						xs.push({
							name:'差异程度【欧式距离】',
							type:'bar',
							data:datas,
							barGrap:'1%'
						});
						//$("#points").css("height","'"+j*100+"px'");
					}
					myChart.hideLoading();
					myChart.setOption(option = {
						title : {
							text: '训练文件逐行相似度评估'
						},
						tooltip : {
							trigger: 'axis'
						},
						legend: {
							left:'20%',
							data:['差异程度【欧式距离】']
						},
						toolbox: {
							show : true,
							feature : {
								mark : {show: true},
								dataView : {show: true, readOnly: false},
								magicType: {show: true, type: ['line', 'bar']},
								restore : {show: true},
								saveAsImage : {show: true}
							}
						},
						grid: {
							top: 50,
							width: '80%',
							bottom: '2%',
							left: 40,
							containLabel: true
						},
						calculable : true,
						xAxis : [
							{
								type : 'value',
								position:'top'
							}
						],
						yAxis : [
							{
								type : 'category',
								data:ys
							}
						],
						series :xs
					},true);	
					myChart.resize();
					poption = {
						tooltip: {
							position: 'top'
						},
						title: [],
						toolbox: {
							show : true,
							feature : {
								saveAsImage : {show: true}
							}
						},
						singleAxis: [],
						series: []
					};
					
					echarts.util.each(categorys,function(day, idx) {
						poption.title.push({
							textBaseline: 'middle',
							top: (idx + 0.4) * 100 / j + '%',
							text: day,
							textStyle: {
								color: '#333333',
								fontWeight: '',
								fontSize: 12
							}
						});
						poption.singleAxis.push({
							left: 150,
							type: 'value',
							boundaryGap: false,
							top: (idx * 100 / j + 5) + '%',
							height: (100 / j - 5) + '%',
							axisLabel: {
								interval: 2
							}
						});
						poption.series.push({
							singleAxisIndex: idx,
							name:"第"+(parseInt(idx)+1)+"类【欧式距离，唯一标识】",
							coordinateSystem: 'singleAxis',
							type: 'scatter',
							data: [],
							symbolSize: 8
						});
					});
					echarts.util.each(pdatas, function (dataItem) {
						poption.series[dataItem[0]].data.push([dataItem[1], dataItem[2]]);
					});
					pChart.hideLoading();

					pChart.setOption(poption,true);	
					pChart.resize();
				}
			});
		});
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
		if(resNo!="undefined"){
	    $.ajax({  
	        type : "POST",  
	        url : "applyMonitor",  
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
						$("#progressInfo").html(info);
						// msgstr.add(info); 
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
	                  
				    // var msg="";
				    // msgstr.forEach(function (item) {
						// msg+=item.toString() + "\n";
					// });
						              
	                parent.WebUtils.alert(info);
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
</body>
</html>