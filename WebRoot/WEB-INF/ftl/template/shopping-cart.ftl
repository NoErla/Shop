<#include "head.ftl">

    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
          <form action="${BASE_PATH }/payment/toCheckout.htm">
            <h1>购物车</h1>
            <div class="shopping-cart-page">
              <div class="shopping-cart-data clearfix" id="cart">
              	<#if (shoppingcart?size > 0)>
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                  	<th></th>
                    <th class="shopping-cart-image">图片</th>
                    <th class="shopping-cart-description">商品名</th>
                    <th class="shopping-cart-quantity">数目</th>
                    <th class="shopping-cart-price">单价</th>
                    <th class="shopping-cart-total" colspan="2">总计</th>
                  </tr>
                  <#assign sum = 0>
                  <#list shoppingcart as goods>
                  <tr>
                  	<td>
                  	<div style="text-align:center">
                  	<input type="checkbox" name="wantToBuy" value="${goods.id}">
                  	</div>
                  	</td>
                  	<td class="shopping-cart-image">
                  		<a href="#"><img src="${BASE_PATH }/${goods.image}" alt="${goods.goodsName}"></a>
                  	</td>
                  	<td class="shopping-cart-description">
                      <h3><a href="#">${goods.goodsName}</a></h3>
                    </td>
                    <td class="shopping-cart-quantity">
                      <div class="product-quantity1">
                          <input id="count${goods.id}" type="number" onchange="updateCartTr(${goods.id});" value="${goods.count}" class="form-control input-sm" min="1">
                      </div>
                    </td>
                    <td class="shopping-cart-price">
                      <strong><span>￥</span>${goods.price}</strong>
                    </td>
                    <td class="shopping-cart-total">
                      <strong><span>￥</span>${goods.price * goods.count}</strong>
                    </td>
                    <#assign sum = sum + goods.price * goods.count>
                    <td class="del-goods-col">
                      <a class="del-goods" href="#" onclick="deleteCartTr(${goods.id});"><i class="fa fa-times"></i></a>
                    </td>                 
                  </tr>
                  </#list>
                </table>
                </div>
                

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>合计</em>
                      <strong class="price"><span>￥</span>${sum }</strong>
                    </li>
                  </ul>
                </div>
                <#else>
                <p>购物车是空的!</p>
                </#if>
              </div>
              <a class="btn btn-default" href="${BASE_PATH }/">继续购物 <i class="fa fa-shopping-cart"></i></a>
              <button type="submit" class="btn btn-primary">付款 <i class="fa fa-check"></i></button>
            </div>
            </form>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12 bxslider-wrapper bxslider-wrapper-similar-products">
            <h2>Most popular products</h2>
              <ul class="bxslider bxslider-similar-products" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="20">
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress2</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress3</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress4</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress5</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="${BASE_PATH }/static/assets/temp/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="${BASE_PATH }/static/assets/temp/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="item.html">Berry Lace Dress6</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
              </ul>
          </div>
        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>
    
    <script type="text/javascript">
    function updateCartTr(id){
    	var count = $("#count" + id).val() ;
    	$.post("${BASE_PATH}/shoppingcart/updateTr.json", {
    		'id' : id , 'count' : count
        }, function(data) {
            if (data.result) {
            	$("#cart").html(data.msg);
            	updateShoppingCart();
            } else {
                
            }
        });
    }
    
    function deleteCartTr(id){
    	$.post("${BASE_PATH}/shoppingcart/deleteTr.json", {
    		'id' : id
        }, function(data) {
            if (data.result) {
            	$("#cart").html(data.msg);
            	updateShoppingCart();
            } else {
                
            }
        });
    }
	</script>
    

    <#include "foot.ftl">