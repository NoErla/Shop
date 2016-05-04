<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	This is my JSP page.
	<br> <@shop_menu_list_tag menuId= 0>
	<li class="line"></li>
	<li class="i_n01"><a href="${BASE_PATH}/index.htm" class="nava">首页</a>
	</li> <#list tag_menu_list as tag_menu>
	<li class="line"></li>
	<li class="i_n02"><a href="#">${tag_menu.menuName}</a>
	</li> </#list> </@shop_menu_list_tag>
</body>
</html>

