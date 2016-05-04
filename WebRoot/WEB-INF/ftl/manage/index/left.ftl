<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						
						<button class="btn btn-info" onclick="changeMenus();" title="切换菜单">
							<i class="ace-icon fa fa-pencil"></i>
						</button>
						
						<button class="btn btn-success" title="UI实例" onclick="window.open('static/html_UI/html');">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning" title="" id="adminzidian">
							<i class="ace-icon fa fa-book"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="">
						<a href="/shop/manage/index">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text">后台首页</span>
						</a>
						<b class="arrow"></b>
					</li>

 
<@shop_menu_list_tag menuId= 0>
	<#list tag_menu_list as menu1>
	<#if menu1.hasMenu == true>
		<li class=""  id="lm${menu1.menuId }">
			<a style="cursor:pointer;" class="dropdown-toggle">
			<#if menu1.menuIcon??>
				<i class="${menu1.menuIcon}"></i>
			<#else>
				<i class="menu-icon fa fa-leaf black"></i> 
			</#if>
				<span class="menu-text">
					${menu1.menuName }
				</span>
				<#if menu1.subMenu?exists  && (menu1.subMenu?size > 0) ><b class="arrow fa fa-angle-down"></b></#if>
			</a>
			<b class="arrow"></b>
			<#if menu1.subMenu??>
				<ul class="submenu">
				<#list menu1.subMenu as menu2>
					<#if menu2.hasMenu == true>
					<li class="" id="z${menu2.menuId }">
						<a style="cursor:pointer;" <#if menu2.menuUrl != '#'> target="mainFrame" onclick="siMenu('z${menu2.menuId }','lm${menu1.menuId }','${menu2.menuName }','/shop/manage${menu2.menuUrl }')"</#if><#if menu2.subMenu??> class="dropdown-toggle"</#if>>
							<#if menu2.menuIcon??>
								<i class="${menu2.menuIcon}"></i>
							<#else>
								<i class="menu-icon fa fa-leaf black"></i> 
							</#if>
										${menu2.menuName }
							<#if menu2.subMenu?exists  && (menu2.subMenu?size > 0) ><b class="arrow fa fa-angle-down"></b></#if>
						</a>
						<b class="arrow"></b>
					</#if>
				</#list>
				</ul>
			</#if>
		</li>
	</#if>
	</#list> 
</@shop_menu_list_tag> 
 
 	
				
				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>