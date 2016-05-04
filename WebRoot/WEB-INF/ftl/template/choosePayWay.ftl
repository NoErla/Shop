<#include "head.ftl">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="${BASE_PATH }/">首页</a>
			<li class="active">结算</li>
		</ul>
		<div class="row margin-bottom-40">
			
				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<h1>选择支付方式</h1>
					<!-- BEGIN CHECKOUT PAGE -->
					<div class="panel-group checkout-page accordion scrollable"
						id="checkout-page">

						<!-- BEGIN CHECKOUT -->
						<div id="checkout" class="panel panel-default">
							<div class="panel-heading">
								<h2 class="panel-title">
									<a data-toggle="collapse" data-parent="#checkout-page"
										href="#checkout-content" class="accordion-toggle"> 选择支付方式
									</a>
								</h2>
							</div>
							<div id="checkout-content" class="panel-collapse collapse in">
								<div class="panel panel-info">


									<div class="panel-body">
										<form class="form-horizontal" role="form" action="${BASE_PATH }/payment/unionpay" method="post">
										<input type="hidden" name="orderId" value="${orderId }">
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-3 control-label">支付方式</label>
													<div class="col-md-9">
														<div class="radio-list">
															<label class="radio-inline">
																<div class="radio">
																	<span><input type="radio" name="payWay" value="1" checked></span>
																</div>
																银联
															
															</label>
														</div>
													</div>
												</div>
												
												<div class="form-actions fluid">
						                           <div class="col-md-offset-3 col-md-9">
						                              <button type="submit" class="btn green">付款</button>
						                           </div>
						                        </div>
											
											</div>
										</form>
										
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
		
		</div>

	</div>

	<!-- END SIDEBAR & CONTENT -->
</div>
</div>

<#include "foot.ftl">
