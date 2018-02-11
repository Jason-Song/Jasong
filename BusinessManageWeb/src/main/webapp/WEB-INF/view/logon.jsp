<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Login</title>

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
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script>
			var p = this;
			var pp = p.parent;
			if (pp != p) {
				window.top.location.href = p.location.href;
			}
	</script>
</head>
<body class="page-body login-page" >

	<div class="login-container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
			
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						
						
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								username: {
									required: true
								},
								
								passwd: {
									required: true
								}
							},
							
							messages: {
								username: {
									required: 'Please enter your username.'
								},
								
								passwd: {
									required: 'Please enter your password.'
								}
							},
							
							// Form Processing via AJAX
							submitHandler: function(form)
							{
								show_loading_bar(70); // Fill progress bar to 70% (just a given value)
								
								var opts = {
									"closeButton": true,
									"debug": false,
									"positionClass": "toast-top-full-width",
									"onclick": null,
									"showDuration": "300",
									"hideDuration": "1000",
									"timeOut": "3000",
									"extendedTimeOut": "1000",
									"showEasing": "swing",
									"hideEasing": "linear",
									"showMethod": "fadeIn",
									"hideMethod": "fadeOut"
								};
									
								$.ajax({
									url: "../login",
									method: 'POST',
									dataType: 'json',
									data: {
										ssoId: $(form).find('#username').val(),
										password: $(form).find('#passwd').val(),
									},
									success: function(resp)
									{
										show_loading_bar({
											delay: .5,
											pct: 100,
											finish: function(){
												
												// Redirect after successful login page (when progress bar reaches 100%)
												if(resp.retcode == "I0001")
												{
													window.location.href = 'index';
												}
												else
												{
													toastr.error(resp.msg, "无效的登录!", opts);
													$passwd.select();
												}
											}
										});
										
									},
									error: function(resp)
									{
										alert(JSON.stringify(resp));
									}
								});
								
							}
						});
						
						// Set Form focus
						$("form#login .form-group:has(.form-control):first .form-control").focus();
					});
				</script>
				
				<!-- Errors container -->
				<div class="errors-container">
				
									
				</div>
				
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login" class="login-form fade-in-effect">
					<div class="row">
						<div class="login-header">
							<a href="#" class="logo">
								<img src="../images/logo-header.png" alt="" width="235"/>
							</a>
							<p>慧脑智能营销系统</p>
						</div>
					</div>
					<div class="row logo-body">
						<div class="form-group">
							<input type="text" class="form-control" name="username" id="username" autocomplete="off" placeholder="请填写登录账号" />
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control" name="passwd" id="passwd" autocomplete="off" placeholder="请填写登录密码" />
						</div>
						
						<div class="form-group logon-btn">
							<button type="submit" class="btn btn-block">
								<i class="fa-lock"></i>
								登录
							</button>
						</div>
					</div>
					 
					<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
				</form>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
		
	</div>



	<!-- Bottom Scripts -->
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/TweenMax.min.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/xenon-api.js"></script>
	<script src="../assets/js/xenon-toggles.js"></script>
	<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="../assets/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/xenon-custom.js"></script>
	
</body>
</html>