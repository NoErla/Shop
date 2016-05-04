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
                               <dd class="">确认参与信息</dd>
                           </dl>
                           
                        </div>
                        
						<form action="" method="" id=""  onsubmit="$(this).val('请等待').attr('disabled','disabled').css('background-color','gray');">

    <div class="pay-way2">
    <dl  class="one-line2 pay-div">
        <dt class="fs14">付款号：</dt>
        <dd style="margin-right:20px;">
            <ul>

                <li class="alipay select">
                    <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                </li>

            </ul>
        </dd>
        </dl>
        <dl  class="one-line2 pay-div">
        <dt class="fs14">用户名：</dt>
        <dd style="margin-right:20px;">
            <ul>

                <li class="alipay select">
                    <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                </li>

            </ul>
        </dd>
			</dl>
       		 <dl  class="one-line2 pay-div">
            <dt class="fs14">金额：</dt>
            <dd style="margin-right:20px;">
                <ul>

                    <li class="alipay select">
                        <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                    </li>

                </ul>
            </dd>
            </dl>
        <dl class="one-line2 pay-div">
            <dt class="fs14">创建时间：</dt>
            <dd style="margin-right:20px;">
                <ul>

                    <li class="alipay select">
                        <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                    </li>

                </ul>
            </dd>
            </dl>
        <dl  class="one-line2 pay-div">
            <dt class="fs14">支付时间：</dt>
            <dd style="margin-right:20px;">
                <ul>

                    <li class="alipay select">
                        <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                    </li>

                </ul>
            </dd>
            </dl>
        <dl  class="one-line2 pay-div">
            <dt class="fs14">订单状态：</dt>
            <dd style="margin-right:20px;">
                <ul>

                    <li class="alipay select">
                        <input type="text"  style="display:block;height:30px; width:100px;" name="price" id="price"/>
                    </li>

                </ul>
            </dd>
            </dl>
        </div>

        <div class="pay-submit2">
            <input type="submit" class="btn-effect-blue" value="确认付款">
            <input type="button" class="btn-effect-blue" value="取消付款">
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
           $(function(){
              $("#deal").validate({
               rules: {
                   price: {
                       required: true,
                       isNum: true
                       
                   }
               },
               messages: {

                   price: {
                       required: "不能为空",
                       
                   }
               },
               errorPlacement: function(error, element){
                   error.appendTo(element.parent().parent());
               }
           });
           })

           jQuery.validator.addMethod("isNum", function(value, element) {
               var chinese = /^[0-9]*[1-9][0-9]*$/;
               return this.optional(element) || (chinese.test(value));
           }, "必须输入非负数字");

     function load(){
     $("#donetion").css("display","none");
     } ;
      
  
</script>
