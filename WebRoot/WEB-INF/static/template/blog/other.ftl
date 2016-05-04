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
					<@shishuo_folder_list_tag folderId= 6>
							<#list tag_folder_list as tag_folder>
								<li class="line"></li>
								<li class="sortnavli">
								<a href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>" style="padding: 0" class="sortnava <#if tag_folder.folderId==g_folderId>active</#if>">${tag_folder.name}</a></li>
			           		</#list>
					</@shishuo_folder_list_tag>
				</ul>
			</div>
			
		</div>

		<div class="clear"></div>

	</div>

	<div class="p_right tab-content">
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
				<div class="p_rt" id="com_pmodule_news_list">${article.title}</div>
				<div class="p_content">
				<div style="display:none;">${article.content!}</div>
        		<div id="com_thenm_list" style="border: 1px ;"><p></p></div>
				
					
			</div>
		</div>
		<div class="clear"></div>

	</div>
	<div class="clear"></div>

	<div class="clear"></div>
</div>
<div class="clear"></div>

<div class="pfooter">
	<div class="pfooter_nav" id="com_othermenu"></div>
	<div class="pcopyright" id="com_copyright">copyright &copy; 筹引力
		all right reversed.</div>

	<div class="clear"></div>
</div>
<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/menu/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
	$("#com_thenm_list p").html($("#com_thenm_list p").parent().prev().html());
	 $("#com_thenm_list p").css("background","#fbfbfb");
	});
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