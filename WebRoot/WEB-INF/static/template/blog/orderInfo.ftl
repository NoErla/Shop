<#include "head.ftl">
    <script src="${BASE_PATH}/static/manage/js/jquery.validate.min.js"></script>
    <script src="${TEMPLATE_BASE_PATH}/js/jquery.timers-1.1.2.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${BASE_PATH}/static/templates/css_style/layout.css" />
    <div class="content">
        <div class="pay">
            <div class="pay-content mt20">
                <div class="container2" style="width:900px;margin:0 auto 30px auto; ">
                    <div class="pay-main">
                        <div class="project-info2">

                            <dl class="one-line2 project-title">
                                <dd class="">确认订单信息</dd>
                            </dl>

                        </div>
                        <div class="pay-way2">
                            <dl class="one-line2 pay-div">
                                <dt class="fs14">订单编号：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li>${deal.id}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class="fs14">金额(人民币/元)：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li class="alipay select">${deal.totalPrice}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class="fs14">付款账号：</dt>
                                <dd style="margin-right:20px;">
                                    <ul>

                                        <li class="alipay select">${username}</li>

                                    </ul>
                                </dd>


                            </dl>
                            <dl class="one-line2  pay-div">
                                <dt class=>付款方式：</dt>
                                <dt class="alipay">
                                <ul>

                                    <li class="alipay select"><#if deal.paymentId == 1> 支付宝支付
                                    </#if> <#if deal.paymentId == 2> 银联支付 </#if></li>

                                </ul>

                                </dt>
                            </dl>
                        </div>
                        

                        </dt>
                        </dl>
                        <div class="pay-submit2">
                            <a class="" target="view_window" href="${BASE_PATH }/blog/unionpay/unionpayLogin.htm?id=${deal.id}">
                                <input type="button" class="btn-effect-blue submit" value="去支付" onclick="confirmPaid();"></a>
                        </div>
                    </div>
                   
                    
                </div>
            </div>
        </div>
    </div>
    </div>


    
    <#include "footer.ftl">

  <script type="text/javascript">
        
   
    function confirmPaid() {
      $('.submit').attr('disabled','disabled').val('订单处理中').css('background-color','gray');
        bootbox.confirm({
            buttons: {
                confirm: {
                    label: '是'

                },
                cancel: {
                    label: '否'
                }
            },
            message: '是否付款成功？',
            callback: function (result) {
                if (result) {
                   location.href="${BASE_PATH}/blog/user/info.htm";
                } else {
                    location.href="${BASE_PATH}/index.htm";
                }
            }
        });

    }  

            function load() {
                $("#donetion").css("display", "none");
            }
        </script>
