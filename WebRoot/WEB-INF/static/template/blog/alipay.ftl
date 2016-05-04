<#include "head.ftl">
<link rel="stylesheet" type="text/css"
	href="${BASE_PATH}/static/templates/css_style/dll.css" />
<div class="content">
        <div class="pay">
            <div class="pay-content mt20">
                <div class="container2" style="width:900px;margin:0 auto 30px auto; ">
                    <div class="pay-main">
                        <div class="project-info2">
                           
                           <dl class="one-line2 project-title">
                               <dd class="">确认支付</dd>
                           </dl>
                        </div>
<form action="" method="get" name="order"  target="_blank" >
    <div class="pay-way2">
    <table border="0" class="table-order" >
        <tr>
            <td class="right-td">订单名称:</td>
            <td class="left-td"> <input type="hidden" value="${orderDescript}"  style="display:block;height:30px; width:100px;" name="orderDescript" />${orderDescript}</td>
        </tr>
        <tr>
            <td class="right-td">支付方式:</td>
            <td class="left-td"> <input type="hidden" value="${orderDescript}"  style="display:block;height:30px; width:100px;" name="orderDescript" />支付宝</td>
        </tr>
        
        <tr>
            <td class="right-td">订单号:</td>
            <td class="left-td"> <input type="hidden" value="${deal.id}" style="display:block;height:30px; width:100px;" name="orderId" />${deal.id!}</td>
        </tr>
        <tr>
            <td class="right-td">金额(人民币/元):</td>
            <td class="left-td"> <input type="hidden" value="${deal.totalPrice}"  style="display:block;height:30px; width:100px;" name="price" />${deal.totalPrice}</td>
        </tr>
    </table>
    </div>
        <div class="pay-submit2">
            <input type="submit"class="btn-effect-blue" value="确认付款" onclick="order.action='${BASE_PATH}/blog/alipay/alipayLogin.htm?orderId=${deal.id!}';order.submit();confirmPaid();"/>
        </div>
         </form>                
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<#include "footer.ftl">
<script type="text/javascript">
 function load(){
     $("#donetion").css("display","none");
     } ; 
      function confirmPaid() {
      $('.btn-effect-blue').attr('disabled','disabled').val('订单处理中').css('background-color','gray');
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
                location.href="${BASE_PATH}/blog/user/info.htm";

            }
        });

    }   

</script>

