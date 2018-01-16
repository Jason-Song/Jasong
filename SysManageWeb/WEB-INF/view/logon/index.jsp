<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="s" uri="/auth" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Jasong Data Analysis System</title>

	<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/xenon-core.css">
	<link rel="stylesheet" href="../assets/css/xenon-forms.css">
	<link rel="stylesheet" href="../assets/css/xenon-components.css">
	<link rel="stylesheet" href="../assets/css/xenon-skins.css">
	<link rel="stylesheet" href="../assets/css/custom.css">
	<link rel="stylesheet" href="../css/app.css">

	<script src="../assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv.min.js"></script>
		<script src="../assets/js/respond.min.js"></script>
	<![endif]-->
	
	<script>
		var p = this;
		var pp = p.parent;
		if (pp != p) {
			window.top.location.href = p.location.href;
		}
	</script>
</head>
<body class="page-body skin-facebook mainframe" style="overflow: hidden;padding:0;" >

	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/template/nav.jsp"></jsp:include>

	<div class="page-container">
	
		<div class="sidebar-menu fixed">
				
			<div class="sidebar-menu-inner">
					
				<ul id="submenu" class="main-menu multiple-expanded">
				</ul>

			</div>
				
		</div>
	
		<div class="main-content">
			<ul class="nav nav-tabs" id="tabhead">
			</ul>
			<div class="tab-content" id="tabbody">
			</div>
		</div>
	</div>
	
</body>

<link rel="stylesheet" href="../assets/js/jquery-ui/jquery-ui.css" />
<!-- Bottom Scripts -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/TweenMax.min.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/xenon-api.js"></script>
<script src="../assets/js/xenon-toggles.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>
<script type="text/javascript">
$(function () {
	
	$("#tabhead").sortable({
		axis: "x"
	});
	$("#tabhead li").draggable({
		delay: 1000,
		connectToSortable: "#tabhead",
		revert: "invalid",
		containment: "parent"
	});
	//$( "#tabhead,li" ).disableSelection();

	$( ".sidebar-menu" ).resizable();
	WebUtils.openTab("firstPage","首页","first");
});
</script>
<s:enums keys="sys_model_context"></s:enums>
</html>