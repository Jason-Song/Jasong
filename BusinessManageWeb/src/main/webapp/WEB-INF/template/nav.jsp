<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
<nav class="navbar horizontal-menu navbar-fixed-top navbar-minimal"><!-- set fixed position by adding class "navbar-fixed-top" -->
		
	<div class="navbar-inner">
	
		<!-- Navbar Brand -->
		<div class="navbar-brand">
			<a href="${_CONTEXT_PATH}" class="logo">
				<img src="../images/logo-header.png" width="235" alt="" class="hidden-xs" />
				<img src="../images/logo-header.png" width="235" alt="" class="visible-xs" />
			</a>
			<a href="#" data-toggle="sidebar" data-animate="true" onclick="clearWidth()">
				<i class="fa-bars"></i>
			</a>
		</div>

		<!-- main menu -->
		<ul class="navbar-nav">
		</ul>
				
		
		<!-- notifications and other links -->
		<ul class="nav nav-userinfo navbar-right">
		
			<li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->
		
				<form method="get" action="extra-search.html">
					<input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />
					
					<button type="submit" class="btn btn-link">
						<i class="linecons-search"></i>
					</button>
				</form>
				
			</li>

			<li class="dropdown user-profile">
				<a href="#" data-toggle="dropdown">
<!-- 					<img src="../assets/images/user-1.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" /> -->
					<span>
						${_USER_KEY.operator.userName}
						<i class="fa-angle-down"></i>
					</span>
				</a>
				
				<ul class="dropdown-menu user-profile-menu list-unstyled">
				
					<li>
						<a onclick="jQuery('#changepwd').modal('show', {backdrop: 'static'});">
							<i class="fa-wrench"></i>
							修改密码
						</a>
					</li>
					<li class="last">
						<a href="${_CONTEXT_PATH}/sys/logout">
							<i class="fa-lock"></i>
							退出
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a class="btn tooltip-blue timedisplay" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="">&nbsp;00:00:00</a>
			</li>
		</ul>

	</div>

<script type="text/javascript">
$(function () {
	initTopMenu();
});
var timer = setTimeout( displayTime , 1000);
function displayTime() {
	clearTimeout(timer);
	var date = new Date();
    $('.nav a.timedisplay').text(_format(date.getHours()) + ":" +_format(date.getMinutes()) + ":" +_format(date.getSeconds()));
    $('.nav a.timedisplay').attr("data-original-title",_format(date.getFullYear()) + "-" +_format(date.getMonth()+1) + "-" + _format(date.getDate()));
	timer = setTimeout(displayTime,1000);
	
}
function _format(t) {
	if (t<10){
		return "0" +t;
	}
	return t;
}
function clearWidth() {
	$(".sidebar-menu").removeAttr("style");
}
function initTopMenu() {

	WebUtils.ajaxSubmit("${_CONTEXT_PATH}/sys/menu/list","menuid=sys",function(result){
		var items = result.data.childs;
		var menuHtml = [];
		buildTopItems(menuHtml,items);
		$(".navbar-nav").html(menuHtml.join(''));
		currModel = items[0];
		switchModel(currModel.nodeId);
	});

	function buildTopItems(menuHtml,items) {
		for (var i = 0 ; i < items.length; i++) {
			var item = items[i];
			menuHtml.push("<li>");
			menuHtml.push("<a onclick=\"switchModel('" +  item.nodeId + "')\">");
			menuHtml.push("<i class=\"" + item.nodeImg + "\"></i>");
			menuHtml.push("<span class=\"title\">"+ item.nodeName + "</span></a>");
// 			if (item.hasChildFlag == '1') {
// 				menuHtml.push("<ul>");
// 				buildTopItems(menuHtml,item.childs);
// 				menuHtml.push("</ul>");
// 			}
			menuHtml.push("</li>");
		}
	}
}
//当前应用模块
var currModel;
function switchModel(nodeId){
	WebUtils.ajaxSubmit("${_CONTEXT_PATH}/sys/menu/list","menuid=sys",function(result){
		var items = result.data.childs;
		var menuHtml = [];
		var subroot;
		for (var i = 0 ; i < items.length; i++) {
			if (items[i].nodeId == nodeId) {
				buildSubItems(menuHtml,items[i].childs);
				currModel = items[i];
				break;
			}
		}
		$("#submenu").html(menuHtml.join(''));
		setup_sidebar_menu();
	});

	function buildSubItems(menuHtml,items) {
		if (items == null) {
			return;
		}
		for (var i = 0 ; i < items.length; i++) {
			var item = items[i];
			menuHtml.push("<li>");
			menuHtml.push("<a");
			if (item.hasChildFlag != '1') {
				menuHtml.push(" onclick=\"openPage(")
				menuHtml.push("'" + item.nodeId + "',");
				menuHtml.push("'" + item.nodeName+ "',");
				menuHtml.push("'" + (item.nodeUrl!= null ?  item.nodeUrl :"") + "')\"");
			}
			menuHtml.push(">");
			menuHtml.push("<i class=\"" + item.nodeImg + "\"></i>");
			menuHtml.push("<span class=\"title\">"+ item.nodeName + "</span></a>");
			if (item.hasChildFlag == '1') {
				menuHtml.push("<ul>"); 
				buildSubItems(menuHtml,item.childs);
				menuHtml.push("</ul>");
			}
			menuHtml.push("</li>");
		}
	}
	
}
function openPage(tid,name,url) {
	var nurl = "";
	var idx = url.indexOf('/',1);
	var second = "/sys";
	if (idx > 0) {
		second = url.substring(0,idx);
	}

	var contextPrefix = WebUtils.getCodeValue('sys_model_context',second);
	if (!contextPrefix) {
		WebUtils.alert("参数未配置,页面无法打开");
		return;
	}
	nurl = contextPrefix + url;

	WebUtils.openTab(tid,name, nurl);
	var bread=[];
	bread.push("<ol class=\"breadcrumb bc-1\"><li><a href=\"index\"><i class=\"fa-home\"></i>当前位置: 首页</a></li>");
	bread.push("<li><a href=\"javascript:switchModel('" + currModel.nodeId + "')\">" + currModel.nodeName + "</a></li>");
	bread.push("<li><a onclick=\"refreshPage(this)\">" + name + "</a></li>");
	bread.push("</ol>");
	$('.main-content .active .breadcrumb-env').html(bread.join(''));
}

function refreshPage(target) {
    var pres = $(target).parentsUntil('.tab-pane');
    var tab = $(pres[pres.length-1]).parent();
    var iframe = $('iframe',tab);
    if (iframe) {
        iframe.attr('src',iframe.attr('src'));
    }

}
</script>
</nav>