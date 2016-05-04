<#assign menu="update_password">
<#assign submenu="update_admin">
<#include "../head.ftl">
<script src="/static/manage/js/jquery.validate.min.js"></script>
<script src="${BASE_PATH}/static/common/js/additional-methods.js"></script>
<style type="text/css">
</style>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading"> 修改管理员资料</header>
                    <div class="panel-body">
                        <form id="update_admin_form" method="post" class="form-horizontal"
                              autocomplete="off" action="${BASE_PATH}/manage/admin/update.json">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">用户名</label>

                                    <div class="col-sm-10">
                                    ${admin.name}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">密码</label>

                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="password"
                                               value="" placeholder="密码" id="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">确认密码</label>

                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="re_password"
                                               value="" placeholder="确认密码" id="re_password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label"></label>

                                    <div class="col-sm-10">
                                        <button class="btn btn-danger" type="submit">修改</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>

                        
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<script type="text/javascript">
    $("#update_admin_form").validate({
        rules: {
        	password: {
                required: true,
                minlength: 6,
                maxlength: 16,
                isNumOrLetter:  true
            },
            re_password: {
                equalTo : "#password"
            },
        },
        messages: {
        	password: {
        		required : "请输入密码",
				minlength: "密码不能小于6个字符",
                maxlength: "密码不能大于16个字符"
            },
            re_password: {
                equalTo : "需与密码一致"
            },
        }
    });
    function ajaxSubmit(formName) {
        $(formName).validate();
        $(formName).ajaxForm({
            dataType: 'json',
            success: function (data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function () {
                        window.location.reload();
                    });
                } else {
                    showErrors($(formName), data.errors);
                }
            }
        });
    }
    $(function () {
        ajaxSubmit('#update_admin_form');
        ajaxSubmit('#update_user_form');
    });
</script>
<#include "../foot.ftl">
