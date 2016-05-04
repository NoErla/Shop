<#include "head.ftl">
<style type="text/css">
    ul.level li {
        display: inline;
        float: right;
        margin-left: 20px;
        list-style-type: none;
    }
    .h5 {
        padding-top: 10px;
    }
</style>

<div class="clear"></div>
<div class="p_subnav"></div>
<div class="clear"></div>
<div class="p_container mauto " style="width: 1180px">

<div class="clear"></div>
<div class="p_left">
    <div class="sidebar" id="com_sort_products">
        <div class="sortnavt">
            <h3>栏目导航</h3>
        </div>
        <div class="sidebar_l">
            <ul class="sortnavul nav">
                <@shishuo_folder_list_tag folderId= 1> <#list tag_folder_list as
                    tag_folder>
                <li class="line"></li>
                <li class="sortnavli"><a
                        href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>"
                        style="padding: 0"
                        class="sortnava <#if tag_folder.folderId==g_folderId>active</#if>">${tag_folder.name}</a>
                </li> </#list> </@shishuo_folder_list_tag>
            </ul>
        </div>
    </div>

    <div class="clear"></div>

</div>

<div class=" tab-content">
    <!--分类捐赠栏-->

    <div class="p_right1">
        <div class="p_pro">

            <label>
                <div>当前金额(元)</div>
                <span >${project.currentMoney!}</span>
            </label>
            <div class="line" style="display: inline-block;font-size: 300%">/</div>
            <label>
                <div >目标金额(元)</div>
                <span >${project.targetMoney!}</span>
            </label>
            <div >
                <div class="progress progress-striped" >
                    <div class="progress-bar progress-bar-success" role="progressbar"
                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                         style="width: 0%;"><span id="precent"></span>
                    </div>
                </div>
                <h5 class="h5">支持人数：${project.participantsNum}</h5>
                
                <h5 class="h5">开始时间：${(project.beginTime?string("yyyy-MM-dd"))!}</h5><h5 class="h5">结束时间：${(project.endTime?string("yyyy-MM-dd "))!}</h5>
				<h5 class="h5" id="lastDay">剩余天数：</h5>
            </div>
        </div>

        <#list projectPayoffList as prolist>
            <div class="p_pro">
                <h3>${prolist.name}</h3>
                <span>金额：${prolist.price}</span>
                <p>${prolist.description!}</p>
                <#if prolist.isLimit == true>
                    <span>已支持人数${prolist.currentNum} /限额人数${prolist.limitNum} </span>
                    <#if prolist.currentNum==prolist.limitNum>

                        <a href="#"  class="but_gray" >我要参与</a>
                        <#elseif prolist.currentNum < prolist.limitNum>
                        <a href="${BASE_PATH}/blog/pay/order.htm?projectId=${prolist.projectId}&id=${prolist.id}"  class="but_red" >我要参与</a>

                    </#if>

                    <#elseif   (prolist.isLimit == false)>
                        <span>已支持人数${prolist.currentNum} /不限人数</span>
                        <a href="${BASE_PATH}/blog/pay/order.htm?projectId=${prolist.projectId}&id=${prolist.id}"  class="but_red" >我要参与</a>
                </#if>
            </div></#list>


    </div>
    <!--项目内容-->
    <div  >
        <div class="p_path">
            当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt;
            <#if folderFather??>
                <a href="${BASE_PATH }/folder/${folderFather.ename }.htm" id="position_nowtitle">${folderFather.name}</a>&gt;
                <a href="${BASE_PATH }/blog/${folderFather.ename }/${folder.ename }.htm" id="position_nowtitle">${folder.name }</a>
                &gt;
                <#else>
                    <a href="${BASE_PATH }/folder/${folder.ename }.htm" id="position_nowtitle">${folder.name }</a>
                    &gt;
            </#if>
            <a id="position_articletitle">${article.title}</a>
        </div>
        <div class="p_rb tab-pane fade in active" id="all_news">
            <div class="p_rt">${article.title}</div>
            <div class="p_content">
                <div>${article.content}</div>
            </div>
            <#list commentList.list as e>
                <div class="p_content"
                     style="padding: 10px;border-top:1px solid #ddd;">
                    <a style="color: red;">${e.userNickname!}</a>：
                    <div style="display:none;">${e.content!}</div>
                    <div class="commit" style="border: 1px ;">
                        <p></p>
                    </div>

                    <div style="margin: 15px 0">
                        <ul class="level">
                            <li><label class="rili"
                                       style="color: #255625;font-style: italic;font-size: 80%;">${e.createTime?string("yyyy-MM-dd
								HH:mm:ss")}</label></li>
                            <li><#if e.userId ==SESSION_USER.userId> <a
                                    class="deleteComment" href="javascript:void(0);"
                                    commentId="${e.commentId}" type="submit">删除评论</a></#if></li>
                            <li><span>楼层：${e.floor!}</span>
                            </li>
                        </ul>

                    </div>

                    <#if e.path=="1"> <#list commentInCommentMap?keys as mKey>
                        <div>
                            <#if mKey?number==e.floor> <#assign commentInCommentList =
                                    commentInCommentMap[mKey]> <#list commentInCommentMap[mKey] as
                                    commentInComment>
                                <h4>管理员回复：${commentInComment.content}</h4>
                                <ul class="level">
                                    <li class="rili">${commentInComment.createTime?string("yyyy-MM-dd
							HH:mm:ss")}</li>
                                    <li><span>回复时间：</span>
                                    </li>
                                </ul>
                            </#list>
                        </div>

                    </#if> </#list> </#if>

        </div>

        </#list>
    </div>
    <!-- 开始分页模块内容 -->
    <div class="navPage pagebar">
        <ul>
            <li><a title="第一页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=1">|&lt;</a>
            </li> <#if (pageNum > 1)>
            <li><a title="上一页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=${pageNum-1}">&lt;&lt;</a>
            </li>
            <li><a title="第${pageNum-1}页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=${pageNum-1}">${pageNum-1}</a>
            </li> </#if>
            <li><a title="" class="pagebarCurrent">${pageNum}</a>
            </li> <#if (pageNum
            <commentList.pageCount) >
            <li><a title="第${pageNum+1}页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=${pageNum+1}">${pageNum+1}</a>
            </li>
            <li><a title="下一页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=${pageNum+1}">&gt;&gt;</a>
            </li>
            </#if>
            <li><a title="最后一页"
                   href="${BASE_PATH }/blog/products/detail/${articleId}.htm?p=${commentList.pageCount}">&gt;|</a>
            </li>
        </ul>
    </div>
    <form id="addComment" class="form-horizontal"
          action="${BASE_PATH}/blog/comment/add.json" autocomplete="off"
          method="post" enctype="multipart/form-data">
        <div class="">
            <input type="hidden" name="articleId">
            <div class="col-lg-10" >
                <div class="panel">
                    <header class="panel-heading"> 评论 </header>
                    <input type="hidden" style="font-size:15px;width: 300px;"
                           class="form-control" name="fatherId" placeholder="文章Id"
                           id="fatherId" value="${article.articleId }"> </input> <input
                        type="hidden" style="font-size:15px;width: 300px;"
                        class="form-control" name="url" placeholder="评论url" id="url"
                        value="1"> </input>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">评论</label>
                    <div class="col-sm-10" id='commit'>
                        <script id="content" name="content" type="text/plain"
                                style="width: 90%; height: 200px;"></script>
                        <script type="text/javascript">
                            var contentEditor;
                            $(function() {
                                contentEditor = UE.getEditor('content');

                            });
                        </script>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-shadow update" href="javascript:void(0);"
                                type="submit">评论</button>
                    </div>
                </div>

            </div>
    </form>
</div>
</div>
</div>
<div class="clear"></div>

<div class="clear"></div>

</div>
<div class="clear"></div>

<div class="clear"></div>
</div>

<div class="clear"></div>




</div>

</div>

<!--main content end-->
<script type="text/javascript">


    $(function() {
        /*判断总项目的状态，是否可以参加*/
        if (${project.status}==1){

            $(".but_red").addClass("but_gray").removeClass("but_red").attr("disabled","disabled");

        }
        

/*显示总项目信息*/
        var dd=${project.currentMoney!}/${project.targetMoney!};
        dd=parseInt(dd*100);
        var mydate=new Date();
        var sDate1=mydate.toLocaleDateString();var sDate2='${(project.endTime?string("yyyy/M/d "))}';
        var datadiff= Date.parse(sDate2)- Date.parse(sDate1);
        var datedd= parseInt(Math.abs(datadiff) / 1000 / 60 / 60 / 24);
        if (datedd==0){
        $("#lastDay").text("已经结束了!再看看别的吧！");
        }else{$("#lastDay").append(datedd);}
        $("#lastDay").append(datedd);
        $("#precent").text(dd+"%").css("color","black");
        $(".progress-bar").css({"width":dd+'%'});

        //添加评论

        $(".commit p").each(function() {
            //alert($(this).parent().prev().text());
            $(this).html($(this).parent().prev().html());
        });
        $('#addComment').ajaxForm({
            dataType : 'json',
            success : function(data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function() {
                        window.location.reload();
                    });
                } else {
                    bootbox.alert(data.msg);
                }
            }
        });
        $('.deleteComment').click(function() {
            var commentId = $(this).attr("commentId");
            $.post("${BASE_PATH}/blog/comment/delete.json", {
                'commentId' : commentId
            }, function(data) {
                if (data.result) {
                    bootbox.alert("删除成功，将刷新页面", function() {
                        window.location.reload();
                    });
                } else {
                    bootbox.alert(data.msg, function() {
                        window.location.reload();
                    });
                }
            });
        });

        $('.update').click(function() {
            var count = UE.getEditor('content').getContentLength(true);
        });
    });
</script>
<div class="clear"></div>


<script type="text/javascript">
    //修改导航
    function load() {
        $("ul#navctive li:eq(3) a").removeClass("nava").addClass("navactive");
    }
</script>

<#include "footer.ftl">
