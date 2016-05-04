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
                        修改用户资料
                    </header>
                    <div class="panel-body">
                        <form id="update_user_form" method="post" class="form-horizontal" autocomplete="off"
                              action="${BASE_PATH}/manage/user/update.json">
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
                                        <input type="text" class="form-control" name="username" value="${user.username}"
                                               placeholder="用户名" id="username"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">昵称</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="nickname"
                                               value="${user.nickname!}"
                                               placeholder="昵称" id="nickname"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">姓名</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name"
                                               value="${user.name!}"
                                               placeholder="姓名" id="name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">身份证</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="idcard"
                                          	placeholder="身份证" id="idcard" value="${user.idcard!}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">手机号码</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="phone"
                                          	placeholder="手机号码" id="phone" value="${user.phone!}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">所在单位</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="company"
                                          	placeholder="所在单位" id="company" value="${user.company!}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="email"
                                          	placeholder="邮箱" id="email" value="${user.email!}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">联系地址</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="address"
                                          	placeholder="联系地址" id="address" value="${user.address!}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">称呼</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="appellation"
                                          	placeholder="称呼" id="appellation" value="${user.appellation!}"/>
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
			username : {
				required : true,
				minlength: 6,
                maxlength: 18,
            	isNumOrLetter: true
			},
			password :{
				required : true,
				minlength: 6,
                maxlength: 16,
                isNumOrLetter:  true
			},
			nickname : {
				required : true,
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
			username : {
				required : "请输入用户名",
				minlength: "用户名不能小于6个字符",
                maxlength: "用户名不能大于18个字符",
				remote: "用户名已存在"
			},
			password : {
				required : "请输入密码",
				minlength: "密码不能小于6个字符",
                maxlength: "密码不能大于16个字符"
			},
			nickname : {
				required : "请输入昵称",
				remote: "该昵称已被占用"
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
      	  error.appendTo(element.parent().parent());        
        }
	});
</script>
<#include "../foot.ftl">