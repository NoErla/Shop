<#include "../head.ftl" >
<div class="clear"></div>
<div class="p_subnav"></div>
<div class="clear"></div>
<div class="p_container mauto">

	<div class="clear"></div>
	<div class="p_left">
		<div class="sidebar" id="com_sort_products">
			<div class="sortnavt">
				<h3>栏目导航</h3>
			</div>
			<div class="sidebar_l">
				<ul class="sortnavul nav">
						<@shishuo_folder_list_tag folderId= 1>
							<#list tag_folder_list as tag_folder>
								<li class="line"></li>
								<li class="sortnavli"><a href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>" style="padding: 0" class="sortnava <#if tag_folder.folderId==g_folderId>active</#if>">${tag_folder.name}</a></li>
			           		</#list>
						</@shishuo_folder_list_tag>
				</ul>
			</div>
		
		</div>

		<div class="clear"></div>

	</div>

	<div class="p_right tab-content">
		<div class="p_path">
			当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a href="${BASE_PATH }/folder/${folderFather.ename }.htm" id="position_nowtitle">${folderFather.name }</a>&gt; <a href="${BASE_PATH }/blog/${folderFather.ename }/${folder.ename }.htm" id="position_nowtitle">${folder.name }</a>
		</div>
		<div class="p_rb tab-pane in active"id="prud_invest">
			<div class="p_rt" id="com_pmodule_news_list">${folder.name }</div>
			<div class="p_content ">
				<div id="com_thenm_list" class="content">

					<#list articleList.list as article>
						<div class="p_p_list">
							<div>
								<li><a href="${BASE_PATH }/blog/products/detail/${article.articleId}.htm">${article.title}</a>
									<p>
									${article.content}</p>
									<span>${article.createTime?string("yyyy-MM-dd")}</span></li>
							</div>
						</div>
					</#list>


					<!-- 开始分页模块内容 -->
					<div class="navPage pagebar">
						<ul>
							<li><a title="第一页" href="${BASE_PATH }/blog/article/products.htm?p=1">|&lt;</a></li>
							<#if (pageNum > 1)>
								<li><a title="上一页" href="${BASE_PATH }/blog/article/products.htm?p=${pageNum-1}">&lt;&lt;</a></li>
								<li><a title="第${pageNum-1}页" href="${BASE_PATH }/blog/article/products.htm?p=${pageNum-1}">${pageNum-1}</a></li>
							</#if>
							<li><a title="" class="pagebarCurrent">${pageNum}</a></li>
							<#if (pageNum<articleList.pageCount) >
								<li><a title="第${pageNum+1}页" href="${BASE_PATH }/blog/article/products.htm?p=${pageNum+1}">${pageNum+1}</a></li>
								<li><a title="下一页" href="${BASE_PATH }/blog/article/products.htm?p=${pageNum+1}">&gt;&gt;</a></li>
							</#if>
							<li><a title="最后一页" href="${BASE_PATH }/blog/article/products.htm?p=${articleList.pageCount}">&gt;|</a></li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>

	</div>
	<div class="clear"></div>

	<div class="clear"></div>
</div>
<div class="clear"></div>
<script type="text/javascript">

	//修改导航
              function load() {
                      $("ul#navctive li:eq(3) a").removeClass("nava").addClass("navactive");

     
    }
	
</script>
<div class="clear"></div>
<#include "../footer.ftl">
</body>
</html>