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
									编辑商品
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="editG" name="goodsForm" id="goodsForm" method="post" class="form-horizontal">
							<input type="hidden" name="goodsId" id="goodsId" value="${goods.goodsId }"/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="goodsTypeName" id="goodsTypeName" value="${goods.goodsName }" placeholder="这里输入名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 种类 :</label>
								<div class="col-sm-9">
									<select class="form-control" name="goodsTypeId" style="font-size:15px;width: 300px;">
			                   		<#list types as type>
			                        	<option value="${type.goodsTypeId}"<#if type.goodsTypeId == goods.goodsId>selected</#if>>
			                        	${type.goodsTypeName}
			                        	</option>
			                        </#list>							
	                            	</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 价格 :</label>
								<div class="col-sm-9">
									<input type="text" name="price" id="goodsTypeId" value="${goods.price }" placeholder="这里输入价格" class="col-xs-10 col-sm-5" />
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
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#goodsName").focus();
				return false;
			}
			if($("#price").val()==""){
				$("#price").tips({
					side:3,
		            msg:'请输入商品价格',
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