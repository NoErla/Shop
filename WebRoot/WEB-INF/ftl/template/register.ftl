<#include "head.ftl">

    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="${BASE_PATH }/">首页</a></li>
            <li class="active">注册</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="${BASE_PATH }/login.htm"><i class="fa fa-angle-right"></i> 登录/注册</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 找回密码</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 我的帐户</a></li>
            </ul>
          </div>
          <!-- END SIDEBAR -->
          

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <div class="content-form-page">
              <div class="row">
                <div class="col-md-7 col-sm-7">
                  <form class="form-horizontal form-without-legend" role="form" 
                  action="${BASE_PATH}/register.json" method="post" id="userForm">
                    <div class="form-group">
                      <label class="col-lg-4 control-label">用户名 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="username" name="username">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="name" name="name">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="password" class="form-control" id="password" name="password">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label">确认密码 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="password" class="form-control" id="rePassword" name="rePassword">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label">手机号码 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="password" class="form-control" id="phone" name="phone">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label">邮箱 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="password" class="form-control" id="email" name="email">
                      </div>
                    </div>
                    <div class="form-group">
                    	<label class="col-lg-4 control-label">验证码 <span class="require">*</span></label>
						<div class="col-lg-8">
                       		<input type="text" class="form-control" name="captcha">
                       		<img id="captcha" onclick="changeCode();" 
                       		style="cursor: pointer; cursor: hand; margin-top: 3px;width: 89px;" src="${BASE_PATH}/captcha.htm">
                      	</div>
                      	
                      	
					</div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0">
                        <a href="forgotton-password.html">忘记密码?</a>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                        <button type="submit" class="btn btn-primary">注册</button>
                      </div>
                    </div>
                  </form>
                </div>
                
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    

    <#include "foot.ftl">
    
    <script type="text/javascript">
		
		$(function() {
			$('#userForm').ajaxForm({
		        dataType: 'json',
		        success: function (data) {
		            if (data.result) {
		            	window.location.href="${BASE_PATH}/login.htm"; 
		            } else {
		            	if(data.msg == "errorCode"){
			            	$("#captcha").tips({
								side : 1,
								msg : "验证码错误",
								bg : '#FF5080',
								time : 15
							});		            		
		            	} else {
		            		$("#username").tips({
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
	<script src="/shop/static/login/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/shop/static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="/shop/static/js/jquery.cookie.js"></script>