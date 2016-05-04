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

							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class="center" style="width: 50px;">编号</th>
										<th class='center'>名称</th>
										<th class='center'>英文名</th>
										<th class='center' style="width: 120px;">操作</th>
									</tr>
								</thead>

								<tbody>
								<#list list as type>
								<tr>
									<td class='center'>${type_index }</td>
									<td class='center'>${type.goodsTypeId }</td>
									<td class='center'><a href="javascript:goSubType('${type.goodsTypeId }')">${type.goodsTypeName }</a></td>
									<td class='center'>${type.ename }</td>
									<td>
										<a class="green" href="javascript:editmenu('${type.goodsTypeId }');"> 
											<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
										</a> 
										<a class="red" href="javascript:delmenu('${type.goodsTypeId }');"> 
											<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i> 
										</a>
									</td>
								</tr>
								</#list>
								
								</tbody>
							</table>
							
							<div>
								&nbsp;&nbsp;
								<a class="btn btn-sm btn-success" onclick="addmenu();">新增</a>
							</div>
							
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
		function editmenu(tbGoodsTypeId){
			top.jzts();
			window.location.href="toEdit.htm?tbGoodsTypeId="+tbGoodsTypeId;
		};
		
		//删除
		function delmenu(goodsTypeId){
			bootbox.confirm("确定要删除该种类吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "deleteT?goodsTypeId="+goodsTypeId;
					$.get(url,function(data){
						window.location.reload();
					});
				};
			});
		}
		
		//新增菜单
		function addmenu(){
			top.jzts();
			window.location.href="toAdd.htm";
		};
		
		//去此ID下子列表
		function goSubType(typeId){
			top.jzts();
			window.location.href="list.htm?typeId="+typeId;
		};
		
	</script>


</body>
</html>