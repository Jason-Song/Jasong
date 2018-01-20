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
	
</head>
<style type="text/css">
* {margin:0; padding:0;}
body {font-size:12px; color:#222; font-family:Verdana,Arial,Helvetica,sans-serif; background:#f0f0f0;}
.clearfix:after {content: "."; display: block; height: 0; clear: both; visibility: hidden;}
.clearfix {zoom:1;}
ul,li {list-style:none;}
img {border:0;}

.wrapper {width:800px; margin:0 auto; padding-bottom:0px;}

/* qqshop focus */
#focus {width:800px; height:450px; overflow:hidden; position:relative;}
#focus ul {height:380px; position:absolute;}
#focus ul li {float:left; width:800px; height:450px; overflow:hidden; position:relative; background:#000;}
#focus ul li div {position:absolute; overflow:hidden;}
#focus .btnBg {position:absolute; width:800px; height:20px; left:0; bottom:0; background:#000;}
#focus .btn {position:absolute; width:780px; height:10px; padding:5px 10px; right:0; bottom:0; text-align:right;}
#focus .btn span {display:inline-block; _display:inline; _zoom:1; width:25px; height:10px; _font-size:0; margin-left:5px; cursor:pointer; background:#fff;}
#focus .btn span.on {background:#fff;}
#focus .preNext {width:45px; height:100px; position:absolute; top:90px; background:url(img/sprite.png) no-repeat 0 0; cursor:pointer;}
#focus .pre {left:0;}
#focus .next {right:0; background-position:right top;}
</style> 
<body class="page-body">

	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
			
		<div class="main-content">


			<div class="panel panel-default collapsed">
				<div class="panel-body-">
					
						<div class="wrapper">
							<div id="focus">
								<ul>
									<li><a><img src="../../images/index.jpg" /></a></li>
									<li><a><img src="../../images/index1.jpg" /></a></li>
									<li><a><img src="../../images/index2.jpg" /></a></li>
									<li><a><img src="../../images/index3.jpg" /></a></li>
									<li><a><img src="../../images/index4.jpg" /></a></li>
									<li><a><img src="../../images/index5.jpg" /></a></li>
									<li><a><img src="../../images/index6.jpg" /></a></li>
									<li><a><img src="../../images/index7.jpg" /></a></li>
									<li><a><img src="../../images/index8.jpg" /></a></li>
								</ul>
							</div>
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

<!-- JavaScripts initializations and stuff -->
<script src="../../assets/js/xenon-custom.js"></script>
<script src="../../js/WebUtils.js"></script>
<script type="text/javascript">
$(function() {
var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
var len = $("#focus ul li").length; //获取焦点图个数
var index = 0;
var picTimer;

//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
var btn = "<div class='btnBg'></div><div class='btn'>";
for(var i=0; i < len; i++) {
btn += "<span></span>";
}
btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
$("#focus").append(btn);
$("#focus .btnBg").css("opacity",0.5);

//为小按钮添加鼠标滑入事件，以显示相应的内容
$("#focus .btn span").css("opacity",0.4).mouseenter(function() {
index = $("#focus .btn span").index(this);
showPics(index);
}).eq(0).trigger("mouseenter");

//上一页、下一页按钮透明度处理
$("#focus .preNext").css("opacity",0.2).hover(function() {
$(this).stop(true,false).animate({"opacity":"0.5"},300);
},function() {
$(this).stop(true,false).animate({"opacity":"0.2"},300);
});

//上一页按钮
$("#focus .pre").click(function() {
index -= 1;
if(index == -1) {index = len - 1;}
showPics(index);
});

//下一页按钮
$("#focus .next").click(function() {
index += 1;
if(index == len) {index = 0;}
showPics(index);
});

//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
$("#focus ul").css("width",sWidth * (len));

//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
$("#focus").hover(function() {
clearInterval(picTimer);
},function() {
picTimer = setInterval(function() {
showPics(index);
index++;
if(index == len) {index = 0;}
},4000); //此4000代表自动播放的间隔，单位：毫秒
}).trigger("mouseleave");

//显示图片函数，根据接收的index值显示相应的内容
function showPics(index) { //普通切换
var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
$("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
$("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
}
}); 
</script>
</body>
</html>