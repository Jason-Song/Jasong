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
	
	<title>FPGrowth模型分析</title>

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
					<h1 class="title">FPGrowth模型分析</h1>
					<p class="description">根据FPGrowth引擎反馈的模型指标，对训练模型进行分析</p>
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
								<label class="btn btn-blue predictbutton">
	                                <input type="checkbox">下载预测结果</input>
	                            </label>
	                       </div>
						</div>
					</div>
				</div>
				<div class="panel-body-">
					<div class="row">
						<div class="col-md-4">
							<label class="control-label">每条记录训练耗时(ms/条)：</label>
							<div class="" id="performance"></div>
						</div>
					</div>
					<div class="row">
						<div class="btn-group " data-toggle="buttons">
							<div style="width:50px;height:27px;" ></div>
							<label class="btn btn-blue" id="freqbutton">
								<input type="checkbox">下载频繁项集</input>
							</label>
						</div>
						<div class="col-md-12" id="cont" style="width: 1100px;height:700px; margin: 0 auto"></div>
					</div>
					<div class="row">
						<div class="btn-group " data-toggle="buttons">
							<div style="width:50px;height:27px;" ></div>
							<label class="btn btn-blue" id="rulebutton">
								<input type="checkbox">下载关联规则</input>
							</label>
						</div>
						<div class="col-md-12" id="points" style="width: 1100px;height:1000px; margin: 0 auto"></div>
					</div>
					<div class="row">
						<div class="btn-group " data-toggle="buttons">
							<div style="width:50px;height:27px;" ></div>
							<label class="btn btn-blue predictbutton">
								<input type="checkbox">下载预测结果</input>
							</label>
						</div>
						<div class="col-md-12" id="predict" style="width: 1100px;height:1000px; margin: 0 auto"></div>
					</div>
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
 		
	$(function(){
		var sceneId;
		var predictContent;
		var freqContent;
		var ruleContent;
		$.ajax({    
			"type":'get',    
			"url": "sceneFileInfo", 
			"data":	"fileId="+$("#s_fileId").val(),	
			"async":false,
			"success" : function(data) { 
				sceneId=data.data.SCENEID;
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
			$.ajax({    
				"type":'post',    
				"url": "modelApply", 
				"data":	{
					"predictId":$("#predictId").val(),
					"modelName":"FPGrowth模型",
					"modelNo":$("#s_modelNo").val(),
					"sceneId":$("#s_sceneId").val()
				},	
				"success" : function(data) { 
					alert(data.msg);
				}    
			});
		});
		
		$("#s_modelNo").on("change",function(e){
			var myChart = echarts.init(document.getElementById('cont'));
			var pChart = echarts.init(document.getElementById('points'));  
			var preChart = echarts.init(document.getElementById('predict'));
			
			predictContent="行唯一标识号 前提条件 预测结果\n";
			freqContent="频繁项 频次(次)\n";
			ruleContent="前提 结论 置信度\n";
			
   			myChart.showLoading();			
			pChart.showLoading();	
			preChart.showLoading();
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
						var freqs=dt.data.freq;
						var rules=dt.data.rule;
						var pre=dt.data.pre;
						$("#performance").html(dt.data.trainRes.PERFORMANCE);
						$("#predictId").val(dt.data.trainRes.ID);
						var dlength = freqs.length;
						var categorys=[];
						var pdatas = [];
						var centermap=[];
						
						var inarray="";
						var j=1;
						for(var i = dlength;i>0;i--){
							var index = i-1;
							var freq = JSON.parse(freqs[index]);
							var combine = freq.items.join("+");
							var freqval=freq.freq;
							ys.push(combine);
							datas.push(freqval);
							freqContent+="["+combine+"] "+freqval+"\n";
						}
						xs.push({
							name:'出现频次',
							type:'bar',
							data:datas,
							barGrap:'1%'
						});
					}
					myChart.hideLoading();
					myChart.setOption(option = {
						title : {
							text: '频繁项统计'
						},
						tooltip : {
							trigger: 'axis'
						},
						legend: {
							left:'20%',
							data:['出现频次']
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
							width: '90%',
							bottom: '2%',
							left: 60,
							containLabel: true
						},
						calculable : true,
						xAxis : [
							{
								type : 'value',
								position:'top',
								axisLabel: {
									formatter : function(v) {
										return v + '次'
									}
								}
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
					
					var xp=[];
					var yp=[];
					var repeat=[];
					for(var i = rules.length;i>0;i--){
						var index = i-1;
						var rule = JSON.parse(rules[index]);
						var ant = rule.antecedent.join("+");
						var cons = rule.consequent.join("+");
						var confi=rule.confidence;
						pdatas.push([ant,cons,confi]);
						xp.push(ant);
						if(repeat.indexOf(cons)<0)yp.push(cons);
						repeat.push(cons);
						ruleContent+="["+ant+"] ["+cons+"] "+confi+"\n";
					}
					var schema = [
						{name: '前提', index: 0, text: '前提'},
						{name: '结论', index: 1, text: '结论'},
						{name: '置信度', index: 2, text: '置信度'}						
					];


					var itemStyle = {
						normal: {
							opacity: 0.8,
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowOffsetY: 0,
							color: '#f4e925',
							shadowColor: '#333'
						}
					};
					pChart.hideLoading();
					pChart.setOption(poption = {
						title : {
							text : '关联规则散点示意图',
						},
						tooltip : {
							padding: 10,
							backgroundColor: '#222',
							borderColor: '#777',
							borderWidth: 1,
							formatter: function (obj) {
								var value = obj.value;
								return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'+'关联规则详情：'+ '</div>'
									+ schema[0].text + '：' + value[0] + '<br>'
									+ schema[1].text + '：' + value[1] + '<br>'
									+ schema[2].text + '：' + value[2] + '<br><br>'
									+ '由 '+value[0] + ' 推出 '+ value[1]+ '<br>'							
									+ schema[2].text + '为：' + value[2] + '<br>';
							}
						},
						grid: {
							top: 60,
							width: '90%',
							bottom: '15%',
							left: 70,
							containLabel: true
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
						dataZoom: {
							show: true,
							start : 30,
							end : 70
						},
						legend : {
							data : ['规则点']
						},					
						 xAxis : [
							{
								name:'前提',
								type : 'category',
								data:xp
							}
						],
						yAxis : [
							{
								name:'结论',
								type : 'category',
								data:yp
								
							}
						],
						series : [
							{
								name: '规则点',
								type: 'effectScatter',
								data: pdatas,								
								hoverAnimation: true,
								itemStyle: itemStyle,
								zlevel: 1,
								tooltip : {
									trigger: 'item',
									axisPointer:{
										show: true
									}
								}
							}								
						]
					},true);
					
					var xpre=[];
					var ypre=[];
					var predatas=[];
					var prepeat=[];
					var rows=[];
					$.ajax({    
						"type":'post',    
						"url": "getSceneRow", 
						"data":	"sceneId="+sceneId,	
						"async":false,
						"success" : function(data) { 
							rows=data.data;
						}    
					});
					var rowno = rows.length;
					var flag=(rowno>0);
					for(var i = 0;i< pre.length;i++){
						//var index = i;
						var pred = JSON.parse(pre[i]);
						var product = pred.items.join("+");
						var res = pred.prediction.join("+");
					
						predatas.push([i,res,product]);
						if(flag){
							var rowstr=rows[i];
							xpre.push(rowstr);
							predictContent+=rowstr;
						}else{
							var rowstr = "第"+(i+1)+"条记录";
							xpre.push(rowstr);
							predictContent+=rowstr;
						}
						if(prepeat.indexOf(res)<0)ypre.push(res);
						prepeat.push(res);
						predictContent+=" ["+product+"] ["+res+"]\n";
					}
					
					var preschema = [
						{name: '唯一标识', index: 0, text: '行号'},
						{name: '预测', index: 1, text: '预测'},
						{name: '前提', index: 2, text: '前提'}						
					];
					preChart.hideLoading();
					preChart.setOption(preoption = {
						title : {
							text : '规则匹配预测结果散点示意图',
						},
						tooltip : {
							padding: 10,
							backgroundColor: '#222',
							borderColor: '#777',
							borderWidth: 1,
							formatter: function (obj) {
								var value = obj.value;
								return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'+(flag?rows[value[0]]:('第'+(value[0]+1)+ '条记录'))+'</div>'
									+ preschema[2].text + '：' + value[2] + '<br>'
									+ preschema[1].text + '：' + value[1] + '<br><br>'
									+ '由 '+value[2] + ' 依据关联规则推出 '+ value[1]+ '<br>';
							}
						},
						grid: {
							top: 60,
							width: '85%',
							bottom: '15%',
							left: 60,
							containLabel: true
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
						dataZoom: {
							show: true,
							start : 30,
							end : 70
						},
						legend : {
							data : ['预测结果点']
						},					
						 xAxis : [
							{
								name:(flag?'行唯一标识号':'行号'),
								type : 'category',
								data:xpre
							}
						],
						yAxis : [
							{
								name:'预测结果',
								type : 'category',
								data:ypre	
							}
						],
						series : [
							{
								name: '预测结果点',
								type: 'effectScatter',
								data: predatas,	
								hoverAnimation: true,
								itemStyle: itemStyle,
								zlevel: 1,
								tooltip : {
									trigger: 'item',
									axisPointer:{
										show: true
									}
								}
							}								
						]
					},true);
				}
			});
		});
		$("#rulebutton").click(function(){  
			var modelNo = $("#s_modelNo").val();
			downloadFile("FPGrowth-"+modelNo+"号模型关联规则.txt", ruleContent);
		});
		$("#freqbutton").click(function(){  
			var modelNo = $("#s_modelNo").val();
			downloadFile("FPGrowth-"+modelNo+"号模型频繁项集.txt", freqContent);
		});
		$(".predictbutton").click(function(){ 
			var modelNo = $("#s_modelNo").val();
			downloadFile("FPGrowth-"+modelNo+"号模型预测结果.txt", predictContent);
		});
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