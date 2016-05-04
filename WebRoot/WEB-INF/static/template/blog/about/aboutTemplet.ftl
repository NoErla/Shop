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
						<@shishuo_folder_list_tag folderId= folderFather.folderId>
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
			<div class="p_rt" id="com_pmodule_news_list">${folder.name! }</div>
			<div class="p_content ">
				<div id="com_thenm_list" class="content">
				<div style="display:none;">${article.content!}</div>
					<div class="p_p_list">
							<div class="commit">
								<li>
									<p></p>
								</li>
							</div>
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
                      $("ul#navctive li:eq(7) a").removeClass("nava").addClass("navactive");

    }
	 $(function() {
	 //alert($(".p_p_list").prev().text());
        $(".commit li p").html($(".p_p_list").prev().text());
    })
</script>
<div class="clear"></div>
<#include "../footer.ftl">
</body>
</html>