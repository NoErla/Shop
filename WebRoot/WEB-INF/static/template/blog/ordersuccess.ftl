<#include "head.ftl">
       <script src="${BASE_PATH}/static/manage/js/jquery.validate.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${BASE_PATH}/static/templates/css_style/layout.css" />
<div class="content">
        <div class="pay">
            <div class="pay-content mt20">
                <div class="container2" style="width:900px;margin:0 auto 30px auto; ">
                    <div class="pay-main">
                        <div class="project-info2">
                           
                         
                            
                          
                            <div class="pay-way2">
                            <div ><img src="${BASE_PATH}/static/templates/images/red-success.jpg" style="width:10%;height: 10%;display: inline"/>&nbsp;&nbsp;<span style="font-size: 34px;font-weight: lighter;">支付成功!</span> </div>
                            
                            <dl class="one-line2 pay-div">
                                <dt class="fs14">订单编号：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li>${orderId!}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class="fs14">金额(人民币/元)：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li class="alipay select">${price!}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class="fs14">付款账号：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li class="alipay select">${account!}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class=>付款方式：</dt>
                                <dt class="alipay">
                                <ul>

                                    <li class="alipay select">${paymentWay!}</li>

                                </ul>

                                </dt>
                            </dl>
                        </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
<#include "footer.ftl">

