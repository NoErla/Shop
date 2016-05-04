<#include "head.ftl" >
<div class="p_subnav">
</div>
<div class="clear">
</div>

<div class="p_container mauto">

    <div class="clear">
    </div>

    <div class="p_left">
        <div class="sidebar" id="com_sort_products" >
            <div class="sortnavt">
                <h3> 栏目导航 </h3>
            </div>
            <div class="sidebar_l">
                <ul class="nav sortnavul ">
                    <li class="sortnavli ">
                        <a href="#company"  data-toggle="tab" class="sortnava" style="padding: 0">联系我们</a>
                    </li>

                </ul>
            </div>

        </div>

        <div class="clear"></div>

    </div>


    <div class="p_right tab-content">
        <div  class="tab-pane  in active" id="company">
            <div class="p_path"> 当前位置 ：<a href="${BASE_PATH}/index.htm" > 首页 </a>&gt; <a>联系我们</a></div>
            <div style="display:none;">${articleCon.content}</div>
            <div class="p_rb">
            	<div class="commit"></div>
                <div class="p_rt"  >公司位置</div>
                <iframe style="height:300px;width:690px;" src="${BASE_PATH}/blog/article/map.htm" frameborder="no" scrolling="no"></iframe>
                <div class="p_content">
                    等你来！！！
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div  class="tab-pane  " id="message">
            <div class="p_path"> 当前位置 ：<a href="#" > 首页 </a>&gt; <a id="position_nowtitle">联系我们</a></div>
            <div class="p_rb">
                <div class="p_rt"  >在线留言</div>
                <div class="p_content">
                   说点什么吧
                </div>
            </div>
            <div class="clear">
            </div>
        </div>

    </div>
    <div class="clear">
    </div>

    <div class="clear">
    </div>
</div>

<script type="text/javascript"
	src="${BASE_PATH}/static/templates/jscript/menu/jquery.min.js"></script>
<script type="text/javascript">
    //改变一级导航的选中目标
    function load() {
                      $("ul#navctive li:eq(9) a").removeClass("nava").addClass("navactive");

     
    }
$(function() {
	// alert($(".p_rb").prev().html());
        $(".p_rb div.commit").html($(".p_rb").prev().html());
        $(".p_rb div.commit p").css("background","#fbfbfb");
    })
</script>
<div class="clear"></div>
<#include "footer.ftl">