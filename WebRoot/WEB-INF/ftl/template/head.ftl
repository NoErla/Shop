<html lang="en">
<head>
  <meta charset="utf-8">
  <title>从心所愿的百货公司</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">
  <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="${BASE_PATH }/static/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="${BASE_PATH }/static/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="${BASE_PATH }/static/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">              
  <link href="${BASE_PATH }/static/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
  <link rel="stylesheet" href="${BASE_PATH }/static/assets/plugins/layerslider/css/layerslider.css" type="text/css">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="${BASE_PATH }/static/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
  <link href="${BASE_PATH }/static/assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="${BASE_PATH }/static/assets/css/style-responsive.css" rel="stylesheet" type="text/css">  
  <link href="${BASE_PATH }/static/assets/css/custom.css" rel="stylesheet" type="text/css">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
    <!-- BEGIN TOP BAR -->
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">

                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                        <#if SESSION_USER?exists>
                        <li><a href="${BASE_PATH }/myaccount/">${SESSION_USER.username }的账户</a></li>
                        <li><a href="checkout.html">购物车</a></li>
                        <li><a href="${BASE_PATH }/logout.htm">登出</a></li>
                        <#else>
                        <li><a href="${BASE_PATH }/login.htm">登录</a></li>
                        <li><a href="${BASE_PATH }/register.htm">注册</a></li>
                        </#if>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- END TOP BAR -->

    <!-- BEGIN HEADER -->
    <div role="navigation" class="navbar header no-margin">
        <div class="container">
            <div class="navbar-header">
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <a href="${BASE_PATH }/" class="navbar-brand"><img src="${BASE_PATH }/static/assets/img/logo_red.png" alt="Metronic Shop UI"></a><!-- LOGO -->
            </div>
            <#if SESSION_USER?exists>
            <!-- BEGIN CART -->
            <div class="cart-block">
                <div class="cart-info">
                    <a href="javascript:void(0);" class="cart-info-count">${shoppingcart?size }个物品</a>
                </div>
                <i class="fa fa-shopping-cart"></i>
                <!-- 购物车 -->
                <div class="cart-content-wrapper">
                  <div class="cart-content">
                    <ul class="scroller" style="height: 250px;">
                    
                    <#assign sum = 0>
                    
                    
                    <#list shoppingcart as cart>
                    	<li>
                    		<a href="item.html"><img src="${BASE_PATH }/${cart.image}" alt="Rolex Classic Watch" width="37" height="34"></a>
	                        <span class="cart-content-count">x ${cart.count}</span>
	                        <strong>
	                        <a href="item.html">${cart.goodsName}</a></strong>
	                        <em>￥${cart.price * cart.count}</em>
	                        <#assign sum = sum + cart.price * cart.count>
	                        <a onclick="deleteShoppingCart(${cart.id });" class="del-goods">
	                        <i class="fa fa-times"></i>
	                        </a>
                    	</li>                   
                    </#list>
                   
                      
                    </ul>
                    <div class="text-right">
                      <a href="javascript:void(0);" class="cart-info-value">合计：￥ ${sum }</a>
                      <a href="${BASE_PATH}/shoppingcart/show.htm" class="btn btn-default">查看</a>
                      <a href="${BASE_PATH}/payment/checkout.htm" class="btn btn-primary">结算</a>
                    </div>
                  </div>
                </div>
                <!-- 购物车 -->
            </div>
            <!-- END CART -->
             </#if>
                        <!-- BEGIN NAVIGATION -->
            <div class="collapse navbar-collapse mega-menu">
                <ul class="nav navbar-nav">
                	<#list goodsTypeList as type>
                	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="${BASE_PATH }/type/${type.ename }.htm" href="${BASE_PATH }/type/${type.ename }.htm">
                    ${type.goodsTypeName }
                    <i class="fa fa-angle-down"></i>
                    </a>
                    <#if type.hasSubType>
                      <!-- 子类 -->
                      <ul class="dropdown-menu">
                      <#list type.subType as sub>
                        <li><a href="${BASE_PATH }/type/${sub.ename }.htm">${sub.goodsTypeName }</a></li>   
                       </#list>
                      </ul>
                      <!-- 子类结束 -->
                    </#if>           
                    </li>
                    </#list>                                       
                    <!-- END TOP SEARCH -->
                </ul>
            </div>
            <!-- END NAVIGATION -->
        </div>
    </div>
    <!-- END HEADER -->