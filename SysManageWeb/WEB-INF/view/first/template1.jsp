<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %><%@ taglib prefix="s" uri="/auth" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Main Page</title>

	<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/xenon-core.css">
	<link rel="stylesheet" href="../assets/css/xenon-forms.css">
	<link rel="stylesheet" href="../assets/css/xenon-components.css">
	<link rel="stylesheet" href="../assets/css/xenon-skins.css">
	<link rel="stylesheet" href="../assets/css/custom.css">

	<script src="../assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv.min.js"></script>
		<script src="../assets/js/respond.min.js"></script>
	<![endif]-->

</head>
<body class="page-body">
	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
	<div class="page-container">
			<!-- Table Styles -->
			<div class="row">
				<div class="col-md-6">

<%-- 					<iframe frameborder="0" src="${_CONTEXT_PATH}${page_1}" style="width:100%;height:250px;"></iframe> --%>

				</div>
				<div class="col-md-6">

<%-- 					<iframe frameborder="0" src="${_CONTEXT_PATH}${page_2}" style="width:100%;height:250px;"></iframe> --%>

				</div>
			</div>
			<div class="row" style="padding:0 15px;">

<%-- 				<iframe frameborder="0" src="${_CONTEXT_PATH}${page_3}" style="width:100%;height:250px;"></iframe> --%>

			</div>
	</div>
</body>
<!-- Imported styles on this page -->

<link rel="stylesheet" href="../css/app.css">

<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>
<script src="../js/WebUtils.js"></script>
</html>