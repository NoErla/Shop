<!DOCTYPE html>
<html lang="en">
<head>

<!-- 文件头和头部 -->
<#include "../index/top.ftl">
	
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						
						<!-- 检索  -->
						<form action="list.htm" method="post" name="goodsForm" id="goodsForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
									<i class="ace-icon fa fa-search nav-search-icon"></i>
										<select class="form-control" name="goodsTypeId" style="font-size:15px;width: 300px;">
										<option value="" selected>请选择种类</option>
				                   		<#list types as type>
				                        	<option value="${type.goodsTypeId}">
				                        	${type.goodsTypeName}
				                        	</option>
				                        </#list>							
		                            	</select>
										
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class="center" style="width: 50px;">编号</th>
										<th class='center'>图片</th>
										<th class='center'>名称</th>
										<th class='center'>类型</th>
										<th class='center'>价格</th>
										<th class='center'>销售数目</th>
										<th class='center' style="width: 120px;">操作</th>
									</tr>
								</thead>

								<tbody>
								<#list pageVo.list as goods>
								<tr>
									<td class='center'>${goods_index + 1 }</td>
									<td class='center'>${goods.goodsId }</td>
									<td class='center'>
									<a href="/shop/${goods.image}" class="bwGal"><img src="/shop/${goods.image}" width="100"></a>
									</td>
									<td class='center'>${goods.goodsName }</td>
									<#list types as type>
										<#if type.goodsTypeId == goods.goodsTypeId>
											<td class='center'>${type.goodsTypeName }</td>
										</#if>									
									</#list>
									<td class='center'>${goods.price }</td>
									<td class='center'>${goods.sellCount }</td>
									<td>
										<a class="green" href="javascript:editGoods('${goods.goodsId }');"> 
											<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
										</a> 
										<a class="red" href="javascript:delGoods('${goods.goodsId }');"> 
											<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i> 
										</a>
									</td>
								</tr>
								</#list>
								
								</tbody>
							</table>
							
							<div>
								&nbsp;&nbsp;
								<a class="btn btn-sm btn-success" onclick="addGoods();">新增</a>
							</div>
							
							<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${pageVo.pageNumHtml}</div>
							
							
							
						</form>	
						</div>
						<!-- /.col -->
					</div>
					
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<#include "../index/foot.ftl">
	<!-- 删除时确认窗口 -->
	<script src="/shop/static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="/shop/static/ace/js/ace/ace.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(document).ready(function(){
			top.hangge();
		});	
		
		//编辑
		function editGoods(goodsId){
			top.jzts();
			window.location.href="toEdit.htm?goodsId="+goodsId;
		};
		
		//删除
		function delGoods(goodsId){
			bootbox.confirm("确定要删除该商品吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "deleteG?goodsId="+goodsId;
					$.get(url,function(data){
						window.location.reload();
					});
				};
			});
		}
		
		//新增菜单
		function addGoods(){
			top.jzts();
			window.location.href="toAdd.htm";
		};
		
		//检索
		function searchs(){
			top.jzts();
			$("#goodsForm").submit();
		}
		
	</script>


</body>
</html>