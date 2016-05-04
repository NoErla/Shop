<#assign menu="comment">
<#assign submenu="comment_list">
<#include "/manage/head.ftl">
<style type="text/css">
.pagination {
    border-radius: 4px;
    display: inline-block;
    margin: 0;
    padding-left: 0;
}
.breadcrumb > li + li:before {
    color: #CCCCCC;
    content: "| ";
    padding: 0 5px;
}
.commit {
	
	overflow: hidden;
	
	max-width: 478px;

	
}
</style>
	<!--main content start-->
 <section id="main-content">
		<section class="wrapper">
        	<!-- page start-->
        	<div class="row">
                  <div class="col-lg-12">
                  <form action="${BASE_PATH}/manage/comment/findByFatherId.htm">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
                          <li><a href="${BASE_PATH}/manage/comment/page.htm?status=hidden">未审核评论(${hiddenCount})</a></li>
               		 	  <li><a href="${BASE_PATH}/manage/comment/page.htm?status=display">审核通过的评论(${displayCount})</a></li>
               		 	  <li><a href="${BASE_PATH}/manage/comment/page.htm?status=trash">垃圾评论(${trashCount})</a></li>
               		 	  <li>
               		 	  		<input type="text" name="fatherId" placeholder="请输入需要查询的文章Id" id="fatherId"/><button href="javascript:void(0);" type="submit">查询</button>
               		 	  </li> 	  
                      </ul>
                      <!--breadcrumbs end -->
                  </form>
                  </div>
              </div>  
            <section class="panel">
            	<header class="panel-heading">
                <#if statusType=="hidden">未审核评论列表
                <#elseif statusType=="display">审核通过的评论列表
                <#elseif statusType=="trash">垃圾评论列表
                <#else>查找
                </#if>
                </header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
                                	<tr>
                						<th>文章Id</th>
                						<th>文章名</th>
                						<th>评论人id</th>
                						<th>昵称</th>
                						<td>楼层</td>
                						<th>内容</th>
                						<th>状态</th>
                						<th>操作</th>
                						<th>操作</th>
              						</tr>
                                </thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<#list pageVo.list as commentVo>
                            		<tr class="gradeA odd">
                            			<td><a href="${BASE_PATH}/manage/article/update.htm?articleId=${commentVo.fatherId}">${commentVo.fatherId}</a></td>
                                    	<td><a href="${BASE_PATH}/manage/comment/findByFatherId.htm?fatherId=${commentVo.fatherId}">${commentVo.articleTitle}</a></td>
                                    	<td><a href="${BASE_PATH}/manage/comment/findByUserId.htm?userId=${commentVo.userId}">${commentVo.userId}</a></td>
                                    	<td><a href="${BASE_PATH}/manage/comment/findByUserId.htm?userId=${commentVo.userId}">${commentVo.userNickname!}</a></td>
                                    	<td><a href="${BASE_PATH}/manage/comment/findByPathAndFatherId.htm?fatherId=${commentVo.fatherId}&floor=${commentVo.floor}">${commentVo.floor}</a></td>
                                    	<td class="commit" nowrap='nowrap'><div style="display:none;">${commentVo.content!}</div></td>
                                    	<td>
                                    		<#if commentVo.status=="hidden">正在审核
                                    		<#elseif commentVo.status=="display">已经通过
                                    		<#else>垃圾评论
                                    		</#if>
                                    	</td>
                                    	<td>
                                    		<a href="${BASE_PATH}/manage/comment/detail.htm?commentId=${commentVo.commentId}" title="查看详情">
                                    			查看
                  							</a>
                                    	</td>
                                    	<td>
	                                    	<#if commentVo.userId != 0>
	                                    		<a href="${BASE_PATH}/manage/comment/reply.htm?commentId=${commentVo.commentId}" title="查看详情">
	                                    			回复
	                  							</a>
	                  						</#if>
                                    	</td>
                                	</tr>
                                	</#list>
                               	</tbody>
                              </table>
                              <div style="height: 30px;">
                             	<div class="pagination">${pageVo.pageNumHtml} </div>
                              </div>
                           </div>
                        </div>
                  </div>
              </section>
              <!-- page end-->
          </section>
		</section>
		<!--main content end-->
		
		<script type="text/javascript">
    $(function(){
        $(".commit").each(function(){
            
            $(this).html($(this).find("div").text());
        });
    })
</script>
<#include "/manage/foot.ftl">
