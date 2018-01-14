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
					<h1 class="title">模型分析</h1>
					<p class="description"></p>
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
					<div class="col-md-2">
						<label class="control-label">文件Id</label>
						<input id="s_condIds" name="s_condIds" value=<c:if test="${not empty fileId}">${requestScope.fileId}</c:if> />
					</div>
					<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
					<div id="cont" style="width: 550px; height: 400px; margin: 0 auto"></div>
					<div class="col-md-1">
						<select id="change" class="form-control">
							<option value="line">折线图</option>
							<option value="column">柱状图</option>
						</select>
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
<script src="../../assets/js/highcharts/highcharts.js"></script>
<script src="../../assets/js/highcharts/exporting.js"></script>

	<script type="text/javascript">
	$(function () {
		var chart;
				Highcharts.setOptions({
	                lang: {
	                  	  printChart:"打印图表",
	                      downloadJPEG: "下载JPEG 图片" , 
	                      downloadPDF: "下载PDF文档"  ,
	                      downloadPNG: "下载PNG 图片"  ,
	                      downloadSVG: "下载SVG 矢量图" , 
	                      exportButtonTitle: "导出图片" 
	                }
	            });
	            chart = new Highcharts.Chart({  
	            //HighCharts中chart属性配置  
	              chart: {
	            	renderTo: 'container',//div 标签  
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	              },  
	               credits : {  
	                    //enable:true,默认就为true，可以不配置  
	                    //如果想要去除版权（也就是不显示），只需要设置enable:false即可  
	                    enabled:false,//不显示highCharts版权信息,不显示为false  
	              },  
	              exporting: {  
	                //enabled:true,默认为可用，当设置为false时，图表的打印及导出功能失效 
	                enable:true,
	                buttons:{    //配置按钮选项  
	                    printButton:{    //配置打印按钮  
	                        width:50,  
	                        symbolSize:20,  
	                        borderWidth:2,  
	                        borderRadius:0,  
	                        hoverBorderColor:'red',  
	                        height:30,  
	                        symbolX:25,  
	                        symbolY:15,  
	                        x:-200,  
	                        y:20  
	                    },  
	                    exportButton:{    //配置导出按钮  
	                        width:50,  
	                        symbolSize:20,  
	                        borderWidth:2,  
	                        borderRadius:0,  
	                        hoverBorderColor:'red',  
	                        height:30,  
	                        symbolX:25,  
	                        symbolY:15,  
	                        x:-150,  
	                        y:20  
	                    }  
	                },  
	                filename:'wisdombrain'+new Date(),//导出的文件名  
	                type:'image/png',//导出的文件类型  
	                width:800    //导出的文件宽度  
	              },  
	                title:{
						text : '模型分析统计(1)'
					},
					tooltip: {
						      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
						   },
					subtitle:{
						text : '来源:wisdombrain.huateng.com '
					},
					plotOptions : {
						      pie: {
						         allowPointSelect: true,
						         cursor: 'pointer',
						         dataLabels: {
						            enabled: true,
						            formatter: function() {
	                                    //Highcharts.numberFormat(this.percentage,2)格式化数字，保留2位精度
	                                    return '<b>'+ this.point.name +'</b>: '+Highcharts.numberFormat(this.percentage,2) +' %('+
	                                            Highcharts.numberFormat(this.y, 0, ',') +' 个)';
	                                },
						            style: {
						               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
						            }
						         }
						      }
					},
				   series:[ {
		                type: 'pie',
		                name: '所占比例'
		             }]
					
	            });
	            var arr = [];
	        	$.ajax({
	        		type:"post",
	        		data:"fileId="+$("#s_condIds").val(),
	        		url:"modelDataList",
	        		dataType:"json",
	        		success:function(dt){
	       				console.log(dt.data);
	       				if(dt.data!=null){
	       					$(dt.data).each(function(index,item){
	                            arr.push([item.name,item.num]);
	                        });
	           				chart.series[0].setData(arr);
	       				}
	        		}
	        	});
	        	geLineDate();
	});
	
	function geLineDate(){
		var type=$("#change").val();
		$(function () {  
            var chart;
            $(document).ready(function() {  
            	Highcharts.setOptions({
                    lang: {
                      	  printChart:"打印图表",
                          downloadJPEG: "下载JPEG 图片" , 
                          downloadPDF: "下载PDF文档"  ,
                          downloadPNG: "下载PNG 图片"  ,
                          downloadSVG: "下载SVG 矢量图" , 
                          exportButtonTitle: "导出图片" 
                    }
                });
                chart = new Highcharts.Chart({  
                //HighCharts中chart属性配置  
                  chart: {  
                    renderTo: 'cont',//div 标签  
                    type: type,//图表类型  
                  },  
                   credits : {  
                        //enable:true,默认就为true，可以不配置  
                        //如果想要去除版权（也就是不显示），只需要设置enable:false即可  
                        enabled:false,//不显示highCharts版权信息,不显示为false  
                  },  
                  exporting: {  
                    //enabled:true,默认为可用，当设置为false时，图表的打印及导出功能失效 
                    enable:true,
                    buttons:{    //配置按钮选项  
                        printButton:{    //配置打印按钮  
                            width:50,  
                            symbolSize:20,  
                            borderWidth:2,  
                            borderRadius:0,  
                            hoverBorderColor:'red',  
                            height:30,  
                            symbolX:25,  
                            symbolY:15,  
                            x:-200,  
                            y:20  
                        },  
                        exportButton:{    //配置导出按钮  
                            width:50,  
                            symbolSize:20,  
                            borderWidth:2,  
                            borderRadius:0,  
                            hoverBorderColor:'red',  
                            height:30,  
                            symbolX:25,  
                            symbolY:15,  
                            x:-150,  
                            y:20  
                        }  
                    },  
                    filename:'wisdombrain'+new Date(),//导出的文件名  
                    type:'image/png',//导出的文件类型  
                    width:800    //导出的文件宽度  
                  },  
                  xAxis: {  
                	  categories : [ '1', '2', '3','4'] 
                    }, 
                  yAxis:{
						title : {
							text : '数值'
						}
					},
                    title:{
						text : '模型分析统计(2)'
					},
					subtitle:{
						text : '来源:wisdombrain.huateng.com'
					},
					plotOptions:{
							line : {
								dataLabels : {
									enabled : true
								},
								enableMouseTracking : true
							}
 					}
                }); 
            	$.ajax({
            		type:"post",
            		url:"getLineData",
            		data:"fileId="+$("#s_condIds").val(),
            		dataType:"json",
            		success:function(dt){
            			console.log(dt)
            			if(dt.data!=null){
            				for(var i in dt.data){
                   				console.log(dt.data[i]);
                   				  var oSeries = {
                     	                    name: i,
                     	                    data: dt.data[i]
                     	                };
                     			  chart.addSeries(oSeries);
                   			}
            			}
            		}
            	});
            });  
        });
	};

	$("#change").change(function(){
		geLineDate();
	});
		
	
	</script>
</body>
</html>