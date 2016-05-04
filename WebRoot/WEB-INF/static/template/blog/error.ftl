<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>错误页面</title>
<meta http-equiv="refresh" content="60;url=#">
<!-- content="60，即60秒后返回主页，可根据需要修改或者删除这段代码 -->
<link href="${BASE_PATH}/static/template/blog/css/error.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 代码 开始 -->
<div id="container">
<img class="png" src="${BASE_PATH}/static/template/blog/images/error/01.png" /> 
<div style="height:30px;margin-bottom:50px;"><p style="font-family:微软雅黑;font-size:20px;line-height:30px;color:#FFF;">:(&nbsp;&nbsp;&nbsp;&nbsp;${tips }<span style="color:#ea0000;">（${statusCode }错误）</span></p></div>
<!-- <img class="png msg" src="images/404_msg.png" /> -->
  <p><a href="${BASE_PATH}/index.htm" target="_blank"><img class="png" src="${BASE_PATH}/static/template/blog/images/error/404_to_index.png" /></a> </p>
</div>
<div id="cloud" class="png"></div>
<!-- 代码 结束 -->

 
</body>
</html>