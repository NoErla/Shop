<!DOCTYPE html>
<html lang="en">
<head>
<!-- 下拉框 -->
<link rel="stylesheet" href="/shop/static/ace/css/chosen.css" />
<!-- 头部 -->
<#include "../index/top.ftl">
<!-- 日期框 -->
<link rel="stylesheet" href="/shop/static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						
						<!-- 检索  -->
						<form action="list.htm" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="" placeholder="这里输入关键词" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">编号</th>
									<th class="center">用户名</th>
									<th class="center">姓名</th>
									<th class="center">角色</th>
									<th class="center"><i class="ace-icon fa fa-envelope-o"></i>邮箱</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>最近登录</th>
									<th class="center">上次登录IP</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<#list pageVo.list as user>
								<tr>
									<td class='center' style="width: 30px;">
										<#if user.username != 'admin'><label><input type='checkbox' name='ids' value="${user.userId }" id="${user.email! }" alt="${user.phone! }" title="${user.username! }" class="ace"/><span class="lbl"></span></label></#if>
										<#if user.username == 'admin'><label><input type='checkbox' disabled="disabled" class="ace" /><span class="lbl"></span></label></#if>
									</td>
									<td class='center' style="width: 30px;">${user_index + 1 }</td>
									<td class="center">${user.userId }</td>
									<td class="center"><a onclick="viewUser('${user.username}')" style="cursor:pointer;">${user.username }</a></td>
									<td class="center">${user.name! }</td>
									<td class="center">${user.roleName! }</td>
									<td class="center"><a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" >${user.email! }&nbsp;<i class="ace-icon fa fa-envelope-o"></i></a></td>
									<td class="center">${user.lastLogin! }</td>
									<td class="center">${user.ip!}</td>
									<td class="center">
										<a class="btn btn-xs btn-success" title="编辑" onclick="editUser('${user.userId}');">
											<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
										</a>
										<a class="btn btn-xs btn-danger" onclick="delUser('${user.userId }','${user.username }');">
											<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
										</a>
									</td>
									
								</tr>
							</#list>
							
							
							</tbody>
						</table>
						
					<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;">
								<a class="btn btn-mini btn-success" onclick="add();">新增</a>
							</td>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${pageVo.pageNumHtml}</div></td>
						</tr>
					</table>
					</div>
					
					</form>
	
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<#include "../index/foot.ftl">
	<!-- 删除时确认窗口 -->
	<script src="/shop/static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="/shop/static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="/shop/static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="/shop/static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="/shop/static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
$(top.hangge());

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
});

//检索
function searchs(){
	top.jzts();
	$("#userForm").submit();
}

//修改
function editUser(userId){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '/shop/manage/sysAppUser/goEditU.htm?userId='+userId;
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 window.location.reload();
		}
		diag.close();
	 };
	 diag.show();
}

//新增
function add(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增";
	 diag.URL = '/shop/manage/sysAppUser/goAddU.htm';
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 window.location.reload();
		}
		diag.close();
	 };
	 diag.show();
}
//删除
function delUser(userId,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "/shop/manage/sysAppUser/deleteU?userId="+userId;
			$.get(url,function(data){
				window.location.reload();
			});
		};
	});
}
		
</script>
</html>
