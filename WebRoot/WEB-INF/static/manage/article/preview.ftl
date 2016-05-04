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
				<ul class="sortnavul nav">
					
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
				当前位置 ：<a href="#"> 首页 </a>&gt; 预览
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