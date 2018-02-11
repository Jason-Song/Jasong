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
	
	<title>K均值聚类结果详细</title>

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
					<h1 class="title">K均值聚类结果详细</h1>
					<p class="description">提供K均值聚类结果文件的过滤、展示、筛选、下载等功能</p>
				</div>
			</div>
			<div class="panel panel-default collapse show" id="contentPic">
				<div class="panel-heading">
					<h3 class="panel-title">KMeans结果详细</h3>
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
							<input class="hidden" id="s_resultId" name="s_resultId" value=<c:if test="${not empty resultId}">${requestScope.resultId}</c:if> />
							<input class="hidden" id="s_kMeansId"></input>
							<input class="hidden" id="s_sceneId"></input>
							<input class="hidden" id="s_trainRes" name="s_trainRes" />
							<label class="control-label">适用场景</label>
							<input class="form-control" readonly="readonly" id="s_sceneName"></input>
						</div>
						<div class="col-md-3">
							<label class="control-label">最大可能结果人数</label>							
							<input class="form-control" id="s_personNo" name="s_personNo" />
						</div>
						<div class="col-md-3">
							<label class="control-label">差异度最大阈值</label>							
							<input class="form-control" id="s_distanceMax" name="s_distanceMax" />
						</div>
						<div class="col-md-3">
							<div class="btn-group " data-toggle="buttons">
	  				       		<div style="width:50px;height:27px;" ></div>
	                            <label class="btn btn-blue" id="filterbutton">
	                                <input type="checkbox">过滤</input>
	                            </label>
	                       </div>
						   <div class="btn-group " data-toggle="buttons">
						   		<label class="btn btn-blue" id="predictbutton">
	                                <input type="checkbox">下载结果</input>
	                            </label>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
						<label class="control-label">结果总数：</label>
						<div id="totalno"></div>
					</div>
					<div class="row">
						<div class="col-md-12" id="cont" style="width: 1100px;height:1400px; margin: 0 auto"></div>
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
	var filterList=[];
	var clusterList=[];
	var centermap=[];
	var filterContent="编号 类别 差异度\n";
	$(function(){

		$.ajax({    
			"type":'get',    
			"url": "kMeansInfo", 
			"data":	"resultId="+$("#s_resultId").val(),	
			"async":false,
			"success" : function(data) { 
				var dataObj = data.data;
				$("#s_trainRes").val(dataObj.TRAINRES);
				$("#s_sceneId").val(dataObj.SCENEID);
				$("#s_sceneName").val(dataObj.SCENENAME);
				$("#s_kMeansId").val(dataObj.PREDICTID);
			}    
		});		
		
		$.ajax({
			"type":'get',    
			"url": "getCenters", 
			"data":	"kMeansId="+$("#s_kMeansId").val(),	
			"async":false,
			"success" : function(data) { 
				var dataObj = data.data;
				for(var i=0;i<dataObj.length;i++){
					var center = dataObj[i];
					centermap[center.CLUSTER_ID]=center.CENTER;
				}
			}    
		});
		// alert(centermap.length);
		$("#filterbutton").click(function(){
			filterList=[];
			clusterList=[];
			filterContent="编号 类别 差异度\n";
			var trainRes = $("#s_trainRes").val();
			$.ajax({    
				type:'POST',    
				url: "kMeansFilter", 
				data:{
					"filterArgs":$("#s_personNo").val()+":"+$("#s_distanceMax").val(),
					"trainRes":trainRes,
					"resultId":$("#s_resultId").val(),
					"sceneId":$("#s_sceneId").val()
				},	
				success : function(data) { 					
					// alert(data.msgData);
					// alert(data.data.msgData);
				}
			});
			
			// 弹出窗提示程序正在运行  
            setProgress("progressId", "0%");  
              
            // 开启进度条模态框  
            openModal("myModal1");  
            var resNo=trainRes.substr(trainRes.length-22,22);
            // 定时请求任务进度  
			//queryTaskProgress(resNo,1,1);
            t=setTimeout("queryTaskProgress('"+resNo+"','1','1')",1000); 
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
	    $.ajax({  
	        type : "POST",  
	        url : "monitor",   
	        async:false,// 同步执行  
	        data:{
				"trainRes":resNo,
				"fileType":fileType,
				"lineNo":lineNo
			},  
	        success : function(data) {  
				var data=data.data;
				var data0=data.march;
				var data1=data.msgInfo;
				var data2=data.fileType;
				var data3=data.lineNo;
				
				var infolength = data1.length
				for(var i=0;i<infolength;i++){
					var info=data1[i];
					if(info!="")$("#progressInfo").html(info);
					if(data2=="3")filterList.push(info);
					else if(data2=="4")clusterList.push(info);
				}
				//alert(data2);
	            if(data2=="4"){// 不包含 ，任务运行完成（失败或成功）  
	                clearTimeout(t);// 关闭计时器  
	                // 关闭弹窗进度条  
	                $('#myModal1').modal("hide");  
	                // 开启提示条模态框  
	              
	                parent.WebUtils.alert(data0=="100%"?"过滤完成！":(data0=="FAILED"?"调用建模失败!":"模型训练被杀死！"));  
	                  
	                // openModal("myModal2");  
	                console.info("closed!");  
					
					//$('#myModal1').modal("hide");  
					var myChart = echarts.init(document.getElementById('cont'));  
					// var pChart = echarts.init(document.getElementById('points')); 
					myChart.showLoading();			
					var rows=[];
					var columns=[];
					$.ajax({    
						"type":'post',    
						"url": "getSceneRowCol", 
						"data":	"sceneId="+$("#s_sceneId").val(),	
						"async":false,
						"success" : function(data) { 
							var rowCols=data.data;
							rows=rowCols.rows;
							columns=rowCols.columns;
						}    
					});

					var clufeatures=[];
					for(var i=0;i<centermap.length;i++){
						var px = centermap[i];
						var centerfeas = px.slice(1,px.length-1).split(",");
						var centerstr="";
						for(var j=0;j<centerfeas.length;j++){
							centerstr+=columns[j]+":"+centerfeas[j]+"\n";
						}
						clufeatures[i]=centerstr;			
					}
					
					var legendata=[];
					var seridata=[];
					var piedata=[];
					var totalno=0;
					for(var i=0;i<clusterList.length;i++){
						var obj=JSON.parse(clusterList[i]);
						var clusterno = parseInt(obj.cluster);
						var piename="第"+(clusterno+1)+"类数量\n该类特征\n【\n"+clufeatures[clusterno]+"】";
						var count = obj.count;
						legendata.push(piename);
						piedata.push({
							name:piename,
							value:count
						});
						totalno+=count;
					}

					for(var i=0;i<filterList.length;i++){
						// var filteres = filterList[i];
						var obj=JSON.parse(filterList[i]);
						filterContent+=rows[obj.rowno]+" 第"+(parseInt(obj.cluster)+1)+"类 "+obj.distance+"\n";
					}
					
					$("#totalno").html(totalno);
					
					myChart.hideLoading();			
					myChart.setOption(option = {
						title : {
							text: '各类数量统计',
							x:'center'
						},
						tooltip : {
							trigger: 'item',
							formatter: "{a} <br/>{b} : {c} ({d}%)"
						},
						toolbox: {
							show : true,
							feature : {
								mark : {show: true},
								dataView : {show: true, readOnly: false},
								restore : {show: true},
								saveAsImage : {show: true}
							}
						},
						legend: {
							type: 'scroll',
							//orient: 'vertical',
							bottom: 10,
							left: 'center',
							data: legendata,
						},
						series : [
							{
								name:'各类数量',
								type:'pie',
								radius : '20%',
								center: ['50%', '40%'],
								data:piedata,
								label: {									
									normal: {
										formatter: '  {b|{b}：}{c}  {per|{d}%}  ',
										backgroundColor: '#eee',
										borderColor: '#aaa',
										borderWidth: 1,
										borderRadius: 4,
										rich: {
											b: {
												align:'left',
												fontSize: 10,
												lineHeight: 12
											},
											per: {
												align:'left',
												color: '#eee',
												backgroundColor: '#334455',
												padding: [2, 4],
												borderRadius: 2
											}
										}
									}
								},
								itemStyle: {
									emphasis: {
										shadowBlur: 10,
										shadowOffsetX: 0,
										shadowColor: 'rgba(0, 0, 0, 0.5)'
									}
								}
							}
						]
					},true);
					$("#progressInfo").html("");
	                return ;  
	            }  

	            setProgress("progressId", data0);  
	            // 进度查询每次间隔1500ms  
	            t=setTimeout("queryTaskProgress('"+resNo+"','"+data2+"','"+data3+"')",1500);  
	        },  
	        error: function(data){  
	            console.info("error"+data);      
	        }  
	    });  
	}  
	$("#predictbutton").click(function(){ 
		downloadFile("KMeans预测结果.txt", filterContent);
	});
	function downloadFile(fileName, content){
		var eleLink = document.createElement('a');
		eleLink.download = fileName;
		eleLink.style.display = 'none';
		// 字符内容转变成blob地址
		var blob = new Blob([content]);
		eleLink.href = URL.createObjectURL(blob);
		// 触发点击
		document.body.appendChild(eleLink);
		eleLink.click();
		// 然后移除
		document.body.removeChild(eleLink);
	}
	</script>
</body>
</html>