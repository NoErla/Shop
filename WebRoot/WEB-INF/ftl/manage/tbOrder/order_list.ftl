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
						<form action="${BASE_PATH }/manage/tbOrder/list.htm" method="post" name="orderForm" id="orderForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<select class="form-control" name="isPaid" style="font-size:15px;width: 300px;">
											<option value="" selected>请选择支付状态</option>
					                        <option value="0">未支付</option>
					                        <option value="1">已支付</option>                       							
			                        </select>
								</td>
								<td>
									<select class="form-control" name="isSend" style="font-size:15px;width: 300px;">
											<option value="" selected>请选择发货状态</option>
					                        <option value="0">未发货</option>
					                        <option value="1">已发货</option>                       							
			                        </select>
								</td>
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
									<th class="center" style="width:50px;">订单号</th>
									<th class="center">用户Id</th>
									<th class="center">地址Id</th>
									<th class="center">总价格</th>
									<th class="center">是否支付</th>
									<th class="center">是否发货</th>
									<th class="center">创建时间</th>
									<th class="center">支付时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<#list pageVo.list as order>
								<tr>
									<td class='center' style="width: 30px;">${order.orderId }</td>
									<td class="center">${order.userId }</td>
									<td class="center"><a onclick="viewUser('${order.userId}')" style="cursor:pointer;">${order.userId }</a></td>
									<td class="center">${order.addressId! }</td>
									<td class="center">${order.totalPrice! }</td>
									<td class="center"><#if order.isPaid == 1>是<#else>否</#if></td>
									<td class="center"><#if order.isSend == 1>是<#else>否</#if></td>
									<td class="center">${order.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
									<td class="center"><#if order.isPaid == 1>${order.payTime?string("yyyy-MM-dd HH:mm:ss")!}</#if></td>
									<td class="center">
									<#if (order.isPaid == 1 && order.isSend == 0)>
										<a class="btn btn-xs btn-danger" title="发货" onclick="send('${order.orderId}')">
												发货
										</a>
									</#if>
									<#if (order.isPaid == 1 && order.isSend == 1)>
										<a class="btn btn-xs btn-success" title="撤销发货" onclick="cancelSend('${order.orderId}')">
												撤销发货
										</a>
									</#if>
									<#if order.isPaid == 0>
										<a class="btn btn-xs btn-default" title="撤销订单" onclick="deleteOrder('${order.orderId}')">
												撤销订单
										</a>
									</#if>
									</td>
									
								</tr>
							</#list>
							
							
							</tbody>
						</table>
						
					<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
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
	$("#orderForm").submit();
}


//撤销订单
function deleteOrder(orderId){
	bootbox.confirm("确定要撤销该订单吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "/shop/manage/tbOrder/deleteO?orderId="+orderId;
			$.get(url,function(data){
				window.location.reload();
			});
		};
	});
}

//发货
function send(orderId){
	bootbox.confirm("确定发货吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "/shop/manage/tbOrder/sendO?orderId="+orderId;
			$.get(url,function(data){
				window.location.reload();
			});
		};
	});
}

//发货
function cancelSend(orderId){
	bootbox.confirm("确定撤销发货吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "/shop/manage/tbOrder/cancelSendO?orderId="+orderId;
			$.get(url,function(data){
				window.location.reload();
			});
		};
	});
}
		
</script>
</html>
