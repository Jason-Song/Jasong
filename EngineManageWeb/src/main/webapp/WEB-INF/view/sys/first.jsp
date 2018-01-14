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
<body class="page-body">

	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
			
		<div class="main-content">


			<div class="page-title">
				
				<div class="title-env">
					<h1 class="title">系统管理</h1>
					<p class="description">主页</p>
				</div>
			</div>


			<div class="panel panel-default collapsed">
				<div class="panel-body-">
<!-- 					<div class="col-md-12 "> -->
<!-- 						<marquee id="affiche" scrollamount="20" height="30"  onMouseOut="this.start()" onMouseOver="this.stop()" align="left" direction="left" loop="-1" >  -->
<!-- 							<font color=red size="4">系统检测，黑名单文件已经更新，请检测</font> -->
<!-- 						</marquee> -->
<!-- 				    </div> -->
					<table class="table table-bordered table-hover" id="listtable" style="width:100%">
						<thead>
							<tr>
							    <th>待处理事件</th>
								<th>笔数</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>命中待处理统计</td>
									<td id="count_hit"><a href="javascript:void();" onClick="countHit()"><u><font color='blue'>${counthit}</font></u></td>
								</tr>
								<tr>
									<td>总命中待处理</td>
									<td id="total_hit"><a href="javascript:void();" onClick="totalHit()"><u><font color='blue'>${totalhit}</font></u></td>
								</tr>
								<tr>
									<td>命中超时未处理</td>
									<td id="totalcount_hit"><a href="javascript:void();" onClick="totalCountHit()"><u><font color='blue'>${totalcounthit}</font></u></a></td>
								</tr>
						</tbody>
					</table>
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
</script>
</body>
</html>