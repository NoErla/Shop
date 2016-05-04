<#assign menu="user_list">
<#assign submenu="user_list">
<#include "../head.ftl">
<style type="text/css">
    .pagination {
        border-radius: 4px;
        display: inline-block;
        margin: 0;
        padding-left: 0;
    }
</style>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <!--breadcrumbs start -->
                <ul class="breadcrumb">
                    <li>
                        <a href="http://localhost:8080/byvision/manage/folder/page.htm?folderId=0"><i
                                class="icon-home"></i>用户管理</a>
                    </li>
                </ul>
                <!--breadcrumbs end -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading"> 添加用户</header>
                    <div class="panel-body">
                        <form id="add_user_form" method="post" class="form-horizontal" autocomplete="off"
                              action="${BASE_PATH}/manage/user/addNew.json">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-3 col-sm-3 control-label">名称</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="username"
                                               placeholder="用户名称" id="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 col-sm-3 control-label">密码</label>

                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" name="password"
                                               placeholder="用户密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 col-sm-3 control-label"></label>

                                    <div class="col-sm-9">
                                        <button class="btn btn-danger" type="submit">增加</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </section>
            </div>
            <div class="col-lg-8">
                <section class="panel">
                    <header class="panel-heading"> 所有用户列表</header>
                    <div class="panel-body">
                        <div class="adv-table">
                            <div role="grid" class="dataTables_wrapper"
                                 id="hidden-table-info_wrapper">
                                <table class="table table-striped table-advance table-hover">
                                    <thead>
                                    <tr>
                                        <th>用户</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                                    <#--<#if pageVo.list?has_content>-->
                                    <#if pageVo.list??>
                                        <#list pageVo.list as e>
                                        <tr class="gradeA odd">
                                            <td>${e.username}</td>
                                            <td>
                                                <!-- Icons -->
                                                <a href="javascript:void(0);" userId="${e.userId}" title="删除"
                                                   class="js_delete_user">
                                                    删除
                                                </a>|
                                                <a href="${BASE_PATH}/manage/userFolder/manage.htm?userId=${e.userId}"
                                                   title="权限">
                                                    权限
                                                </a>
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                                <div style="height: 30px;">
                                    <div class="pagination">${pageVo.pageNumHtml}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- page end-->
    </section>
</section>
<script type="text/javascript">
    $(function () {
        $('#add_user_form').ajaxForm({
            dataType: 'json',
            success: function (data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function () {
                        window.location.reload();
                    });
                    window.location.reload();
                } else {
                    showErrors($('#add_user_form'), data.errors);
                }
            }
        });

        $('.js_delete_user').click(function () {
            var userId = $(this).attr('userId');
            bootbox.dialog({
                message: "是否" + $(this).attr('title') + "用户",
                title: "提示",
                buttons: {
                    "delete": {
                        label: "删除",
                        className: "btn-success",
                        callback: function () {
                            $.post("${BASE_PATH}/manage/user/delete.json", {
                                        "userId": userId
                                    },
                                    function (data) {
                                        if (data.result) {
                                            bootbox.alert("删除成功",
                                                    function () {
                                                        window.location.reload();
                                                    });
                                        } else {
                                            bootbox.alert(data.msg,
                                                    function () {
                                                    });
                                        }
                                    },
                                    "json");
                        }
                    },
                    "cancel": {
                        label: "取消",
                        className: "btn-primary",
                        callback: function () {
                        }
                    }
                }
            });
        });
    });
</script>
<#include "../foot.ftl">