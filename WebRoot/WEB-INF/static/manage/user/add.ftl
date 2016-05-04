<#assign menu="user">
<#assign submenu="add_user">
<#include "../head.ftl">
<script src="${BASE_PATH}/static/common/js/additional-methods.js"></script>
<style type="text/css">
.m-bot15 {
    margin-bottom: 5px;
}
.form-control {
    border: 1px solid #E2E2E4;
    box-shadow: none;
    color: #C2C2C2;
}
.input-lg {
    border-radius: 6px;
    font-size: 15px;
    height: 40px;
    line-height: 1.33;
    padding: 9px 15px；
}

</style>
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            	 添加用户
                          </header>
                          <div class="panel-body">
                              <form id="add_user_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/user/addNew.json">
                              	<fieldset>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">用户名称</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="username"
                                          	placeholder="用户名" id="username" vaule=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">用户密码</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="password"
                                          	placeholder="用户密码" id="password" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">用户昵称</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="nickname"
                                          	placeholder="用户昵称" id="nickname" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">姓名</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="name"
                                          	placeholder="姓名" id="name" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">身份证</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="idcard"
                                          	placeholder="身份证" id="idcard" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">手机号码</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="phone"
                                          	placeholder="手机号码" id="phone" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">所在单位</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="company"
                                          	placeholder="所在单位" id="company" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="email"
                                          	placeholder="邮箱" id="email" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">联系地址</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="address"
                                          	placeholder="联系地址" id="address" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">称呼</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="appellation"
                                          	placeholder="称呼" id="appellation" value=""/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                  	<label class="col-sm-2 col-sm-2 control-label"></label>
                                      <button class="btn btn-danger" type="submit">增加</button>
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
	$(function() {
		
		$("#add_user_form").ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					bootbox.alert(data.msg);
				}
			}
		}); 
		
	});	
		$("#add_user_form").validate({
			rules : {
				username : {
					required : true,
					remote: "${BASE_PATH}/check/username.htm",
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
					remote: "${BASE_PATH}/check/nickname.htm"
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