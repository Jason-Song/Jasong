<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="" />
	
	<title>Error page</title>
 
	<link rel="stylesheet" href="../../assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../../assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../../assets/css/xenon-core.css">
	<link rel="stylesheet" href="../../assets/css/xenon-forms.css">
	<link rel="stylesheet" href="../../assets/css/xenon-components.css">
	<link rel="stylesheet" href="../../assets/css/xenon-skins.css">
	<link rel="stylesheet" href="../../assets/css/custom.css">

	<script src="../../assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
</head>
<body class="page-body page-error-env" onload="out()">
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>
</body>
<!-- Bottom Scripts -->
	<script src="../../assets/js/bootstrap.min.js"></script>
	<script src="../../assets/js/TweenMax.min.js"></script>
	<script src="../../assets/js/resizeable.js"></script>
	<script src="../../assets/js/joinable.js"></script>
	<script src="../../assets/js/xenon-api.js"></script>
	<script src="../../assets/js/xenon-toggles.js"></script>
	
		<!-- JavaScripts initializations and stuff -->
	<script src="../../assets/js/xenon-custom.js"></script>
	
	<script type="text/javascript">
		function out(){
			alert("长时间未操作，请重新登陆！");
			document.location.href="/sys/logon";
		}
	</script>
</html>