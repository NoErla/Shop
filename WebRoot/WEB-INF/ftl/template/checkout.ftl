<#include "head.ftl">

    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="${BASE_PATH }/">首页</a>
            <li class="active">结算</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
        <form action="${BASE_PATH }/payment/createOrder" method="post">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>结算</h1>
            <!-- BEGIN CHECKOUT PAGE -->
            <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

              <!-- BEGIN CHECKOUT -->
              <div id="checkout" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#checkout-content" class="accordion-toggle">
                      第一步: 填写收货信息
                    </a>
                  </h2>
                </div>
                <div id="checkout-content" class="panel-collapse collapse in">
                  <div class="panel panel-info">
							
							
							<div class="panel-body">
							<div class="table-wrapper-responsive">
								<table class="table">
								<thead>
									<tr>
					                    <th>详细地址</th>
					                    <th>收货人</th>
					                    <th>联系方式</th>
					                    <th></th>
					                </tr>
					            </thead>
					            <tbody>
					            <#list addressList as address>
					            	<tr>
					                <td id="td-Address${address.addressId }">${address.address }</td>
					                <td id="td-AddressName${address.addressId }">${address.name }</td>
					                <td id="td-AddressPhone${address.addressId }">${address.phone }</td>	
					                <td><input type="radio" name="addressRadios" value="${address.addressId }" <#if address.isDefault == 1>checked</#if>></td>
					                </tr>
					            </#list>
								</tbody>
								</table>
							
							</div>
							</div>
						</div>
                </div>
              </div>
              <!-- END CHECKOUT -->


              <!-- BEGIN CONFIRM -->
              <div id="confirm" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
                      第二步: 确认订单
                    </a>
                  </h2>
                </div>
                <div id="confirm-content" class="panel-collapse collapse">
                  <div class="panel-body row">
                    <div class="col-md-12 clearfix">
                      <div class="table-wrapper-responsive">
                      <table>
                        <tr>
                          	<th class="shopping-cart-image">图片</th>
		                    <th class="shopping-cart-description">商品名</th>
		                    <th class="shopping-cart-quantity">数目</th>
		                    <th class="shopping-cart-price">单价</th>
		                    <th class="shopping-cart-total" colspan="2">总计</th>
                        </tr>
                        <#assign sum = 0>
	                  <#list wantToBuyList as goods>
	                  <input type="hidden" value="${goods.id}" name="cartId">
	                  <tr>
	                  	<td class="shopping-cart-image">
	                  		<a href="#"><img src="${BASE_PATH }/${goods.image}" alt="${goods.goodsName}"></a>
	                  	</td>
	                  	<td class="shopping-cart-description">
	                      <h3><a href="#">${goods.goodsName}</a></h3>
	                    </td>
	                    <td class="shopping-cart-quantity">
	                      <div class="product-quantity">
	                          <h4>${goods.count}</h4>
	                      </div>
	                    </td>
	                    <td class="shopping-cart-price">
	                      <strong><span>￥</span>${goods.price}</strong>
	                    </td>
	                    <td class="shopping-cart-total">
	                      <strong><span>￥</span>${goods.price * goods.count}</strong>
	                    </td>
	                    <#assign sum = sum + goods.price * goods.count>            
	                  </tr>
	                  </#list>
                      </table>
                      </div>
                      <div class="checkout-total-block">
                        <ul>
                          <li class="checkout-total-price">
                            <em>总计</em>
                            <strong class="price"><span>￥</span>${sum }</strong>
                          </li>
                        </ul>
                      </div>
                      <div class="clearfix"></div>
                      <button class="btn btn-primary pull-right" type="submit" id="button-confirm">提交订单</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END CONFIRM -->
            </div>
            <!-- END CHECKOUT PAGE -->
          </div>
          <!-- END CONTENT -->
          </form>
        </div>
        
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    <#include "foot.ftl">