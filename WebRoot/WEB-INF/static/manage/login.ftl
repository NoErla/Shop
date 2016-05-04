<!DOCTYPE html>
<html lang="en">

<head>
<title>商城 后台</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="${BASE_PATH}/static/login/bootstrap.min.css" />
<link rel="stylesheet" href="${BASE_PATH}/static/login/css/camera.css" />
<link rel="stylesheet" href="${BASE_PATH}/static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${BASE_PATH}/static/login/matrix-login.css" />
<link href="${BASE_PATH}/static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="${BASE_PATH}/static/login/js/jquery-1.5.1.min.js"></script>
</head>
<body>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="loginbox">
			<form action="${BASE_PATH}/admin/login.json" method="post" id="adminForm">
				<div class="control-group normal_text">
					<h3>
						<img src="${BASE_PATH}/static/login/logo.png" alt="Logo" />
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="${BASE_PATH}/static/login/user.png" /></i>
							</span><input type="text" name="name" id="name" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="${BASE_PATH}/static/login/suo.png" /></i>
							</span><input type="password" name="password" placeholder="请输入密码" value=""/>
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<div style="float: left;padding-top:2px;">
							<i><img src="${BASE_PATH}/static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="captcha" class="login_code"
								style="height:16px; padding-top:4px;" />
						</div>
						<div style="float: left;">
							<i><img id="captcha"
						style="cursor: pointer; cursor: hand; margin-top: 3px;width: 89px;"
						onclick="changeCode();" src="${BASE_PATH}/captcha.htm"></i>
						</div>
						<span class="pull-right"><button class="flip-link btn btn-info" type="submit">登录</button></span>
					</div>
				</div>
			</form>
			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright © m1yc</span></font>
				</div>
			</div>
		</div>
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="${BASE_PATH}/static/login/images/banner_slide_01.jpg"></div>
			<div data-src="${BASE_PATH}/static/login/images/banner_slide_02.jpg"></div>
			<div data-src="${BASE_PATH}/static/login/images/banner_slide_03.jpg"></div>
		</div>
		<!-- #camera_wrap_3 -->
	</div>

	<script type="text/javascript">
		
		$(function() {
			$('#adminForm').ajaxForm({
		        dataType: 'json',
		        success: function (data) {
		            if (data.result) {
		                location.href = "${BASE_PATH}/manage/index.htm";
		            } else {
		            	if(data.msg == "errorCode"){
			            	$("#captcha").tips({
								side : 1,
								msg : "验证码错误",
								bg : '#FF5080',
								time : 15
							});		            		
		            	} else {
		            		$("#name").tips({
								side : 1,
								msg : "用户名或密码错误",
								bg : '#FF5080',
								time : 15
							});
		            	}
			           changeCode();
		            }
		        }
		    });
		});
		
		function changeCode() {
			$("#captcha").attr("src", "${BASE_PATH}/captcha.htm?" + Math.random());
		}
		
	</script>
	
	
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<script src="${BASE_PATH}/static/login/js/bootstrap.min.js"></script>
	<script src="${BASE_PATH}/static/js/jquery-1.7.2.js"></script>
	<script src="${BASE_PATH}/static/login/js/jquery.easing.1.3.js"></script>
	<script src="${BASE_PATH}/static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="${BASE_PATH}/static/login/js/camera.min.js"></script>
	<script src="${BASE_PATH}/static/login/js/templatemo_script.js"></script>
	<script src="${BASE_PATH}/static/manage/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${BASE_PATH}/static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="${BASE_PATH}/static/js/jquery.cookie.js"></script>
</body>

</html>