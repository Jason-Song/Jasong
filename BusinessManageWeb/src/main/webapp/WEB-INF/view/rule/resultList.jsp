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
	<link rel="stylesheet" href="../../assets/css/hotactlist.css">

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
					<h1 class="title">预测结果</h1>
					<p class="description">提供预测结果的下载、展示</p>
				</div>
			</div>
			<div class="panel panel-default collapse show" id="contentPic">
				<div class="panel-heading">
					<h3 class="panel-title">预测结果列表</h3>
				</div>
				<div class="panel-body-">
					<div class="row">
						      <div class="hotact-list">
          
                
					<ul class="item-col3 y-clear" style="list-style:none;">
					
					<li class='hidden'><a href="randomForestResult">
						<p class="title" >随机森林模型</p>
						<p class="desc" >高维稀疏数据分析</p>
						<p class="more">查看预测结果列表&gt;</p>
						<div class="imgs">
							<img src="../../assets/images/four-atom.png" class="icon"><img src="../../assets/images/edge-four-atom.png" class="hicon">
						</div>
					</a></li>
					
					<li><a href="kMeansResult">
						<p class="title" >K均值聚类模型</p>
						<p class="desc" >简单聚类分析</p>
						<p class="more">查看预测结果列表&gt;</p>
						<div class="imgs">
							<img src="../../assets/images/eight-square.png" class="icon"><img src="../../assets/images/edge-eight-square.png" class="hicon">
						</div>
					</a></li></ul>
				</div>
						
						
					</div>
					<div class="row">
						<div class="col-md-12" id="cont" style="width: 1100px; height: 400px; margin: 0 auto"></div>
					</div>
					<div class="row">
						<div class="col-md-12" id="treeModel" style="width: 1100px; height: 400px; margin: 0 auto"></div>
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

	<s:enums keys="market_modelType"></s:enums>
	<script type="text/javascript">
		$(function() {
			//下拉框数据绑定
			WebUtils.bindSelect('s_modelType', 'market_modelType', true);
		});
	</script>
	<script type="text/javascript">
	
	
	$(function () {
		$("#s_condIds").change(function() {
	            var arr = [];
	        	$.ajax({
	        		type:"post",
	        		data:"fileId="+$("#s_condIds").val(),
	        		url:"modelDataList",
	        		dataType:"json",
	        		success:function(dt){
	       				if(dt.data!=null){
	       					$(dt.data).each(function(index,item){
	                            arr.push({
	                            	name:item.name,
	                            	value:item.num
	                            });
	                        });
	           				//chart.series[0].setData(arr);
	       				}
	       				getModelIndex(arr);

	       				var classno = dt.data[0].classno;
	       				var matab = "<table><tr><td></td><td></td><td colspan='2'>预测</td><td></td></tr><tr><td></td><td></td><td>1</td><td>2</td></tr>";
	       				for(var i=0;i<classno;i++){
	       					if(i==0)matab += "<table><tr><td></td><td></td><td colspan='"+classno+"'>预测</td><td></td></tr><tr><td></td><td></td><td>1</td><td>2</td></tr>";
	       				}
	       				
	       				var treestr = dt.data[0].tree;
	       				//$("#matrix").html(dt.data[0].matrix);
	       				$("#tree").html(treestr);
	       				
	       			    var myChart = echarts.init(document.getElementById('treeModel'), 'macarons');  
	       				myChart.showLoading();
	       				var trees = parseTree(treestr," Tree ");
						var treedepths = treestr.split(" Tree ");
	       			    var optseries = [];
	       			    var legendata = [];
	       			 	var treeno = trees.length;
	       			 	var step = 100/treeno;
	       			    for(var k=0;k<treeno;k++){
	       			    	var ifs = treedepths[k+1].split(" Else ");
	       			    	var ifno = ifs[0].split(" If ");
	       			    	var trdepth = ifno.length+1;
	       			    	var treename = "Tree"+k;
	       			    	legendata.push({
       				            name: treename,
       				            icon: 'rectangle'
       				        });
	       			    	optseries.push({
       				            type: 'tree',
       				            name: treename,
       				            data: [trees[k]],

       				            top: '11%',
       				            left: (k*step+12)+'%',
       				            bottom: '20%',
       				            right: ((treeno-1-k)*step+7)+'%',
       				            
       			                initialTreeDepth: trdepth,

       				            symbolSize: 7,
       			                orient: 'vertical',

       				            label: {
       				                normal: {
       				                    position: 'top',
       				                    verticalAlign: 'middle',
       				                    rotate:-90,
       				                    align: 'right'
       				                }
       				            },

       				            leaves: {
       				                label: {
       				                    normal: {
       				                        position: 'bottom',
      				                        verticalAlign: 'middle',
      				                        rotate:-90,
       				                        align: 'left'
       				                    }
       				                }
       				            },

       				            expandAndCollapse: true,

       				            animationDuration: 550,
       				            animationDurationUpdate: 750

       				        });
	       			    }
	       				myChart.hideLoading();

	       				myChart.setOption(option = {
       						title : {
       	   				        text: '生成树',
       	   				    },
	       				    tooltip: {
	       				        trigger: 'item',
	       				        triggerOn: 'mousemove'
	       				    },
	       				    legend: {
	       				        top: '8%',
	       				        left: '0%',
	       				        orient: 'vertical',
	       				        data:legendata,
	       				        borderColor: '#c23531'
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
	       				    series:optseries
	       				});
	       				loadList();
	        		}
	        	});
        }); 
	});
	
	//解析随机森林文本
	function parseTree(treestr,str){
		var treearr=[];
		if(treestr.indexOf(str)>=0){
			var trees = treestr.split(str);

			if(str==" Tree "){	   				
				for(var j=0;j<trees.length-1;j++){
					treearr[j] = new Object();
					var splitstr = trees[j+1];
					var nodes = splitstr.split(":");
					treearr[j].name = "Tree"+nodes[0];
					if(splitstr.indexOf(" If (feature ")>=0)treearr[j].children=parseTree(splitstr," If (feature ");
				}
			}else if(str==" If (feature "){
				var ifeas = trees[1].split(" ");
				var ifstr = " If (feature "+ifeas[0];
				var ifarr = treestr.split(ifstr);
				var splitstr = ifarr[1];
				
				var elsestr = " Else (feature "+ifeas[0];
				var elseno = splitstr.indexOf(elsestr);
				if(elseno>=0){
					var ifsplitstrs = splitstr.split(elsestr);
					var ifsplitstr = ifsplitstrs[0];
				}else var ifsplitstr = splitstr;

				treearr[0] = ifelseobj(elseno,ifsplitstr,ifstr,ifeas[0],0);
				treearr[1] = ifelseobj(elseno,splitstr,elsestr,ifeas[0],1);
			}
		}else{
			treearr[0] = new Object();
			var predicts = treestr.split(" Predict: ");
			treearr[0].name = "Predict:"+predicts[1];
			treearr[0].value = "Predict:"+predicts[1];
		}
		return treearr;
	}
	
	function ifelseobj(elseno,splitstr,elsestr,code,pos){
		var treearr=new Object();
		if(elseno>=0){
			var subifs=splitstr.split(elsestr);
			if(subifs.length>1||pos==0){
				var subifarr = subifs[pos].split(")");
				treearr.name = code+" "+subifarr[0];
				treearr.children=parseTree(subifs[pos]," If (feature ");
			}
		}
		return treearr;
	}
	
	function getModelIndex(arr){
		$.ajax({
    		type:"post",
    		url:"getLineData",
    		data:"fileId="+$("#s_condIds").val(),
    		dataType:"json",
    		success:function(dt){    			
   			    var myChart = echarts.init(document.getElementById('cont'), 'macarons');  
   				myChart.showLoading();
    			if(dt.data!=null){
    				var ys = [];
    				var xs = [];
    				var j = 0;
    				for(var i in dt.data){
    					if(j==0){
    						var yno = dt.data[i].length
    						for(var k=yno-1;k>=0;k--){
    							ys.push(k);
    						}
    					}
           				xs.push({
           					name:i,
           					type:'bar',
           					data:dt.data[i]
           				});
           				j++;
           			}
    			}
    	        xs.push({
    	            name: '样本分类数',
    	            type: 'pie',
    	            radius : '40%',
    	            center: ['75%', '40%'],
    	            label: {
    	                normal: {
    	                    formatter: '  {b|{b}：}{c}  {per|{d}%}  ',
    	                    backgroundColor: '#eee',
    	                    borderColor: '#aaa',
    	                    borderWidth: 1,
    	                    borderRadius: 4,
    	                    rich: {

    	                        b: {
    	                            fontSize: 16,
    	                            lineHeight: 33
    	                        },
    	                        per: {
    	                            color: '#eee',
    	                            backgroundColor: '#334455',
    	                            padding: [2, 4],
    	                            borderRadius: 2
    	                        }
    	                    }
    	                }
    	            },
    	            data:arr,
    	            itemStyle: {
    	                emphasis: {
    	                    shadowBlur: 10,
    	                    shadowOffsetX: 0,
    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
    	                }
    	            }
    	        });
   				myChart.hideLoading();
    			myChart.setOption(option = {
   				    title : [{
   				        text: '训练结果指标',
   				    },{
   				        text: '样本数分类统计',
   				        x: '75%',
   				        textAlign: 'center'
   				    }],
   				    tooltip : {
   				        trigger: 'axis'
   				    },
   				    legend: {
   				    	left:'20%',
   				        data:['准确率','召回率','F1']
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
	   				grid: [{
	   			        top: 50,
	   			        width: '50%',
	   			        bottom: '45%',
	   			        left: 10,
	   			        containLabel: true
	   			    }, {
	   			        top: '55%',
	   			        width: '50%',
	   			        bottom: 0,
	   			        left: 20,
	   			        containLabel: true
	   			    }],
   				    calculable : true,
   				    xAxis : [
   				        {
   				            type : 'value',
   				            position:'top',
   				            boundaryGap : [0, 0.01]
   				        }
   				    ],
   				    yAxis : [
   				        {
   				            type : 'category',
   				            data : ys
   				        }
   				    ],
   				    series :xs
   				});	                    
    		}
    	});
	};
	
    //加载列表function  
    function loadList() {  
      //  var columns = ['a','b'];  
		    //var myChart = echarts.init(document.getElementById('matrix'), 'macarons');  
        //gridData属性  
        $('#matrix').datagrid(InitGrid = {  
            nowrap: true,  
            autoRowHeight: true,  
            striped: true,  
            singleSelect: true,  
            // url: Init.url + '&cmd=list',  
            //data: json.listshuju,  
            fitColumns: true,  
            idField: 'Id',  
            pagination: true,  
            rownumbers: true,  
            pageSize: 10,  
            pageList: [5, 10, 15, 20, 50, 80, 200],  
            toolbar: toolbar,  
            columns: [ [ {
            	name : 'Id',
            	title : '记录时间',
            	align : 'left',
            	headalign : 'center',
            	width : '19%'
            	}, {
            	name : 'region',
            	title : '最大可用内存',
            	align : 'left',
            	headalign : 'center',
            	width : '20%'
            	}, {
            	name : 'SR',
            	title : '已用内存总数',
            	align : 'left',
            	headalign : 'center',
            	width : '20%'
            	}, {
            	name : 'ST',
            	title : '空闲内存',
            	align : 'left',
            	headalign : 'center',
            	width : '20%'
            	}] ],
                data: [{ "Id": 1, "region": "8号线", "SR": 100, "ST": 80 }, { "Id": 2, "region": " 北京亦庄线", "SR": 40, "ST": 80 }, { "Id": 3, "region": " 重庆3号线", "SR": 30, "ST": 80 }, { "Id": 4, "region": " 成都3号线", "SR": 10, "ST": 80 }, { "Id": 5, "region": " 大连线", "SR": 10, "ST": 80 }]
            // fit: true,  
            //border: true  
        });

        //创建数据表格  

    } 
	</script>
</body>
</html>