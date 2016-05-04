<#assign menu="user">
<#assign submenu="update_user">
<#include "../head.ftl">
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
                    <header class="panel-heading">
                        修改用户密码
                    </header>
                    <div class="panel-body">
                        <form id="update_user_form" method="post" class="form-horizontal" autocomplete="off"
                              action="${BASE_PATH}/manage/user/updatePwd.json">
                            <fieldset>
                                <div class="form-group" id="update_userId">
                                    <label class="col-sm-2 col-sm-2 control-label">用户Id</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="userId" value="${user.userId}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">用户名</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" value="${user.username}" disabled="disabled" name="username"/>
                                    </div>
                                </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">新密码</label>
                                      <div class="col-sm-10">
                                          <input type="password" class="form-control" name="new_password"
                                          	placeholder="新密码" id="new_password" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">确认密码</label>
                                      <div class="col-sm-10">
                                          <input type="password" class="form-control" name="re_password"
                                          	placeholder="确认密码" id="re_password" value=""/>
                                      </div>
                                  </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label"></label>
                                    <button class="btn btn-danger" type="submit">修改</button>
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
    $(function () {
        $("#update_userId").hide();
        $('#update_user_form').ajaxForm({
            dataType: 'json',
            success: function (data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function () {
                        window.location.reload();
                    });
                } else {
                	bootbox.alert(data.msg, function () {
                        window.location.reload();
                    });
                }
            }
        });
    });
    $("#update_user_form").validate({
		rules : {
			new_password :{
				required : true,
				minlength: 6,
                maxlength: 16,
                isNumOrLetter:  true
			},
			re_password :{
				equalTo : "#new_password"
			}
			
		},
		messages : {
			new_password : {
				required : "请输入密码",
				minlength: "密码不能小于6个字符",
                maxlength: "密码不能大于16个字符"
			},
			re_password: {
				equalTo:"两次密码输入不一致"
			}
			
		},
		errorPlacement: function(error, element){
      	  error.appendTo(element.parent().parent());        
        }
	});
</script>
<#include "../foot.ftl">