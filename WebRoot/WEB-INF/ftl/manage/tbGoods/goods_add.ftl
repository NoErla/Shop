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
									添加商品
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="editG" name="goodsForm" id="goodsForm" method="post" class="form-horizontal" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="goodsName" id="goodsName" placeholder="这里输入商品名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 图片 :</label>
								<div class="col-sm-9">
									<input type="file" name="file" id="file" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 种类 :</label>
								<div class="col-sm-9">
									<select class="form-control" name="goodsTypeId" style="font-size:15px;width: 300px;">
			                   		<#list types as type>
			                        	<option value="${type.goodsTypeId}"selected>
			                        	${type.goodsTypeName}
			                        	</option>
			                        </#list>							
	                            	</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 价格 :</label>
								<div class="col-sm-9">
									<input type="text" name="price" id="price" placeholder="这里输入价格" class="col-xs-10 col-sm-5" />
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
			if($("#goodsName").val()==""){
				$("#goodsName").tips({
					side:3,
		            msg:'请输入商品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#goodsTypeName").focus();
				return false;
			}
			if($("#goodsTypeId").val()==""){
				$("#goodsTypeId").tips({
					side:3,
		            msg:'请输入商品种类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#goodsTypeId").focus();
				return false;
			}
			if($("#price").val()==""){
				$("#price").tips({
					side:3,
		            msg:'请输入价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#price").focus();
				return false;
			}
			$("#goodsForm").submit();
		}
		
	</script>


</body>
</html>