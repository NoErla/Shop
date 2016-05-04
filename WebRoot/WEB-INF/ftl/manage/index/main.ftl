﻿<!DOCTYPE html>
<html lang="en">
<head>

	<#include "top.ftl">
	<style type="text/css">
	.commitopacity{position:absolute; width:100%; height:100px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.8; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
	</style>
	
</head>
	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		
		<!-- 页面顶部¨ -->
		<#include "head.ftl">
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<!-- 左侧菜单 -->
			<#include "left.ftl">

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<!-- #section:settings.skins -->
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; 选择皮肤</span>
									</div>

									<!-- /section:settings.skins -->

									<!-- #section:settings.navbar -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
										<label class="lbl" for="ace-settings-navbar">固定导航栏</label>
									</div>

									<!-- /section:settings.navbar -->

									<!-- #section:settings.sidebar -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
										<label class="lbl" for="ace-settings-sidebar">固定侧边栏</label>
									</div>

									<!-- /section:settings.sidebar -->

									<!-- #section:settings.breadcrumbs -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
										<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
									</div>

									<!-- /section:settings.breadcrumbs -->

									<!-- #section:settings.rtl -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
										<label class="lbl" for="ace-settings-rtl">菜单居左</label>
									</div>

									<!-- /section:settings.rtl -->

									<!-- #section:settings.container -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
										<label class="lbl" for="ace-settings-add-container">
											居中风格
										</label>
									</div>

									<!-- /section:settings.container -->
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<!-- #section:basics/sidebar.options -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
										<label class="lbl" for="ace-settings-hover">折叠菜单</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
										<label class="lbl" for="ace-settings-compact">压缩菜单</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
										<label class="lbl" for="ace-settings-highlight">弹出风格</label>
									</div>

									<!-- /section:basics/sidebar.options -->
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->
						
						<div>
							<iframe name="mainFrame" id="mainFrame" frameborder="0" src="/shop/manage/index/tab.htm" style="margin:0 auto;width:100%;height:100%;"></iframe>
						</div>
						</div><!-- /.row -->	
					</div><!-- /.page-content -->
					
				</div>
			</div><!-- /.main-content -->

		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<!-- 页面底部js¨ -->
		<#include "foot.ftl">
		
		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="/shop/static/ace/js/ace/elements.scroller.js"></script>
		<script src="/shop/static/ace/js/ace/elements.colorpicker.js"></script>
		<script src="/shop/static/ace/js/ace/elements.fileinput.js"></script>
		<script src="/shop/static/ace/js/ace/elements.typeahead.js"></script>
		<script src="/shop/static/ace/js/ace/elements.wysiwyg.js"></script>
		<script src="/shop/static/ace/js/ace/elements.spinner.js"></script>
		<script src="/shop/static/ace/js/ace/elements.treeview.js"></script>
		<script src="/shop/static/ace/js/ace/elements.wizard.js"></script>
		<script src="/shop/static/ace/js/ace/elements.aside.js"></script>
		<script src="/shop/static/ace/js/ace/ace.js"></script>
		<script src="/shop/static/ace/js/ace/ace.ajax-content.js"></script>
		<script src="/shop/static/ace/js/ace/ace.touch-drag.js"></script>
		<script src="/shop/static/ace/js/ace/ace.sidebar.js"></script>
		<script src="/shop/static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="/shop/static/ace/js/ace/ace.submenu-hover.js"></script>
		<script src="/shop/static/ace/js/ace/ace.widget-box.js"></script>
		<script src="/shop/static/ace/js/ace/ace.settings.js"></script>
		<script src="/shop/static/ace/js/ace/ace.settings-rtl.js"></script>
		<script src="/shop/static/ace/js/ace/ace.settings-skin.js"></script>
		<script src="/shop/static/ace/js/ace/ace.widget-on-reload.js"></script>
		<script src="/shop/static/ace/js/ace/ace.searchbox-autocomplete.js"></script>
		<!-- inline scripts related to this page -->

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="/shop/static/ace/css/ace.onpage-help.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="/shop/static/ace/js/ace/elements.onpage-help.js"></script>
		<script src="/shop/static/ace/js/ace/ace.onpage-help.js"></script>
	
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="/shop/static/js/myjs/head.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="/shop/static/js/myjs/index.js"></script>
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="/shop/plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="/shop/plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		<!--提示框-->
		<script type="text/javascript" src="/shop/static/js/jquery.tips.js"></script>
	</body>
</html>