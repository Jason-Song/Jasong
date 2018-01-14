/**
 * 公共js方法
 */
var WebUtils={};
/**
 * 公共初始化
 */
$.ajaxSetup({
//	contentType:"application/x-www-form-urlencoded; charset=utf-8"
//	contentType:"application/json;charset=utf-8"
});
$.ajaxSettings.traditional = true;

/**
 * 增加事件监听
 * 
 * obj
 * evt
 * func
 */
WebUtils.addEvent = function (obj,evt,func,evtobj){
	evtobj = !evtobj?obj:evtobj;
	if(obj.addEventListener){
		obj.addEventListener(evt,func,false);
	}else if(evtobj.attachEvent){
		obj.attachEvent('on'+evt,func);
	}
};

/**
 * 主页上新建TAB页
 * 
 * tabid  区分Tab的id
 * text   Tab页显示名称
 * url    路径
 */
WebUtils.openTab = function(tabid,text, url){
	var xtab =  $("#tabhead li a[href='#"+ tabid +"']");
	if ($("#tabhead li a").size() > 9) {
		WebUtils.alert("打开的Tab页过多!");
		return;
	}
	if ( xtab.size() > 0 ) {
		$('#tabhead>li').removeClass("active");
		$('#tabbody>div').removeClass("active");
		$(xtab).parentsUntil("ul").addClass("active");
		$('#tabbody>div#' +tabid).addClass("active");
	}
	else {
		var contentHeight = $('body').height() - $('.navbar').height() - 30 - 40 - 15 ;
		try{
			$('#tabhead>li').removeClass("active");
			$('#tabhead').append("<li class=\"active\"><a href=\"#"+tabid +"\" data-toggle=\"tab\"><span class=\"visible-xs\">" +
					"<i class=\"fa-cog\"></i></span><span class=\"hidden-xs\">" + text + "</span></a></li>");
			$('#tabhead li').last().bind("dblclick",function(e) {
				var content = $("a",this).attr("href");
				WebUtils.removeTabById(content.substr(1));
			});
			$('#tabbody>div').removeClass("active");
			$('#tabbody').append("<div class=\"tab-pane active\" id=\""+tabid+"\" >" +
					"<div class=\"breadcrumb-env\"></div>" +
					"<iframe style=\"height:" +contentHeight+ "px;width:100%;\" frameborder=\"0\" src=\"" +url+ "\"></iframe></div>");
			
		}catch(e){
			alert(e);
		}
	}
}
/*
 * 移除tab项
 */
WebUtils.removeTabById=function(tabid){
	var xtab =  $("#tabhead li a[href='#"+ tabid +"']");
	$('#' + tabid).remove();
	$(xtab).parent().remove();
	var next = $("#tabhead li").last();
	var ntabid = $("a",next).attr("href");
	$('#tabbody>div' +ntabid).addClass("active");
	next.addClass("active");
}

/**
 * 枚举类型变量存放处
 */
var _enum_params ={};

/**
 * 绑定平台定义枚举类型变量
 * <select name="vnodeImg" id="vnodeImg"></select>
 */
WebUtils.bindSelectFromUrl = function(ctrlId,url) {
    var control = $('#' + ctrlId); 
    //绑定Ajax的内容
    $.getJSON(url, function (data) {
        control.empty();//清空下拉框
        control.append("<option></option>");
        $.each(data, function (i, item) {
            control.append("<option value='" + item.itemId + "'>&nbsp;" + item.itemValue + "</option>");
        });
    });
    //设置Select2的处理
    control.select2({
    	placeholder: '请选择 ...',
    	allowClear: true,
    	minimumResultsForSearch: -1  // Hide the search bar
    }).on('select2-open', function(){
		$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
	});
}

/**
 * 绑定平台定义枚举类型变量
 * <select name="vnodeImg" id="vnodeImg"></select>
 */
WebUtils.bindSelect = function(ctrlId,enumId,allowClear) {
    var control = $('#' + ctrlId); 
    if (control ) {
	    control.empty();//清空下拉框
	    control.append("<option></option>");
	    var enums = _enum_params[enumId];
	    if (enums) {
	        $.each(enums, function (i, item) {
	            control.append("<option value='" + i + "'>&nbsp;" + item + "</option>");
	        });
	    }
	    var flag = allowClear? true:allowClear;
	    //设置Select2的处理
	    control.select2({
	    	placeholder: '请选择 ...',
	    	allowClear: flag,
	    	minimumResultsForSearch: -1  // Hide the search bar
	    }).on('select2-open', function(){
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		}).on("change", function(){
			$(this).valid();
		});
    }
}

WebUtils.deepCopy = function(source) { 
	var result={};
	for (var key in source) {
	      result[key] = typeof source[key]==='object'? deepCopy(source[key]): source[key];
	   } 
	   return result; 
}

/**
 * 判断结果是否成功
 */
WebUtils.isSuccess = function(result) {
	if (result && result.retcode) {
		if (result.retcode.substr(0,1) == 'I') {
			return true;
		}
	}
	return false;
}

 /**
  * 提交
  * @param action 地址
  * @param data 数据
  * @param onSuccess 成功执行方法
  * @param onError 失败执行方法
  */
WebUtils.ajaxSubmit = function(action, data, onSuccess,onError)
{
	$.ajax({
		url: action,
		data: data,
		type: 'POST',
		dataType: 'json',
		success: function(result){
			if (WebUtils.isSuccess(result)) {
				if (onSuccess) {
					onSuccess(result);
				}
				else {
					if (result.msg) {
						alert(result.msg);
					}
				}
			}
			else{
				if (onError) {
					onError(result);
				}
				else {
					if (result.retcode == "E0008") {//无效登录
						alert("登录超时,请重新登录!");
						window.location = result.url; //如重定向到登陆页面
					}
					else {
						alert(result.msg);
					}
					
				}
			}
		},
		error: function(result) {
			alert(result.responseText || "无法访问服务器",null,null,null,'error');
		}
	});
}

/**
 * 提交
 * @param action 地址
 * @param data 数据
 * @param onSuccess 成功执行方法
 * @param onError 失败执行方法
 */
WebUtils.ajaxSubmitJson = function(action, data, onSuccess,onError)
{
	$.ajax({
		url: action,
		data: data,
		type: 'POST',
		dataType: 'json',
		contentType:"application/json;charset=utf-8",
		success: function(result){
			if (WebUtils.isSuccess(result)) {
				if (onSuccess) {
					onSuccess(result);
				}
				else {
					if (result.msg) {
						alert(result.msg);
					}
				}
			}
			else{
				if (onError) {
					onError(result);
				}
				else {
					if (result.retcode == "E0008") {//无效登录
						alert("登录超时,请重新登录!");
						window.location = result.url; //如重定向到登陆页面
					}
					else {
						alert(result.msg);
					}
				}
			}
		},
		error: function(result) {
			alert(result.responseText || "无法访问服务器",null,null,null,'error');
		}
	});
}

WebUtils.alert = function (msg) {
	$('#sysmsg .modal-body').text(msg);
	$('#sysmsg').modal('show');
}

WebUtils.getAbsPosition = function(object) {
	var o = $(object);
	if (o.length == 0) {
		return false;
	}
	o = o[0];
	var left, top;
	left = o.offsetLeft;
	top = o.offsetTop;
	while (o = o.offsetParent) {
		left += o.offsetLeft;
		top += o.offsetTop;
	}
	return {left: left,top: top};
}


/**
 * 打开选择人员对话框,多选
 * okFunction 回调函数
 */
WebUtils.openSelectStaff = function(okFunction,cancelFunction){
	var url = _CONTEXT_PATH + "/jsp/common/pubstaffquery.jsp?dup=true";
	var p = {id:"_selectStaffDialog",title:'选择员工',lock:true,opacity:0.07};
	$.dialogBox.openDialog(url,p,okFunction,cancelFunction);
}
/**
* 打开选择人员对话框，单选
* okFunction 回调函数
*/
WebUtils.openSelectAStaff = function(okFunction,cancelFunction){
	var url = _CONTEXT_PATH + "/jsp/common/pubstaffquery.jsp?dup=false";
	var p = {id:"_selectStaffDialog",title:'选择员工',lock:true,opacity:0.07};
	$.dialogBox.openDialog(url,p,okFunction,cancelFunction);
}

/**
* 获取随机代理主键,前13位是时间戳+后17位随机数
*/
WebUtils.getRandomKey = function(){
	var random = (Math.random()+"").replace("0.", "").substr(0,17);
	var len = random.length ; 
	if(len<17){
		for(var j=0;j<17-len;j++){
			random = random+"0";
		}
	}
	var curtime = new Date().getTime();
	return curtime+random;
}

/**
 * 获取枚举类型变量对应值
 */
WebUtils.getCodeValue = function(codetype,itemid) {
	var xe = _enum_params[codetype];
	if (xe) {
		if (xe[itemid]) {
			return xe[itemid];
		}
	}
	return itemid;
}

 /**
  * 转换为图表显示数据格式(单列数据)
  * rows        数据数组
  * labelField  显示列域名
  * valueField  值列域名
  * linkField   链接列域名
  */
 WebUtils.convertChartData = function(rows,labelField,valueField,linkField) {
 	var ret = {};
 	var data = [];
 	if (rows && rows.length > 0) {
 		for (var x = 0 ; x < rows.length; x++) {
 			var one = {};
 			one.label = rows[x][labelField];
 			one.value = rows[x][valueField];
 			if (linkField) {
 				one.link = rows[x][linkField];
 			}
 			data.push(one);
 		}
 		ret['data'] = data;
 	}
 	return ret;
 }

 /**
 * 转换为图表显示数据格式(多列数据)
 * rows        数据数组
 * labelField  显示列域名
 * serialNames  系列域名
 * valueFields  系列值域名
 * linkField    链接列域名
 */
 WebUtils.convertMsChartData = function(rows,labelField,serialNames,valueFields,linkField) {
 	var ret = {};
 	var data = [];
 	var categories = [];
 	var category = [];
 	if (rows && rows.length > 0) {
 		for (var x = 0 ; x < rows.length; x++) {
 			var one = {};
 			one.label = rows[x][labelField];
 			category.push(one);
 		}
 	}
 	categories.push({'category':category});
 	ret['categories'] = categories;
 	var datasets = [];
 	if (serialNames && serialNames.length > 0 && valueFields && valueFields.length == serialNames.length) {
 		for (var y = 0 ; y < serialNames.length ; y++) {
 			var dataset = {};
 			dataset.seriesname = serialNames[y];
 			var datas = [];
 			for (var i = 0 ; i < rows.length; i++) {
 				var onedata = {};
 				onedata.value = rows[i][valueFields[y]];
 				if (linkField) {
 					onedata.link = rows[i][linkField];
 				}
 				datas.push(onedata);
 			}
 			dataset.data = datas;
 			datasets.push(dataset);
 		}
 	}
 	ret['dataset'] = datasets;
 	return ret;
 }
 
/**
 * 文件上传
 * @param callback(uploadId,files) 回调函数(上传编号,上传文件)
 * @param uploadId 上传编号，如果提供该值，将列出先前已上传文件
 * @param filetypes 允许上传文件类型,缺省不控制 例如： jar,txt
 * @param canDelete 是否允许删除 'true' or 'false'
 * @param canDownload 是否允许下载 'true' or 'false'
 * @param filemax 一次上传文件数量最大数,缺省为1
 * 
 **/
WebUtils.uploadFile = function(callback,uploadId,filetypes,canDelete,canDownload,filemax) {
	if (!$.isFunction(callback)){
		$.dialogBox.error('uploadFile 参数1必须为方法');
		return;
	}
	var types = "*";
	var filenum = "1";
	if (filetypes) {
		types = filetypes;
	}
	if (filemax || filemax == 0) {
		filenum = parseInt(filemax);
	}
	var url = _CONTEXT_PATH + "/jsp/common/upload/file_upload.jsp?filemax="+filenum+"&filter=" + types;
	if (uploadId){
		url = url + "&uid=" + uploadId;
	}
	var param = {title:"文件上传对话框",width:'360px',height:'200px',lock:true};
	param.init = function(){
		this.iframe.contentWindow.initMethod(filenum,canDelete,canDownload);
	}
	
	$.dialogBox.openDialog(url,param,
		function (){
			var uid = this.iframe.contentWindow.getUploadId();
			var files = this.iframe.contentWindow.getUploadFiles();
			callback(uid,files);
		},
		true);
};

WebUtils.initColumnHider = function(table) {
	//表格行选择
	table.on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
    $('li.hiden-columns-title span').each(function(i,item) {
        var p = $(this).parent().parent();
        $(item).click(function(e) {
            e.preventDefault();
            $('ul.hiden-columns',p).toggleClass('showcol');
            //$(parent).scrollTop(0);
        });
        
        //构件隐藏列的控制组件
        var colHtml = [];
        var cols = table.columns();
        for (var x =0 ; x < cols[0].length; x ++) {
            var hname = table.column(x).header();
            colHtml.push("<li><label><input type=\"checkbox\" class=\"cbr toggle-vis\" checked data-column=\"");
            colHtml.push(x);
            colHtml.push("\" >");
            colHtml.push($(hname).text());
            colHtml.push("</label></li>");
        }
        $('ul.hiden-columns',p).append(colHtml.join(''));
        cbr_replace();
        
        $('input.toggle-vis',p).on('change', function (e) {
            e.preventDefault();

            // Get the column API object
            var b = $(this).attr('data-column');
            var column = table.column( b );
     
            // Toggle the visibility
            column.visible( $(this).attr("checked") == "checked" );
        } );
        
    });

};

/**
 * Datatable缺省参数
 */
WebUtils.settings = {
        "language": {
            "sProcessing":   "处理中...",
            "sLengthMenu":   "显示 _MENU_ 项",
            "sZeroRecords":  "没有匹配结果",
            "sInfo":         "显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项",
            "sInfoEmpty":    "显示第 0 至 0 项，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix":  "",
            "sSearch":       "搜索:",
            "sUrl":          "",
            "sEmptyTable":     "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands":  ",",
            "oPaginate": {
                "sFirst":    "首页",
                "sPrevious": "上页",
                "sNext":     "下页",
                "sLast":     "末页"
            },
            "oAria": {
                "sSortAscending":  ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },
        "autoWidth":true,
        "scrollX": true,
//        "scrollXInner":"99.9%",
        "lengthMenu": [[10, 15, 25, 50, 100], [10, 15, 25, 50, 100]],
        "pagingType": "full_numbers",
        "processing": true,
        "serverSide": true,
        "search":false,
        dom: "t" + "<'row'<'col-xs-2'l><'col-xs-5'i><'col-xs-5'p>>"
    };

