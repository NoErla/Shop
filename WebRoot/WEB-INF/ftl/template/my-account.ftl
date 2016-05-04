<#include "head.ftl">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="${BASE_PATH }/">首页</a>
			</li>
			<li class="active">我的账户</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<div class="sidebar col-md-3 col-sm-3">
				<ul class="list-group margin-bottom-25 sidebar-menu">
					<li class="list-group-item clearfix"><a
						href="${BASE_PATH }/shoppingcart/show.htm"><i
							class="fa fa-angle-right"></i> 我的购物车</a>
					</li>
					<li class="list-group-item clearfix"><a href="#order"
						data-toggle="tab"><i class="fa fa-angle-right"></i> 订单管理</a>
					</li>
					<li class="list-group-item clearfix"><a href="#updatePwd"
						data-toggle="tab"><i class="fa fa-angle-right"></i> 密码修改</a>
					</li>
					<li class="list-group-item clearfix"><a href="#addressManage"
						data-toggle="tab"><i class="fa fa-angle-right"></i> 地址簿</a>
					</li>
					
				</ul>
			</div>
			<!-- END SIDEBAR -->


			<div class="tab-content">
				<div class="tab-pane fade col-md-9 col-sm-9" id="updatePwd">
					<div class="content-form-page">
						<div class="row">
							<div class="col-md-7 col-sm-7">
								<form class="form-horizontal form-without-legend" role="form" action="${BASE_PATH}/myaccount/updatePsw.json" method="post" id="pwdForm">
									<div class="form-group">
										<label class="col-lg-4 control-label">旧密码 </label>
										<div class="col-lg-8">
											<input type="password" class="form-control" id="oldPassword" name="oldPassword">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label">新密码 </label>
										<div class="col-lg-8">
											<input type="password" class="form-control" id="newPassword" name="newPassword">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label">确认密码 </label>
										<div class="col-lg-8">
											<input type="password" class="form-control" id="rePassword" name="rePassword">
										</div>


									</div>
									<div class="row">
										<div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
											<a onclick="pwdServerCheck();" class="btn btn-primary"  id="submitPwd">确认</a>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
				<div class="tab-pane fade col-md-9 col-sm-9" id="addressManage">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">新增地址</h3>
							</div>
							
							<div class="panel-body">
								<form class="form-horizontal" id="addressForm" role="form" method="post" action="${BASE_PATH }/myaccount/addAddress.json">
									<div class="form-body">
										<input type="hidden" name="addressId" id="addressId"">
										<div class="form-group">
											<label class="col-md-3 control-label">详细地址:</label>
											<div class="col-md-9">
												<div class="input-group">
												<input type="text" class="form-control" placeholder="请输入详细地址" name="address" id="address" >
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">收货人:</label>
											<div class="col-md-9">
												<div class="input-group">
												<input type="text" class="form-control" placeholder="请输入收货人" name="name" id="consignee" >
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">电话/手机:</label>
											<div class="col-md-9">
												<div class="input-group">
												<input type="text" class="form-control" placeholder="请输入电话/手机" name="phone" id="consignee-phone">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-9">
												<div class="checkbox-list">
													<label class="checkbox-inline">
													<div class="checker">
													<span><input type="checkbox" value="1" name="isDefault"></span>
													</div> 设为默认地址
													</label>
												</div>
											</div>
										</div>
										
										<div class="form-actions fluid">
				                           <div class="col-md-offset-3 col-md-9">
				                              <button type="submit" class="btn green">保存</button>
				                           </div>
				                        </div>
									</div>
								</form>
							
							</div>
						</div>
						
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">地址簿</h3>
							</div>
							
							<div class="panel-body">
							<div class="table-wrapper-responsive">
								<table class="table">
								<thead>
									<tr>
					                    <th>详细地址</th>
					                    <th>收货人</th>
					                    <th>联系方式</th>
					                    <th colspan="2">操作</th>
					                    <th></th>
					                </tr>
					            </thead>
					            <tbody>
					            <#list addressList as address>
					            	<tr>
					                <td id="td-Address${address.addressId }">${address.address }</td>
					                <td id="td-AddressName${address.addressId }">${address.name }</td>
					                <td id="td-AddressPhone${address.addressId }">${address.phone }</td>	
					                <td><a href="${BASE_PATH }/myaccount/#addressManage	" onclick="updateAddress(${address.addressId })">修改</a> <a onclick="deleteAddress(${address.addressId })" href="${BASE_PATH }/myaccount/#addressManage">删除</a></td>	
					                <td><#if address.isDefault != 1><a class="btn red">设为默认</a></#if></td>				                
					                </tr>
					            </#list>
								</tbody>
								</table>
							
							</div>
							</div>
						</div>

					</div>
					
					<div class="tab-pane fade col-md-9 col-sm-9 in active" id="order">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">订单管理</h3>
							</div>
							
							<div class="panel-body">
							<div class="table-wrapper-responsive">
								<table class="table">
									<thead>
										<tr>
						                    <th>图片</th>
						                    <th>商品名</th>
						                    <th>单价</th>
						                    <th>数目</th>
						                    <th>总计</th>
						                    <th>状态</th>
						                </tr>
						            </thead>
								</table>							
							</div>
							</div>
							
							<#list orderList as order>
							<div class="panel-body">				
								<table class="table">
								
									<thead>
									日期：${order.createTime?string("yyyy-MM-dd") }
									订单号：${order.orderId }
									</thead>
									<tbody>
									<#list order.orderDetailList as goods>
										<tr>
											<td class="shopping-cart-image" style="width:129px"><img src="${BASE_PATH }/${goods.goodsImage}" class="img-responsive" alt="${goods.goodsName}"></td>
						                    <td style="width:171px">  ${goods.goodsName }</td>
						                    <td style="width:129px">${goods.price }</td>
						                    <td style="width:129px">${goods.count }</td>
						                    <td style="width:129px">${goods.count * goods.price }</td>
						                    <td rowspan="0"  style="width:129px">
						                    <#if goods_index == 0>
						                    	<#if order.isPaid == 0>
						                    	付款
						                    	<#else>
						                    	已付款
						                    	</#if>
						                   	 
						                    </#if>
						                    </td>
						                    
						                </tr>
						             </#list>
						            </tbody>
								</table>							
							</div>							
							</#list>
							
						</div>

					</div>
				<!-- END SIDEBAR & CONTENT -->
			</div>
		</div>



		<#include "foot.ftl">

		<script type="text/javascript">
			$(function() {
				$('#addressForm').ajaxForm({
					dataType : 'json',
					success : function(data) {
						if (data.result) {
							window.location.reload();
						} else {
							
						}
					}
				});

				
			});
			
			function pwdServerCheck(){
				if(pwdCheck()){
					var oldPassword = $("#oldPassword").val();
					var newPassword = $("#newPassword").val();
					var rePassword = $("#rePassword").val();
					$.ajax({
						type: "POST",
						url: '${BASE_PATH}/myaccount/updatePwd.json',
				    	data: {oldPassword:oldPassword,newPassword:newPassword,rePassword:rePassword},
						dataType:'json',
						cache: false,
						success: function(data){
							if(data.result){
								window.location.reload();
								
							}else{
								$("#loginname").tips({
									side : 1,
									msg : "缺少参数",
									bg : '#FF5080',
									time : 15
								});
								$("#loginname").focus();
							}
						}
					});
				}
				
			}
			
			function pwdCheck(){
				if ($("#oldPassword").val() == "") {

					$("#oldPassword").tips({
						side : 2,
						msg : '旧密码不得为空',
						bg : '#AE81FF',
						time : 3
					});

					$("#oldPassword").focus();
					return false;
				}

				if ($("#newPassword").val() == "") {

					$("#newPassword").tips({
						side : 2,
						msg : '新密码不得为空',
						bg : '#AE81FF',
						time : 3
					});

					$("#newPassword").focus();
					return false;
				}
				
				if ($("#newPassword").val() != $("#rePassword").val()) {

					$("#newPassword").tips({
						side : 2,
						msg : '确认密码与新密码不一致',
						bg : '#AE81FF',
						time : 3
					});

					$("#rePassword").focus();
					return false;
				}
				
				$("#submitPwd").tips({
					side : 1,
					msg : '正在提交, 请稍后 ...',
					bg : '#000000',
					time : 10
				});

				return true;
			}
			
			$(document).ready(function() {

				if(location.hash) {

				$('a[href=' + location.hash + ']').tab('show');

				}

				$(document.body).on("click", "a[data-toggle]", function(event) {

				location.hash = this.getAttribute("href");

				});

				});

				$(window).on('popstate', function() {

				var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");

				$('a[href=' + anchor + ']').tab('show');

				});
				function deleteAddress(addressId){
					$.post("${BASE_PATH}/myaccount/deleteAddress.json", {
		                'addressId' : addressId 
		            }, function(data) {
		                if (data.result) {
		                	window.location.reload();
		                } else {
		                    
		                }
		            });
			
			}
			
			
			
			function updateAddress(addressId){
				document.getElementById("addressId").value = addressId;
				document.getElementById("address").value = document.getElementById("td-Address" + addressId).innerText;
				document.getElementById("consignee").value = document.getElementById("td-AddressName" + addressId).innerText;
				document.getElementById("consignee-phone").value = document.getElementById("td-AddressPhone" + addressId).innerText;
			}
			
			

			
		</script>
		<script src="${BASE_PATH }/static/login/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="${BASE_PATH }/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${BASE_PATH }/static/js/jquery.cookie.js"></script>