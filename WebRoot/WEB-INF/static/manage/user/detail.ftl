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
                        用户详细资料
                    </header>
                    <div class="panel-body">
                        <div  class="form-horizontal">
                            <fieldset>
                                <div class="form-group" id="update_userId">
                                    <label class="col-sm-2 col-sm-2 control-label">用户Id</label>

                                    <div class="col-sm-10">
                                        ${user.userId}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">用户名</label>

                                    <div class="col-sm-10">
                                        ${user.username}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">昵称</label>

                                    <div class="col-sm-10">
                                        ${user.nickname!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">姓名</label>

                                    <div class="col-sm-10">
                                       ${user.name!}
                                    </div>
                                </div>
                                <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">身份证</label>
                                      <div class="col-sm-10">
                                          ${user.idcard! }
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">手机号码</label>
                                      <div class="col-sm-10">
                                          ${user.phone! }
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">所在单位</label>
                                      <div class="col-sm-10">
                                          ${user.company! }
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
                                      <div class="col-sm-10">
                                          ${user.email! }
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">联系地址</label>
                                      <div class="col-sm-10">
                                          ${user.address! }
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">称呼</label>
                                      <div class="col-sm-10">
                                      	  ${user.appellation! }
                                      </div>
                                  </div>
                            </fieldset>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<#include "../foot.ftl">