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
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									添加商品类别
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="editT" name="typeForm" id="typeForm" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="goodsTypeName" id="goodsTypeName" placeholder="这里输入菜单名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 父类 :</label>
								<div class="col-sm-9">
									<select class="form-control" name="parentId" style="font-size:15px;width: 300px;">
									<option value="0" selected>无</option>
			                   		<#list types as type>
			                        	<option value="${type.goodsTypeId}">
			                        	${type.goodsTypeName}
			                        	</option>
			                        </#list>							
	                            	</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 英文名 :</label>
								<div class="col-sm-9">
									<input type="text" name="ename" id="ename" placeholder="这里输入英文名" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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
	<!--提示框-->
	<script type="text/javascript" src="/shop/static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		
		//保存
		function save(){
			if($("#goodsTypeName").val()==""){
				$("#goodsTypeName").tips({
					side:3,
		            msg:'请输入类型名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#goodsTypeName").focus();
				return false;
			}
			if($("#ename").val()==""){
				$("#ename").tips({
					side:3,
		            msg:'请输入英文名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ename").focus();
				return false;
			}
			$("#typeForm").submit();
		}
		
	</script>


</body>
</html>