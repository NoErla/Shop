<#include "head.ftl">
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
						<@shishuo_folder_list_tag folderId= folder.folderId>
							<#list tag_folder_list as tag_folder>
								<li class="line"></li>
								<li class="sortnavli"><a href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>" style="padding: 0" class="sortnava <#if tag_folder.folderId==g_folderId>active</#if>">${tag_folder.name}</a></li>
			           		</#list>
						</@shishuo_folder_list_tag>
				</ul>
			</div>
			<script type="text/javascript">
				//定义contents 组数为所有将要显示的内容
				var contents = document
						.getElementsByClassName('sortsubnavcontainer');
				//定义contents 组数为所有标题，也是可点击展开的按钮
				var toggles = document.getElementsByClassName('btn');
				//调用moofx JS库
				var myAccordion = new fx.Accordion(toggles, contents, {
					opacity : true,
					duration : 400
				} //opacity确定是否有alpha透明变化,duration确定动作所有时间
				);
				myAccordion.showThisHideOpen(contents[0]); //默认打开第一个内容
			</script>
		</div>

		<div class="clear"></div>

	</div>

	<div class="p_right tab-content">
		<div class="p_path">
			当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a href="${BASE_PATH }/folder/${folder.ename }.htm" id="position_nowtitle">${folder.name }</a>
			</div>
			<div class="p_rb tab-pane fade in active" id="all_news">
				<div class="p_rt">所有新闻</div>
				<div class="p_content">
					<div id="com_thenm_list" class="content">
						<div class="i_news01_l" style="width:80%;">
							<ul>
								<#list articleList.list as article>
							<li><a class="a_news" href="${BASE_PATH }/blog/article/other/${article.articleId}.htm">${article.title}</a>
								
								<span><lable >${article.createTime?string("yyyy-MM-dd")}</lable></span></li>
						</#list>
						</ul>
							</div>


						


					<!-- 开始分页模块内容 -->
					<div class="navPage pagebar">
						<ul>
							<li><a title="第一页" href="${BASE_PATH }/folder/news.htm?p=1">|&lt;</a></li>
							<#if (pageNum > 1)>
								<li><a title="上一页" href="${BASE_PATH }/folder/news.htm?p=${pageNum-1}">&lt;&lt;</a></li>
								<li><a title="第${pageNum-1}页" href="${BASE_PATH }/folder/news.htm?p=${pageNum-1}">${pageNum-1}</a></li>
							</#if>
							<li><a title="" class="pagebarCurrent">${pageNum}</a></li>
							<#if (pageNum<articleList.pageCount) >
								<li><a title="第${pageNum+1}页" href="${BASE_PATH }/folder/news.htm?p=${pageNum+1}">${pageNum+1}</a></li>
								<li><a title="下一页" href="${BASE_PATH }/folder/news.htm?p=${pageNum+1}">&gt;&gt;</a></li>
							</#if>
							<li><a title="最后一页" href="${BASE_PATH }/folder/news.htm?p=${articleList.pageCount}">&gt;|</a></li>
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

<#include "footer.ftl">
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/menu/jquery.min.js"></script>
<script type="text/javascript">
	var bg_obj = "main_container";
	var theimgs = new Array();
	var bg_type = 0; //0表示背景图片，1表示背景颜色
	var rotation_time = 6000; //表示背景轮换的间隔时间

	if (window.attachEvent) {
		window.attachEvent('onload', auto_chgbg);
	} else if (window.addEventListener) {
		window.addEventListener('load', auto_chgbg, false);
	}
	
	//修改导航
              function load() {
                      $("ul#navctive li:eq(5) a").removeClass("nava").addClass("navactive");
    }
</script>
<div class="clear"></div>

</body>
</html>