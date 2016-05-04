<#assign menu="user"> <#assign submenu="user_list"> <#include
"../head.ftl"> <#--
<link href="../css/bootstrap.css" rel="stylesheet">
-->
<style type="text/css">
.pagination {
	border-radius: 4px;
	display: inline-block;
	margin: 0;
	padding-left: 0;
}
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<section class="panel">
			<header class="panel-heading">
				<div class="row">
					<div class="col-lg-4">
						<ul class="breadcrumb" style="margin-bottom:0px;">
							<li><a href="${BASE_PATH}/manage/article/list.htm">所有用户信息</a>
							</li>
						</ul>
					</div>
					<div class="col-lg-4">
						<form method="GET" action="search.htm">
							<input type="text" name="name" placeholder="name" id="name" />
							<button class="btn btn-info" type="submit">搜索</button>
						</form>
					</div>
					<div class="col-lg-4">
						<a class="btn btn-primary fl-r"
							href="${BASE_PATH}/manage/user/add.htm">增加用户</a>
					</div>
				</div>
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<div role="grid" class="dataTables_wrapper"
						id="hidden-table-info_wrapper">
						<table class="table table-striped table-advance table-hover">
							<thead>
								<tr>
									<th>用户名称</th>
									<th>昵称</th>
									<th>姓名</th>
									<th class="sort">时间 <a data-key="create_time"
										data-value="desc">desc</a> <a data-key="create_time"
										data-value="asc">asc</a>
									</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody role="alert" aria-live="polite" aria-relevant="all">
								<#list pageVo.list as e>
								<tr class="gradeA odd">
									<td class="js_userId">${e.userId!}</td>
									<td>${e.username!}</td>
									<td><a
										href="${BASE_PATH}/manage/user/detail.htm?userId=${e.userId!}">${e.nickname!}</a>
									</td>
									<td>${e.name!}</td>
									<td>${(e.createTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
									<td>
										<!-- Icons --> <a
										href="${BASE_PATH}/manage/user/update.htm?userId=${e.userId!}"
										title="修改信息">
											<button class="btn btn-primary btn-xs">
												<i class="icon-pencil"></i>
											</button> </a> <a
										href="${BASE_PATH}/manage/user/updatePwd.htm?userId=${e.userId!}"
										title="修改密码">
											<button class="btn btn-myc btn-xs">
												<i class="icon-pencil"></i>
											</button> </a> <#--${e.lockFlag!}--> <#if e.lockFlag == true> <a
										href="javascript:void(0);" userId="${e.userId!}" title="解冻"
										class="js_unlock_user" id="unlock">
											<button class="btn btn-info btn-xs">
												<i class="icon-unlock "></i>
											</button> </a> <#else> <a href="javascript:void(0);" userId="${e.userId!}"
										title="冻结" class="js_lock_user" id="lock">
											<button class="btn btn-warning btn-xs">
												<i class="icon-lock "></i>
											</button> </a> </#if> <a href="javascript:void(0);" userId="${e.userId!}"
										title="删除" class="js_delete_user" id="delete">
											<button class="btn btn-danger btn-xs">
												<i class="icon-trash "></i>
											</button> </a>
									</td>
								</tr>
								</#list>
							</tbody>
						</table>
						<!-- 开始分页模块内容 -->
						<#if searchKey??>
						<div class="navPage pagebar">
							<ul>
								<a title="第一页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=1">|&lt;</a>
								<#if (pageNum > 1)>
								<a title="上一页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=${pageNum-1}">&lt;&lt;</a>

								<a title="第${pageNum-1}页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=${pageNum-1}">${pageNum-1}</a>
								</#if>
								<a title="" class="pagebarCurrent">${pageNum}</a> <#if (pageNum
								< pageVo.pageCount) >
								<a title="第${pageNum+1}页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=${pageNum+1}">${pageNum+1}</a>

								<a title="下一页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=${pageNum+1}">&gt;&gt;</a>

								</#if>
								<a title="最后一页"
									href="${BASE_PATH }/manage/user/search.htm?name=${searchKey }&p=${pageVo.pageCount}">&gt;|</a>

							</ul>
						</div>
						<#else>
						<div style="height: 30px;">
							<div class="pagination">${pageVo.pageNumHtml}</div>
						</div>
						</#if>
					</div>
				</div>
			</div>
		</section>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<script>
	$(function() {
		$(".js_userId").hide();

		$(".sort a")
				.click(
						function() {
							var order_by = $(this).data('key');
							var order_type = $(this).data('value') === 'asc' ? 0
									: 1;
							console.log(order_type);
							window.location = "${BASE_PATH}/manage/user/page.htm?order_by="
									+ order_by + "&order_type=" + order_type;
						});

		$('.js_unlock_user').click(function() {
			var userId = $(this).attr('userId');
			bootbox.dialog({
				message : "是否" + $(this).attr('title') + "用户",
				title : "提示",
				buttons : {
					"delete" : {
						label : "解冻",
						className : "btn-danger",
						callback : function() {
							$.post("${BASE_PATH}/manage/user/unlock.json", {
								"userId" : userId
							}, function(data) {
								if (data.result) {
									bootbox.alert("解冻成功", function() {
										window.location.reload();
									});
								} else {
									bootbox.alert(data.msg, function() {
									});
								}
							}, "json");
						}
					},
					"cancel" : {
						label : "取消",
						className : "btn-default",
						callback : function() {
						}
					}
				}
			});
		});
		$('.js_lock_user').click(function() {
			var userId = $(this).attr('userId');
			bootbox.dialog({
				message : "是否" + $(this).attr('title') + "用户",
				title : "提示",
				buttons : {
					"delete" : {
						label : "冻结",
						className : "btn-danger",
						callback : function() {
							$.post("${BASE_PATH}/manage/user/lock.json", {
								"userId" : userId
							}, function(data) {
								if (data.result) {
									bootbox.alert("冻结成功", function() {
										window.location.reload();
									});
								} else {
									bootbox.alert(data.msg, function() {
									});
								}
							}, "json");
						}
					},
					"cancel" : {
						label : "取消",
						className : "btn-default",
						callback : function() {
						}
					}
				}
			});
		});

		$('.js_delete_user').click(function() {
			var userId = $(this).attr('userId');
			bootbox.dialog({
				message : "是否" + $(this).attr('title') + "用户",
				title : "提示",
				buttons : {
					"delete" : {
						label : "删除",
						className : "btn-danger",
						callback : function() {
							$.post("${BASE_PATH}/manage/user/delete.json", {
								"userId" : userId
							}, function(data) {
								if (data.result) {
									bootbox.alert("删除成功", function() {
										window.location.reload();
									});
								} else {
									bootbox.alert(data.msg, function() {
									});
								}
							}, "json");
						}
					},
					"cancel" : {
						label : "取消",
						className : "btn-default",
						callback : function() {
						}
					}
				}
			});
		});
	});
</script>
<#include "../foot.ftl">
