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

                        <dl class="one-line2 project-title">
                            <dd class="">我要参与</dd>
                        </dl>

                    </div>

                    <form  method="post" action="${BASE_PATH }/blog/deal/createDeal.json" id="dealForm" onsubmit="noEmptyMoney();">  
                      <div class="pay-way2">
                        <dl class="one-line2 pay-div">
                            <dt class="fs14">订单名称：</dt>
                            <dd style="margin-right:20px;">
                                <ul>

                                    <li >
                                        <input type="hidden" name="orderDescript" value="${orderDescript}"/>${orderDescript}
                                    </li>

                                </ul>
                            </dd>


                        </dl>
                        <dl class="one-line2  pay-div">
                            <dt class="fs14">金额(人民币/元)：</dt>
                            <dd style="margin-right:20px;">
                                <ul>
                                    <li class="alipay select">
                                        ${projectPayoff.price}
                                    </li>

                                </ul>
                            </dd>


                        </dl>
                        <dl class="one-line2  pay-div">
                            <dt class="fs14">数&nbsp;&nbsp;量:&nbsp;&nbsp;</dt>
                            <dd style="margin-right:20px;">
                                <ul>
                                    <li class=" ">
                                        <input type="text"  hidden="hidden"value="${projectPayoff.id}" name="id"/>
                                        <a class="subtract"style="border: 1px solid #a7a6ab;padding: 1px 4px;text-decoration: none" href="javascript:void(0)" onclick="payAgain()">-</a>
                                        <input type="text" value="1" class="qty"  style="width: 30px" name="amount" id="amount" >
                                        <a class="plus" style="border: 1px solid #a7a6ab;padding: 1px 4px;text-decoration: none" href="javascript:void(0)"onclick="payAgain()">+</a>
                                        <label id="amount-error" class="error" for="amount"></label>
                                    </li>

                                </ul>
                            </dd>


                        </dl>
                        <dl class="one-line2  pay-div">
                            <dt class=>付款方式：</dt>
                            <dt class="alipay">
                                <input type="radio" name="payWay" id="pay-way0" value="ZFB"   checked="checked" onchange="payAgain()"><label for="pay-way0" ><span class="" payType="0"></span></label>
                            </dt>
                            <dt class="alipay" style="margin-left:15px">
                                <input type="radio"  name="payWay" id="pay-way1" value="UNP" onchange="payAgain()"><label for="pay-way1" class="alipay " ><span class="span2" payType="1"></span></label>
                            </dt>
                        </dl>
                    </div>
                        <div class="pay-submit2">
                            <input type="submit" class="btn-effect-blue submit" value="确认参与"/>

                            <span style="display:none;color:red;">一次下单不可重复提交，修改订单数目或支付方式，即可再次下单。</span>
                            <div id="errors"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "footer.ftl">

    <script type="text/javascript">
        //禁止用F5键
        document.onkeydown = function (e) {
            var ev = window.event || e;
            var code = ev.keyCode || ev.which;
            if (code == 116) {
                ev.keyCode ? ev.keyCode = 0 : ev.which = 0;
                cancelBubble = true;
                if ( e && e.preventDefault )
                    e.preventDefault();
                else
                    window.event.returnValue = false;
                return false;
            }
        }

        //禁止右键弹出菜单
        document.oncontextmenu=function  ()
        {
            return  false;
        }

        var payWayVal=$('input:radio[name="payWay"]:checked').val();
        var amountNum=$("#amount").val().replace(/(^\s*)|(\s*$)/g,"");//空格替换
        function payAgain(){

            var payWayRel=$('input:radio[name="payWay"]:checked').val();
            var radio_val=$('input:radio[name="payWay"]:checked').val();
            var url;
            if (radio_val=="ZFB"){url="${BASE_PATH}/blog/alipay/createDealAlipay.htm?dealId=";}
            if (radio_val=="UNP"){url="${BASE_PATH}/blog/unionpay/createUnionpay.htm?dealId=";}
            var amountRel=$("#amount").val().replace(/(^\s*)|(\s*$)/g,"");
            // alert(payWayRel+payWayVal+amountRel+amountNum);
            if (payWayRel!=payWayVal||amountRel!=amountNum){
                $(".submit").removeAttr("disabled").css('background-color','#bc192a').next("span").hide();
            }else{  $('.submit').css('background-color','gray').attr("disabled","disabled");
                $('.submit').next("span").show();  }

        }

        $(function(){

            function addElementDiv(obj,msg) {
                var parent = document.getElementById(obj);
                parent.innerHTML = msg;
            }

            var submitDis=$(".submit").is("disabled");
            // alert($(".submit").attr("disabled"));
            if($(".submit").attr("disabled")=="disabled"){
                $('.submit').css('background-color','gray');
                $('.submit').next("span").show();
            }
            else{
                $('.submit').next("span").hide();
            }
            $("#dealForm").validate({
                rules: {
                    amount: {
                        required: true,
                        isNum: true,
                        max:5,
                        isDigits:true,
                        min:1,
                        remote: "${BASE_PATH}/check/payoffCurrentNum.htm?payoffId=${projectPayoff.id}"

                    }
                },
                messages: {
                    amount: {
                        required: "不能为空",
                        isNum: "请输入正整数",
                        max:"最多每个用户限购5份",
                        isDigits:"请输入正整数",
                        min:"请输入大于1的数",
                        remote:"超出最大人数"
                    }
                },
                errorPlacement: function(error, element){

                    error.appendTo(element.parent());
                }
            });

            jQuery.validator.addMethod("isNum", function(value, element) {
                value=value.replace( /(^\s*)|(\s*$)/g,"");//去前后空格，防止手动输入时带空格

                var number = /^[1-9][0-9]*(\.(\d){1,2})?$/;
                return this.optional(element) || (number.test(value));
            }, "请输入正整数");
            jQuery.validator.addMethod("isDigits", function(value, element) {
                value=value.replace( /(^\s*)|(\s*$)/g,"");//去前后空格，防止手动输入时带空格

                var number = /^[0-9]*[1-9][0-9]*$/;
                return this.optional(element) || (number.test(value));
            }, "请输入正整数");

            /*ajax提交*/
            var radio_val=$('input:radio[name="payWay"]:checked').val();
            var url;
            if (radio_val=="ZFB"){url="${BASE_PATH}/blog/alipay/createDealAlipay.htm?dealId=";}
            if (radio_val=="UNP"){url="${BASE_PATH}/blog/unionpay/createUnionpay.htm?dealId=";}
            $('#dealForm').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        //alert(url+ data.msg);
                        location.href = url+ data.msg;
                    } else {
                        addElementDiv("errors",data.msg);
                    }
                }
            });
        })


        <!--禁止空值和不正确数字提交-->
        function noEmptyMoney(){
            var amounteNum=$("#amount-error").text();
           

            if (amounteNum!=""){
                $("#amount").focus();
                return false;
            }
            else{
                $('.submit').val('请等待').attr('disabled','disabled').css('background-color','gray');
            }
        }
        function load(){
            $("#donetion").css("display","none");
        } ;
        <!--数量增减-->
        $(".subtract").click(function(){

            var n = $("#amount").val();
            var number = /^\d+(\.\d+)?$/;
            // alert(number.test(n));
           if(n>5||n<1||!number.test(n))
           {n=5;$("#amount").val(n);}
            else{
                subtract(n);
            }
           
        })
        $(".plus").click(function(){

            var n = $("#amount").val().replace(/\s/g,"");
            var number = /^\d+(\.\d+)?$/;
            // alert(number.test(n));
           if(n>5||n<1||!number.test(n))
           {n=5;$("#amount").val(n);}
            else{
                plus(n);
            }
            
        })
        function plus(n){
            n = parseInt(n);
            n=n+1;
            if (n>5){
                n=5;
                $(".plus").next("label").show().text("最多每个用户限购5份");
            }
            else{$("#amount").val(n);}

        }
        function subtract(n){
            n = parseInt(n);
            if (n>1){
                n=n-1;
                $("#amount").val(n);
            }
            if (n<5){
                $("#amount").val(n);
                $(".plus").next("label").hide();
            }

        }


    </script>
