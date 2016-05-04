<#assign menu="orderManage"> <#assign submenu=""> <#include
        "/manage/head.ftl">
<script src="${BASE_PATH}/static/manage/js/jquery.cookie.js"></script>
<style type="text/css">
    .pagination {
        border-radius: 4px;
        display: inline-block;
        margin: 0;
        padding-left: 0;
    }

    .breadcrumb>li+li:before {
        color: #CCCCCC;
        content: "| ";
        padding: 0 5px;
    }

    .content {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        width: 478px;
        display: block;
    }

    table td {
        width: 50px;
    }
</style>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <form action="${BASE_PATH}/manage/deal/lookDealByOrderId.htm"
                      method="post">
                    <ul class="breadcrumb">
                        <li><a href="javascript:void(0);" onclick="sortBytime()">排序</a></li>
                        <li><a href="javascript:void(0);" onclick="sortByName()">用户名</a>
                        </li>

                        <li><select onchange="statusSelect()" id="selectStatus">
                            <option value="status" selected="selected">订单状态</option>
                            <option value="paid" >已支付</option>
                            <option value="unpaid">未支付</option>
                            <option value="deleted">用户已删除</option>
                            <option value="refunding">退款中</option>
                            <option value="refunded">已退款</option>
                        </select></li>
                        <li><select onchange="moneySelect()" id="selectMoney">
                            <option value="money" selected="selected">金额排序</option>
                            <option value="bigTOSmall">从大到小</option>
                            <option value="smallToBig">从小到大</option>
                            <option value="moreThan5">>&nbsp;5000</option>
                        </select></li>
                        <li><input type="text" name="orderId"
                                   placeholder="请输入查询的订单号"  />
                            <button  type="submit" onclick="return noEmpty()">查询</button></li>
                    </ul>
                </form>
            </div>
        </div>
        <section class="panel">

            <div class="panel-body">
                <div class="adv-table">
                    <div role="grid" class="dataTables_wrapper"
                         id="hidden-table-info_wrapper">
                        <#if (dealList.count!=0)>

                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>订单名称</th>
                                    <th>订单号</th>
                                    <th>数量</th>
                                    <th>总金额（元）</th>
                                    <th>订单生成时间</th>
                                    <th>订单状态</th>
                                    <th>支付方式</th>
                                    <th>付款时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody role="alert" aria-live="polite" aria-relevant="all">


                                <#list dealList.list as orderlist>

                                    <tr class="sendRequest">
                                        <td><a href="javascript:void(0);">${orderlist.username!}</a>
                                        </td>
                                        <td><a href="javascript:void(0);">${orderlist.orderDescript!}</a></td>

                                        <td><a href="javascript:void(0);" class="orderlist-id">${orderlist.id!}</a>
                                        </td>
                                         <td><a href="javascript:void(0);">${orderlist.amount!}</a>
                                        </td>
                                        <td><a href="javascript:void(0);">${orderlist.totalPrice!}</a>
                                        </td>
                                        <td><a href="javascript:void(0);">${orderlist.createTime?string("yyyy-MM-dd
											HH:mm:ss")!}</a></td>
                                        <td><a href="javascript:void(0);"> <#if
                                                (orderlist.orderStatus==0)>未支付<#elseif
                                                (orderlist.orderStatus==1)>支付成功 <#elseif
                                                (orderlist.orderStatus==3)>已退款 <#elseif
                                                (orderlist.orderStatus==4)>退款中 </#if></a></td>
                                        <td class="paymentId"><#if orderlist.paymentId==1>支付宝<#elseif
                                                (orderlist.paymentId==2)>银联</#if></td>
                                        <td>${(orderlist.payTime?string("yyyy-MM-dd HH:mm:ss"))!}
	                                    <td><#if orderlist.isShow==1>
	                                    		<#if orderlist.orderStatus==1> 
		                                        	<#if orderlist.paymentId==1>
		                                            <a href="${BASE_PATH }/manage/alipay/refund.htm?orderId=${orderlist.id}" target="_blank"> 退款 </a>
		
		                                            <#elseif  orderlist.paymentId==2>
		                                            <a class="refund" payType="${orderlist.paymentId!}" orderId="${orderlist.id!}" href="javascript:void(0);" title="退款"> 退款 </a>
		                                        	</#if>
		                                        </#if>
	                                        <#elseif orderlist.isShow==0>
	                                       	 <a class="delete" orderId="${orderlist.id!}" href="javascript:void(0);" title="隐藏"> 隐藏 </a>
	                                       	 <#if orderlist.orderStatus==1> 
		                                        	<#if orderlist.paymentId==1>
		                                            <a href="${BASE_PATH }/manage/alipay/refund.htm?orderId=${orderlist.id}" target="_blank"> 退款 </a>
		
		                                            <#elseif  orderlist.paymentId==2>
		                                            <a class="refund" payType="${orderlist.paymentId!}" orderId="${orderlist.id!}" href="javascript:void(0);" title="退款"> 退款 </a>
		                                        	</#if>
		                                        </#if>
                                       	    </#if>
                                       	    
                                       	    </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                            <div style="height: 30px;margin-left:30%;">
                                <div class="pagination">${dealList.pageNumHtml}</div>

                            </div>

                            <#else>
                                <div align="center" style="padding:40px">对不起,结果为空！</div>
                        </#if>
                    </div>
        </section>
        </div>

    </section>

    <!-- page end-->
</section>
</section>
<!--main content end-->

<!-- page end-->
</section>
</section>
<!--main content end-->
<
<script type="text/javascript">
    <!--禁止空值搜索-->
    function noEmpty(){

        if ($("input[name=orderId]").val()==''){

            $("input[name=orderId]").focus();
            return false;
        }
    }
    function sortBytime(){
        $.cookie("selectMoney", "money", {
            path: "/", expires: 1
        });
        $.cookie("selectStatus", "status", {
            path: "/", expires: 1
        })
        window.location.href="${BASE_PATH}/manage/deal/lookDeal.htm";
    }
    function sortByName(){
        $.cookie("selectMoney", "money", {
            path: "/", expires: 1
        });
        $.cookie("selectStatus", "status", {
            path: "/", expires: 1
        })
        window.location.href="${BASE_PATH}/manage/deal/lookDealByUser.htm";
    }
    <!--金额选项对应 -->
    function moneySelect(){
        $.cookie("selectMoney", $("#selectMoney").val(), {
            path: "/", expires: 1
        });
        $.cookie("selectStatus", "status", {
            path: "/", expires: 1
        })
//        alert("状态改变后设好的值"+$("#selectMoney").val()+$("#selectStatus").val());
        if($("#selectMoney").find("option:selected").val()=="bigTOSmall"){

            window.location.href="${BASE_PATH}/manage/deal/lookDealByMoneyDesc.htm"


        }
        else if($("#selectMoney").find("option:selected").val()=="smallToBig"){

            window.location.href="${BASE_PATH}/manage/deal/lookDealByMoneyAsc.htm";


        }
        else if($("#selectMoney").find("option:selected").val()=="moreThan5"){

            window.location.href="${BASE_PATH}/manage/deal/lookDealByMoneyFive.htm";

        }

    }
    <!--支付状态选项对应 -->
    function statusSelect(){
        $.cookie("selectStatus", $("#selectStatus").val(), {
            path: "/", expires: 1
        })
        $.cookie("selectMoney", "money", {
            path: "/", expires: 1
        });
//        alert("状态改变后设好的值"+$("#selectMoney").val()+$("#selectStatus").val());

        if($("#selectStatus").find("option:selected").val()=="paid"){

            window.location.href="${BASE_PATH}/manage/deal/lookDealSuccess.htm";


        }
        else if($("#selectStatus").find("option:selected").val()=="unpaid"){

            window.location.href="${BASE_PATH}/manage/deal/lookDealFail.htm";


        }
        else if($("#selectStatus").find("option:selected").val()=="deleted"){
            window.location.href="${BASE_PATH}/manage/deal/lookDealDelete.htm";

        }else if($("#selectStatus").find("option:selected").val()=="refunding"){
            window.location.href="${BASE_PATH}/manage/deal/lookDealRefund.htm";

        }else if($("#selectStatus").find("option:selected").val()=="refunded"){
            window.location.href="${BASE_PATH}/manage/deal/lookDealRefundEd.htm";

        }

    }
    $(function() {
        <!--select金额大小的cookie-->

        $("#selectMoney").val($.cookie("selectMoney"));

        <!--select支付状态的cookie-->
        $("#selectStatus").val($.cookie("selectStatus"));
//        alert("从cookie中取好值，重新加载页面"+$("#selectMoney").val()+$("#selectStatus").val());
        $(".sendRequest").each(function(){
            var orderlistId=$(this).find(".orderlist-id").text();

            var paymentId=$(this).find(".paymentId").text();
            var url;

            if(paymentId=="银联"){

                url='${BASE_PATH}/manage/unionpay/query.htm';

            }
            if(paymentId=="支付宝"){

                url='${BASE_PATH}/manage/alipay/findAlipay.htm';

            }


            $.ajax({
                url: url,
                data: {orderId:orderlistId},
                type:"get",
                success: function(result){
                } ,
                error:function(xhr){
                    alert("错误提示： " + xhr.status + " " + xhr.statusText);
                }
            });
            <!--location.href='${BASE_PATH}/manage/unionpay/query.htm?orderId='+orderlistId;-->
        });
        $('.delete').click(function () {
        	var orderId = $(this).attr('orderId');
        	
        	bootbox.dialog({
                message: "是否隐藏订单"+orderId,
                title: "提示",
                buttons: {
                    "delete": {
                        label: "是",
                        className: "btn-danger",
                        callback: function () {
                            $.post("${BASE_PATH }/manage/deal/delete.json",
                                    {"orderId": orderId},
                                    function (data) {
                                        if (data.result) {
                                            
                                                window.location.reload();
                                        }
                                        else {
                                            bootbox.alert(data.msg, function () {
                                            });
                                        }
                                    },
                                    "json");
                        }
                    },
                    "cancel": {
                        label: "否",
                        className: "btn-default",
                        callback: function () {
                        }
                    }
                }
            });
        });

        $('.refund').click(function () {
            var orderId = $(this).attr('orderId');
            var payType = $(this).attr('payType');
            //alert(payType);
            /*  if(payType == 1) {
             var url = "${BASE_PATH }/manage/alipay/refund.htm";
             $.ajax({type:"post",
             url:url,
             data:{orderId: orderId},
             callback:function(data){
             alert(data.result);}
             });
             }*/

            if(payType == 2){
                var url = "${BASE_PATH }/manage/unionpay/refund.json";
                bootbox.dialog({
                    message: "是否同意订单"+orderId+"退款",
                    title: "提示",
                    buttons: {
                        "delete": {
                            label: "是",
                            className: "btn-danger",
                            callback: function () {
                                $.post(url,
                                        {"orderId": orderId},
                                        function (data) {
                                            if (data.result) {
                                                bootbox.alert("已向银行申请退款", function () {
                                                    window.location.reload();
                                                });
                                            }
                                            else {
                                                bootbox.alert(data.msg, function () {
                                                });
                                            }
                                        },
                                        "json");
                            }
                        },
                        "cancel": {
                            label: "否",
                            className: "btn-default",
                            callback: function () {
                            }
                        }
                    }
                });
            }


        });
    });
</script>

<#include "/manage/foot.ftl">
