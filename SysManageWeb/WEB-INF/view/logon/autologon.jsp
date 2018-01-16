<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Login</title>

	<script src="../assets/js/jquery-1.11.1.min.js"></script>


</head>
<body class="page-body login-page" >
<div>登录中...</div>

</body>

	<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						 
								$.ajax({
									url: "../login",
									method: 'POST',
									dataType: 'json',
									data: {
										ssoId: '${ssoId}',
										password: '${password}'
									},
									success: function(resp)
									{
										// Redirect after successful login page (when progress bar reaches 100%)
										if(resp.retcode == "I0001")
										{
											window.location.href = 'index';
										}
										else
										{
											alert(resp.msg);
										}

									},
									error: function(resp)
									{
										alert(JSON.stringify(resp));
									}
								});
 
					});
				</script>
</html>