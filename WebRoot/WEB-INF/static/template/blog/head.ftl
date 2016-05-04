<#assign config_v="20141009044">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="众筹" />
<meta name="description" content="江苏邦筹网络科技公司" />
<link rel="shortcut icon" type="image/X-icon" href="${BASE_PATH}/static/templates/images/biao.ico" media="screen">
<title>筹引力</title>

<!-- Bootstrap core CSS -->
<link href="${TEMPLATE_BASE_PATH}/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->

<link rel="stylesheet" type="text/css"
	href="${BASE_PATH}/static/templates/css_style/layout.css" />
<link href="${TEMPLATE_BASE_PATH}/css/blog.css" rel="stylesheet">

	<script src="${TEMPLATE_BASE_PATH}/js/jquery.min.js?v=${config_v}"></script>


<script type="text/javascript">
	window.BasePath = "${BASE_PATH}";
	window.UEDITOR_HOME_URL = "${BASE_PATH}/";
</script>
<script type="text/javascript" charset="utf-8"
	src="${TEMPLATE_BASE_PATH}/assets/ueditor/ueditor.config.js?v=${config_v}"></script>
<script type="text/javascript" charset="utf-8"
	src="${TEMPLATE_BASE_PATH}/assets/ueditor/ueditor.all.js?v=${config_v}">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="${TEMPLATE_BASE_PATH}/assets/ueditor/lang/zh-cn/zh-cn.js?v=${config_v}"></script>
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/temp_public.js"
	language="javascript"></script>
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/menu/ddsmoothmenu.js"></script>
	
<!--  <script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/sortnav/prototype.lite.js"></script>

<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/sortnav/moo.fx.js"></script>
	
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/sortnav/moo.fx.pack.js"></script>
-->	
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/banner/slides.min.jquery.js"></script>
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/banner/banner.js"></script>
	
<script type="text/javascript">
        window.BasePath = "${BASE_PATH}";
        window.UEDITOR_HOME_URL = "${BASE_PATH}/";
</script>
<script src="${TEMPLATE_BASE_PATH}/js/jquery.form.min.js?v=${config_v}"></script>
<script src="${TEMPLATE_BASE_PATH}/js/jquery.validate.js?v=${config_v}"></script>
<script src="${TEMPLATE_BASE_PATH}/js/bootbox.min.js?v=${config_v}"></script>
<script src="${TEMPLATE_BASE_PATH}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		function mofinebanner() {
			var h, bh;
			w = $(window).width();
			bw = (w - $(".i_banner").outerWidth());
			$(".i_banner").css("margin-left", bw / 2);
		}
		$(window).resize(function() {
			mofinebanner();
		});
		mofinebanner();
	})
</script>


<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/mofine.js"></script>
	
<script src="${BASE_PATH}/static/common/js/pace/pace.min.js"></script>
<link href="${BASE_PATH}/static/common/js/pace/pace-theme-mac-osx.css" rel="stylesheet" />
</head>
<body id="index" onload="load()">
<div class="top_head" style="height:30px;line-height:30px;box-shadow:box-shadow: 2px 2px 1px #CCC; z-index:1; ">
  <div class="member_login" style="width:1000px;margin:0 auto;text-align:right;">欢迎您，${SESSION_USER.nickname } &nbsp;&nbsp;|&nbsp;&nbsp;
  			<a href="${BASE_PATH}/blog/user/info.htm" onclick="#">会员中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${BASE_PATH}/user/logout.htm" onclick="#"> 退出登录</a> 
  			 </div>
</div>
	<div class="header">
		<div class="header_in">
			<div class="logo" id="com_logo">
				<a href="${BASE_PATH}/index.htm"> <img
					src="${BASE_PATH}/static/templates/images/logo-1.png" alt="logo" style="width:400px;height:100px;" />
				</a>
			</div>
			<div class="header_r">
				<div class="lan">
					<li class="home" >联系我们 ：025-52313923 
					</li>
					
					
				</div>
				<div class="clear"></div>
				<div class="i_nav" id="com_mainmenu">
					<div id="smoothmenu1" class="ddsmoothmenu">
						<ul id="navctive">
						<@shishuo_folder_list_tag folderId= 0>
							<li class="line"></li>
							<li class="i_n01"><a href="${BASE_PATH}/index.htm"
								class="nava">首页</a></li>
							<#list tag_folder_list as tag_folder>
								<li class="line"></li>
								<li class="i_n02"><a href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>" class="nava <#if tag_folder.folderId==0>active</#if>">${tag_folder.name}</a></li>
			           		</#list>
						</@shishuo_folder_list_tag>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="donetion" style="position:fixed;right:30px;top:55%;width:50px;height:150px;background:#bc192a;border-radius:10px;"><a href="${BASE_PATH}/folder/products.htm" style="height:130px;padding-top:10px;z-index:1;color:#FFF;line-height:30px;display:block;font-size:30px; text-align:center;">我要参与</a></div>
	</body>
