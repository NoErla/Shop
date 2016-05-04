<#assign config_v="20141009044">
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="我的网站名称" />
	<meta name="description" content="我的网站名称" />
	
	<title>注册</title>
	<link rel="shortcut icon" type="image/X-icon" href="${BASE_PATH}/static/templates/images/biao.ico" media="screen">
	<link rel="stylesheet" type="text/css" href="${BASE_PATH}/static/templates/css_style/layout.css"  />
    <link href="${BASE_PATH}/static/manage/css/bootstrap.min.css" rel="stylesheet">
    <link href="${BASE_PATH}/static/manage/css/bootstrap-reset.css" rel="stylesheet">
	<link rel="stylesheet" href="${BASE_PATH}/static/templates/css_style/login.css" />
	<link href="${BASE_PATH}/static/manage/assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<script src="${BASE_PATH}/static/manage/js/jquery.js?v=${config_v}"></script>
  	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/temp_public.js"  language="javascript"></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/menu/ddsmoothmenu.js" ></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/sortnav/prototype.lite.js" ></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/sortnav/moo.fx.js" ></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/sortnav/moo.fx.pack.js" ></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/banner/slides.min.jquery.js" ></script>
	<script type="text/javascript" src="${BASE_PATH}/static/templates/jscript/banner/banner.js" ></script>

	<script src="${BASE_PATH}/static/manage/js/jquery.js?v=${config_v}"></script>
    <script src="${BASE_PATH}/static/manage/js/jquery.validate.min.js"></script>
    <script src="${BASE_PATH}/static/manage/js/jquery.form.min.js"></script>
    <script src="${BASE_PATH}/static/common/js/additional-methods.js"></script>
    <script type="text/javascript">
		var base_path = ${BASE_PATH};
	</script>
    
<script src="${BASE_PATH}/static/common/js/pace/pace.min.js"></script>
    <link href="${BASE_PATH}/static/common/js/pace/pace-theme-mac-osx.css" rel="stylesheet" />
	
</head>

<body>

<div style="background-color: #c8000b">

<div class="pheader">
<div class="logo" id="com_logo" >
<a href="#" >
<img src="${BASE_PATH}/static/templates/images/logo-1.png"  alt="logo" style="width:400px;height:100px;"/>
</a>
</div>
<div class="hotline" id="com_singles_hotline" style="color: #000000"  >客户热线：025-523-139-23</div>
</div>
<div class="topline">
<div class="mauto">
<div class="topline_r">
<div class="topline_nav">
</div>
</div>
</div>
</div>
<div class="clear">
</div>
</div>

<!--登录主体 start-->
<div class="login-container">
    <div class="inner">
      
        <div class="login-wrap" style="height:auto;padding:5px;">
            <div class="ln-inner " id="cut">
                <ul class="menu">
                    
                    <li class="active right">
                        <a href="javascript:;" class="login_cut" id="pc">注册</a>
                    </li>
                </ul>
				<form class="form-signin" id="userForm"
		          action="${BASE_PATH}/user/register.json" autocomplete="off"
		          method="post">
                <div class="ln-types" style="width:670px">
                    <!--账户密码登录 start-->
                    <div class="ln-form">
                        <div class="ln-line username">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="text" id="username" name="username" placeholder="请输入用户名" />
                            </div>
                        </div>
                        <div class="ln-line password">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="password" name="password" id="password" placeholder="请输入登录密码" />
                            </div>
                        </div>
                        <div class="ln-line password">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="password" name="re_password" placeholder="请再次输入密码" />
                            </div>
                        </div>
                        <div class="ln-line nickname">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="text" name="nickname" placeholder="请输入昵称" />
                            </div>
                        </div>
                        <div class="ln-line name">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="text" name="name" placeholder="请输入真实姓名" />
                            </div>
                        </div>
                        <div class="ln-line phone">
                            <div class="ln-k">
                                <i class="icon"></i>
                                <input type="text" name="phone" placeholder="请输入手机号码" />
                            </div>
                        </div>
                        <div class="ln-line code">
                            
                            <div class="ln-k">
                                <input type="text" placeholder="请输入验证码" name="captcha" />
                            </div>
                            <div class="code-img">
                                <div class="tc" style="display:block">
                                     <img id="captcha" style="cursor: pointer; cursor: hand; margin-top: 3px;width: 89px;" onclick="this.src='${BASE_PATH}/captcha.htm?'+Math.random();" src="${BASE_PATH}/captcha.htm">                                </div>
                            </div>
                        </div>

                        <div class="ln-line">
                            <button  id="but" class="btn btn-login btn-lg btn-block" type="submit">注册</button>
                        </div>
                        <div id="errorshow"></div>
								<div class="ln-line">
									<div class="reg-link">
										<a href="${BASE_PATH}/user/login.htm"> 返回首页</a>
									</div>
								</div>
						</form>
                       
                    </div>
                    <!--账户密码登录 end-->

                 
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/template/blog/footer.ftl">
<script type="text/javascript">
    $(function () {
    	
    	if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
    	    $('[placeholder]').focus(function() {
    	        var input = $(this);
    	        if (input.val() == input.attr('placeholder')) {
    	            input.val('');
    	            input.removeClass('placeholder');
    	        }
    	    }).blur(function() {
    	        var input = $(this);
    	        if (input.val() == '' || input.val() == input.attr('placeholder')) {
    	            input.addClass('placeholder');
    	            input.val(input.attr('placeholder'));
    	        }
    	    }).blur();
    	};
    	function placeholderSupport() {
    	    return 'placeholder' in document.createElement('input');
    	}
    	
    	 $('#userForm').ajaxForm({
    	        dataType: 'json',
    	        success: function (data) {
    	            if (data.result) {
    	                document.location.href = "${BASE_PATH}/index.htm";
    	            } else {
    	            	addElementDiv("errorshow",data.errors.password);
    	                if (data.msg == "change_captcha") {
    	                    $('#captcha').attr("src", "${BASE_PATH}/captcha.htm?" + Math.random());
    	                    $(selector).find('input[name="captcha"]').val('');
    	                }
    	            }
    	        }
    	    });
        ajaxSubmit('#userForm');
    });
    
    $("#userForm").validate({
        rules: {
            username: {
            	required: true,
            	minlength: 6,
                maxlength: 18,
            	remote: "${BASE_PATH}/check/username.htm",
            	isNumOrLetter: true
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 16,
                isNumOrLetter:  true
            },
            re_password: {
                equalTo : "#password"
            },
            nickname: {
            	required: true,
            	remote: "${BASE_PATH}/check/nickname.htm"
            },
            name: {
            	required: true,
            },
            phone: {
            	required: true,
            	isPhone: true
            },
            captcha: {
            	required: true,
            	remote: "${BASE_PATH}/check/captcha.htm"
            }
        },
        messages: {
        	username: {
                required: "用户名不能为空",
                minlength: "用户名不能小于6个字符",
                maxlength: "密码不能大于18个字符",
                remote: "用户名已存在"
                  },
        	password: {
                required: "密码不能为空",
                minlength: "密码不能小于6个字符",
                maxlength: "密码不能大于16个字符"
                  },
            re_password: {
                equalTo : "两次密码输入不一致"
                  },
            nickname: {
                required: "昵称不能为空",
                remote: "该昵称已被占用"
                  },
            name: {
                required: "姓名不能为空",
                  },
            phone: {
                required: "手机号不能为空",
                  },
            captcha: {
            	required: "不能为空",
            	remote: "验证码错误"
            }
          },
          errorPlacement: function(error, element){
        	  if(element.parent().next().hasClass("code-img")){
          error.prependTo(element.parent().parent().next());
          }else{
          
        	  error.appendTo(element.parent().parent());
        	  }            
          }
         });
    function ajaxSubmit(formName) {
        $(formName).validate();
        }
    
    function addElementDiv(obj,msg) {
    	var parent = document.getElementById(obj);
    	parent.innerHTML = msg;
    	}
  
</script>
</body>
</html>