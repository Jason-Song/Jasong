<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>规则引擎</title>
    <link rel="stylesheet" href="../../assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="../../assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../assets/css/bootstrap.css">
    <link rel="stylesheet" href="../../assets/css/xenon-core.css">
    <link rel="stylesheet" href="../../assets/css/xenon-forms.css">
    <link rel="stylesheet" href="../../assets/css/xenon-components.css">
    <link rel="stylesheet" href="../../assets/css/xenon-skins.css">
    <link rel="stylesheet" href="../../assets/css/custom.css">

    <script src="../../assets/js/jquery-1.11.1.min.js"></script>
</head>
<body class="page-body">
	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
    <div class="page-container">
        <div class="main-content">
            <div class="page-title">
                <div class="title-env">
                    <h1 class="title">规则引擎</h1>
                    <p class="description"></p>
                </div>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-body">
                    <h4 class="text-muted">过滤条件设置</h4>
                    <div class="row" id="inputName">
                        <div class="col-md-3">
                            <h5 class="text-muted">格式文件名称</h5>
                            <div class="form-group">
                                <select class="form-control" id="s_formatFileName" >
                                	<option value="MSAPI" selected="selected">MSAPI</option>
                                	<option value="MSFMT">MSFMT</option>
                                </select>
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">姓名</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_name1" placeholder="姓名">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">英文名</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_name2" placeholder="英文名">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">类型</h5>
                            <div class="form-group">
                                <select class="form-control" id="s_type"></select>
                            </div>    
                        </div>
                        
                        <div class="col-md-3">
                            <h5 class="text-muted">身份证号</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_personId" placeholder="身份证号">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">护照</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_passport" placeholder="护照">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">银行BIC码</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_BIC" placeholder="银行BIC码">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">地址</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_address" placeholder="地址">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">城市</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_city" placeholder="城市">
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">省份</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_state" placeholder="省份">
                            </div>    
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">国家</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_country" placeholder="国家">
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">出生日期</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_birthday" placeholder="出生日期">
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">USER1</h5>
                            <div class="form-group">
                                <select class="form-control" id="s_sex" ></select>
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">SEARCH CODE</h5>
                            <div class="form-group">
                                <input type="text" class="form-control" id="s_keyCode" placeholder="关键代码">
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted">部门</h5>
                            <div class="form-group">
                                <select class="form-control" id="s_unit" required></select>
                            </div>  
                        </div>
                        <div class="col-md-3">
                            <h5 class="text-muted" id='memberCode'>MEMBER CODE</h5>
                            <div class="form-group">
                                <input class="form-control" id="s_memCode" required></input>
                            </div>  
                        </div>
 		                <input type="hidden" value="zh" id="i18" />
 		                <input type="hidden" value="FMT" id="callType" />
                    </div>
                    <div class="row">
                     	<div class="col-md-12" style="text-align:bottom">
 		              		 <h5 class="text-muted" style='height:20px;'></h5>
                             <div class="form-group pull-right">
                                <button type="button" class="btn btn-success" id="reset_button">重置</button>
                            </div>
                            <div class="form-group pull-right" style='width:30px;'>
                            </div>  
                            <div class="form-group pull-right">
                                <button type="button" class="btn btn-success" id="filter_button">过滤</button>
                            </div>  
                        </div>
                     </div>
                </div>
                <div class="panel-body">
                    <h5 class="text-muted">查询结果</h5>
                    <div id="msgTxt" style="text-align:center;">
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
/**
  * 动态加载下拉框.
  */
$(function(){
	$.ajax({    
	    "type":'get',    
	    "url": "randomForest/unitList",  
	    "success" : function(data) { 
		    var unit_list = data.data;  
		    var opts = "";
		    for(var unit_index = 0;unit_index < unit_list.length;unit_index++){
		    	var unit = unit_list[unit_index]; 
		    	opts += "<option value='"+unit.REFCODE+"'>"+unit.REFDESC+"</option>";  
		    }
		    $("#s_unit").append(opts);
	     }    
	});
});
$("#filter_button").click(function(){
	$("#filter_button").html("正在处理...");
	document.getElementById('filter_button').disabled=true;
	$('#msgTxt').html("<img src='../../images/loading.gif' />");
	
   	$.ajax({
		type: "POST",
		url: "randomForest/check",
	  	data:{
	  		"formatFileName":$('#s_formatFileName').val(),
	  		"name1":$('#s_name1').val(),
	  		"name2":$('#s_name2').val(),
	  		"type":$('#s_type').val(),
	  		"personId":$('#s_personId').val(),
	  		"passport":$('#s_passport').val(),
	  		"address":$('#s_address').val(),
	  		"city":$('#s_city').val(),
	  		"state":$('#s_state').val(),
	  		"country":$('#s_country').val(),
	  		"birthday":$('#s_birthday').val(),
	  		"sex":$('#s_sex').val(),
	  		"keyCode":$('#s_keyCode').val(),
	  		"memCode":$('#s_memCode').val(),
	  		"unit":$('#s_unit').val(),
	  		"callType":$('#callType').val()
	  	},
		async: true,
		error: function(request) {
        	$("#filter_button").removeAttr("disabled");
     		$("#filter_button").html("过滤");
     		$('#msgTxt').html("<font id='result' size='5'><span style='color:red;weight:bold'>无法连接到FilterEngine</span></font>");
		},
	    success: function(data){
	    	if(data.msg=="404")$('#msgTxt').html("<font id='result' size='5'><span style='color:red;weight:bold'>无法连接到FilterEngine</span></font>");
	    	else if(data.data.systemId){
	    		if(parseInt(data.data.retcode)>0 && "0"==data.data.ErrorCode)window.location.href='manualListView?systemId='+data.data.systemId;
	    		else if ("0"==data.data.retcode && "0"==data.data.ErrorCode)$('#msgTxt').html("<font id='result' size='5'><span style='color:red;weight:bold'>没有命中</span></font>");
	    		else $('#msgTxt').html("<font id='result' size='5'><span style='color:red;weight:bold'>"+data.data.ErrorCode+":"+data.data.ErrorMessage+"</span></font>");
	    	}
	    	
	    	$("#filter_button").removeAttr("disabled");
     		$("#filter_button").html("过滤");
	    }
	});
});
$('#reset_button').click(function(){
    $("#inputName input").val('');
    $("#inputName select").val("");
	$('#result').remove();
});
$("#s_formatFileName").change(function(){
	var formatFileName = $("#s_formatFileName").val();
	if(formatFileName == "MSFMT"){
		$('#s_memCode').addClass('hidden');
		$('#memberCode').addClass('hidden');
	}else{
		$('#s_memCode').removeClass('hidden');
		$('#memberCode').removeClass('hidden');
	}
});
</script>
<s:enums keys="bl_rec_ltype,bl_manualScreen_sex"></s:enums>
<script type="text/javascript">
    $(function () {
        //下拉框数据绑定
        WebUtils.bindSelect('s_type','bl_rec_ltype',true);
        WebUtils.bindSelect('s_sex','bl_manualScreen_sex',true);
    });
</script>
</body>
</html>