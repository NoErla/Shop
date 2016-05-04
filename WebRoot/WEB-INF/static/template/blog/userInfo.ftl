<#include "head.ftl">
<script src="${BASE_PATH}/static/common/js/additional-methods.js"></script>

<div class="clear"></div>
<div class="p_subnav"></div>
<div class="clear"></div>
<div class="p_container mauto"  style="width: 1180px;">


<div class="clear"></div>
<div class="p_left">
    <div class="sidebar" id="com_sort_products">
        <div class="sortnavt">
            <h3>栏目导航</h3>
        </div>
        <div class="sidebar_l">
            <ul class="sortnavul">
                <li class="sortnavli"><a href="#info" data-toggle="tab"
                                         class="sortnava">查看个人信息</a></li>
                <li class="sortnavli"><a href="#updateInfo" data-toggle="tab"
                                         class="sortnava">修改个人信息</a></li>
                <li class="sortnavli"><a href="#updatePassword"
                                         data-toggle="tab" class="sortnava">修改密码</a></li>
                <li class="sortnavli"><a href="#confrimOrder"
                                         data-toggle="tab" class="sortnava">查看订单状态</a></li>
            </ul>
        </div>
    </div>

    <div class="clear"></div>

</div>

<div class="p_right tab-content" >

<div class="tab-pane  " id="info">
    <div class="p_path">
        当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a
            id="position_nowtitle">查看个人信息</a>
    </div>
    <div class="p_rb">
        <div class="p_rt" id="com_pmodule_news_list">个人信息</div>
        <div class="p_content">
            <div id="com_thenm_list" class="content">
                <div class="form-horizontal">
                    <fieldset style="width:620px;">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="username"
                                       value="${SESSION_USER.username }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">昵称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nickname"
                                       value="${SESSION_USER.nickname }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.name }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.idcard!}" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.phone! }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在单位</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.company! }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.email! }" disabled="true ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       value="${SESSION_USER.address! }" disabled="true ">
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tab-pane" id="updateInfo">
    <div class="p_right">
        <div class="p_path">
            当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a
                id="position_nowtitle">修改个人信息</a>
        </div>
        <div class="p_rb">
            <div class="p_rt" id="com_pmodule_news_list">修改个人信息</div>
            <div class="p_content">
                <div id="com_thenm_list" class="content">

                    <form id="update_user_form" method="post" class="form-horizontal"
                          action="${BASE_PATH}/blog/user/updateInfo.json">
                        <fieldset style="width:620px;">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">昵称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="nickname"
                                           value="${SESSION_USER.nickname }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name"
                                           value="${SESSION_USER.name }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">身份证</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="idcard"
                                           value="${SESSION_USER.idcard! }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone"
                                           value="${SESSION_USER.phone! }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所在单位</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="company"
                                           value="${SESSION_USER.company! }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="email"
                                           value="${SESSION_USER.email! }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address"
                                           value="${SESSION_USER.address! }">
                                </div>
                            </div>
                            <div class="form-group" style="margin: auto">
                                <button class="btn btn-danger update" type="submit">修改</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<div class="tab-pane" id="updatePassword">
    <div class="p_right">
        <div class="p_path">
            当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a
                id="position_nowtitle">修改密码</a>
        </div>
        <div class="p_rb">
            <div class="p_rt" id="com_pmodule_news_list">修改密码</div>
            <div class="p_content">
                <div id="com_thenm_list" class="content">

                    <form id="update_password_form" method="post" class="form-horizontal"
                          action="${BASE_PATH}/blog/user/updatePwd.json">
                        <fieldset style="width:620px;">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control"
                                           name="old_password" id="old_password" value=""
                                           placeholder="原密码" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-10">
                                    <input type="password" id="new_password" class="form-control"
                                           name="new_password" value=""
                                           placeholder="新密码(6到18位由英文和数字组成)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control"
                                           name="re_password" id="re_password" value=""
                                           placeholder="请再输入一次">
                                </div>
                            </div>
                            <div class="form-group" style="margin: auto">
                                <button class="btn btn-danger update" type="submit">修改</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane in active" id="confrimOrder">
    <div class=""style="float:right;width:926px;" >
        <div class="p_path">
            当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a
                >订单信息</a>
        </div>
        <div class="p_rb" style="padding:3px;width:800px;">

            <div class="p_content">
                <div  class="content">

                    <p>订单展示</p>
                    <div class="confirmTable" algin="center">
                        <div class="col1">
                            <span><b>订单名称</b></span>
                        </div>
                        <div class="col1">
                            <span><b>订单号</b></span>
                        </div>
                        <div class="col1">
                            <span><b>支付方式</b></span>
                        </div>
                        <div class="col-order-time">
                            <span><b>订单生成时间</b></span>
                        </div>
                        <div class="col1">
                            <span><b>订单状态</b></span>
                        </div>
                        <div class="col1">
                            <span><b>总金额/元</b></span>
                        </div>
                        <div class="col1">
                            <span><b>数量</b></span>
                        </div>
                        <div class="col1">
                            <span><b>付款时间</b></span>
                        </div>
                        <div class="collast1">
                            <span><b>操作</b></span>
                        </div>
                        <!--从数据库中取值-->
                        <#list listDeal as e>
                            <div class="col">
                                <input type="hidden" value="${e.orderDescript!}" style="display:block;height:30px; width:100px;"  />${e.orderDescript!}
                            </div>
                            <div class="col sendRequest" >
                                <input type="hidden"  class="orderlist-id" value="${e.id!}" style="display:block;height:30px; width:100px;"  /><span>${e.id!}</span>
                            </div>
                            <div class="col paymentId">
                                <input type="hidden"  value="${e.paymentId!}" style="display:block;height:30px; width:100px;"  />
                                <span><#if e.paymentId==1>支付宝<#elseif (e.paymentId==2)>银联</#if></span>
                            </div>

                            <div class="col">
                                <input type="hidden" value="${e.createTime?string("yyyy-MM-dd HH:mm:ss")}" style="display:block;height:30px; width:100px;"  />${e.createTime?string("yyyy-MM-dd HH:mm:ss")}
                            </div>

                            <div class="col status4">
                                <input type="hidden"  value="${e.orderStatus!}" style="display:block;height:30px; width:100px;"  />
                                <#if (e.orderStatus==0)>未支付
                                    <#elseif (e.orderStatus==1)>支付成功
                                        <#elseif (e.orderStatus==3)>已退款
                                            <#elseif (e.orderStatus==4)>退款中
                                </#if>
                            </div>
                            <div class="col">
                                <input type="hidden" value="${e.totalPrice!}" style="display:block;height:30px; width:100px;" />${e.totalPrice!}
                            </div>
                            <div class="col">
                                <input type="hidden" value="${e.amount!}" style="display:block;height:30px; width:100px;" />${e.amount!}
                            </div>
                            <div class="col">
                                <input type="hidden" value="${(e.payTime?string("yyyy-MM-dd HH:mm:ss"))!}" style="display:block;height:30px; width:100px;"  />${(e.payTime?string("yyyy-MM-dd HH:mm:ss"))!}
                            </div>

                            <div class="collast" >
                                <#if e.paymentId==1>
                                    <#if e.orderStatus==0>
                                        <div ><a class="but but-red" href="${BASE_PATH }/blog/alipay/alipayOldOrder.htm?id=${e.id!}" style="background-color: #d43f3a;" align="center" >支付</a></div>
                                        <div><a class="but but-gray delete" id="${e.id!}" title="删除" href="javascript:void(0);"  style="background-color: lightgray" align="center" onclick="cofrimCancle()" >删除订单</a></div>
                                    </#if>
                                    <#elseif e.paymentId==2>
                                        <#if e.orderStatus==0>

                                            <div ><a class="but but-red" href="${BASE_PATH }/blog/unionpay/createUnionpay.htm?dealId=${e.id!}" style="background-color: #d43f3a;" align="center" >支付</a></div>


                                            <div><a class="but but-gray delete" id="${e.id!}" title="删除" href="javascript:void(0);"  style="background-color: lightgray" align="center" onclick="cofrimCancle()" >删除订单</a></div>
                                        </#if>
                                </#if>
                            </div>

                        </#list>
                    </div>
                    <div>如果订单状态未更新，请刷新页面！</div>

                </div>
            </div>
        </div>
    </div>
</div>

</div>

<div class="clear"></div>
</div>
<div class="clear"></div>

<div class="pfooter">
    <div class="pfooter_nav" id="com_othermenu"></div>
    <div class="pcopyright" id="com_copyright">copyright &copy; 筹引力
        all right reversed.</div>

    <div class="clear"></div>
</div>

<script type="text/javascript">
//修改导航
function load() {
    $("ul#navctive li:eq(0) a").removeClass("nava").addClass("navactive");

}

$(function() {

    if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
        $('[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();
    };
    function placeholderSupport() {
        return 'placeholder' in document.createElement('input');
    }

    $(".sendRequest").each(function(){
        var status4= $(this).next().next().next().find("input").val();
       
        if (status4==0||status4==4) {
            var paymentId = $(this).next().find("span").text();

            var url;

            if (paymentId == "银联") {

                url = '${BASE_PATH}/blog/unionpay/query.htm';

            }
            if (paymentId == "支付宝") {

                url = '${BASE_PATH}/blog/alipay/findAlipay.htm';

            }

            var orderlistId=$(this).find(".orderlist-id").val();
            $.ajax({
                url: url,
                data: {orderId:orderlistId},
                type:"get",
                success: function(result){

                } ,
                error:function(xhr){
                }
            });
        }
    });


    $('#update_user_form').ajaxForm({
        dataType : 'json',
        success : function(data) {
            if (data.result) {
                bootbox.alert("保存成功，将刷新页面", function() {
                    window.location.reload();
                });

            } else {
                bootbox.alert(data.msg, function() {
                    window.location.reload();
                });
            }
        }
    });
    $('#update_password_form').ajaxForm({
        dataType : 'json',
        success : function(data) {
            if (data.result) {
                bootbox.alert("保存成功，将刷新页面", function() {
                    window.location.reload();
                });

            } else {
                bootbox.alert(data.msg, function() {
                    window.location.reload();
                });
            }
        }
    });

    $('.delete').click(function () {
        var id = $(this).attr('id');
        bootbox.dialog({
            message: "是否" + $(this).attr('title') + "订单",
            title: "提示",
            buttons: {
                "delete": {
                    label: "删除",
                    className: "btn-danger",
                    callback: function () {
                        $.post("${BASE_PATH }/blog/deal/cancelDeal.json",
                                {"id": id},
                                function (data) {
                                    if (data.result) { window.location.reload();
                                    }
                                },
                                "json");
                    }
                },
                "cancel": {
                    label: "取消",
                    className: "btn-default",
                    callback: function () {
                    }
                }
            }
        });
    });

    $('.refund').click(function () {
        var id = $(this).attr('id');
        bootbox.dialog({
            message: "是否确认退款？",
            title: "提示",
            buttons: {
                "delete": {
                    label: "确认",
                    className: "btn-danger",
                    callback: function () {
                        $.post("${BASE_PATH }/blog/deal/refund.json",
                                {"id": id},
                                function (data) {
                                    if (data.result) { window.location.reload();
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
                    label: "取消",
                    className: "btn-default",
                    callback: function () {
                    }
                }
            }
        });
    });
});
$("#update_user_form").validate({
    rules : {
        nickname : {
            required : true,
            isNumOrLetterOrChinese : true
        },
        name: {
            required: true
        },
        idcard: {
            isIdcard: true
        },
        phone: {
            isPhone: true
        },
        email: {
            email: true
        },
        company: {
            maxlength: 40
        },
        address: {
            maxlength: 40
        },
    },
    messages : {
        nickname : {
            required : "请输入昵称"
        },
        name: {
            required: "请输入姓名"
        },
        email: {
            email: "请输入正确格式的电子邮箱"
        },
        company: {
            maxlength: "所在单位最大40字符"
        },
        address: {
            maxlength: "联系地址最大40字符"
        },
    },
    errorPlacement: function(error, element){
        error.appendTo(element.parent());
    }
});

$("#update_password_form").validate({
    rules : {
        old_password : {
            required : true,
            minlength: 6,
            maxlength: 16,
            isNumOrLetter: true
        },
        new_password: {
            required: true,
            minlength: 6,
            maxlength: 16,
            isNumOrLetter: true
        },
        re_password: {
            equalTo: "#new_password"
        }
    },
    messages : {
        old_password : {
            required : "请输入旧密码",
            minlength: "密码不能小于6个字符",
            maxlength: "密码不能大于16个字符"
        },
        new_password: {
            required: "请输入新密码",
            minlength: "密码不能小于6个字符",
            maxlength: "密码不能大于16个字符"
        },
        re_password: {
            equalTo:"两次密码输入不一致"
        }
    },
    errorPlacement: function(error, element){
        error.appendTo(element.parent());
    }
});

function addElementDiv(obj,msg) {
    var parent = document.getElementById(obj);
    parent.innerHTML = msg;
}

</script>

<div class="clear"></div>

</body>
</html>