<#include "head.ftl" >
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
				<ul class="sortnavul">
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
	<div class="p_right">
		<div class="p_path">
			当前位置 ：<a href="${BASE_PATH }/index.htm"> 首页 </a>&gt; <a href="${BASE_PATH }/folder/about.htm" id="position_nowtitle">关于我们</a>
		</div>
		<div class="p_rb">
			<div class="p_rt">关于我们</div>
			<div class="p_content">
				<div id="com_thenm_list" class="content">
					<div class="remark1">
						<p>内容建设中...</p>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>

</div>
	<div class="clear"></div>
</div>
<#include "footer.ftl">
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/menu/jquery.min.js"></script>
<script type="text/javascript">
	function load() {
		$("ul#navctive li:eq(7) a").removeClass("nava").addClass("navactive");

	}
</script>