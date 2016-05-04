<#assign menu="system">
<#assign submenu="system_basic">
<#include "/manage/head.ftl">
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<section class="panel">
			<header class="panel-heading"> 基本设置</header>
			<div class="panel-body">
				<form id="basicForm" action="${BASE_PATH}/manage/config/basic.json" role="form" class="form-horizontal" autocomplete="off" method="post" >
					<div class="form-group">
						<label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">网站名称</label>
						<div class="col-lg-10">
							<input type="text" placeholder="网站名称" id="inputEmail1" name="sitename"
								class="form-control" value="${shishuo_seo_title}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">是否允许评论</label>
						<div class="col-lg-10">
							<label>
								<input type="radio" placeholder="评论" id="commentRadio1" name="allowcomment"
								class="form-control" value="true" >是
							</label>
							<label>
								<input type="radio" placeholder="评论" id="commentRadio2" name="allowcomment"
								class="form-control" value="false">否
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">评论是否需要审核</label>
						<div class="col-lg-10">
							<label>
								<input type="radio" placeholder="审核" id="reviewRadio1" name="needauditing"
								class="form-control" value="true" >是
							</label>
							<label>
								<input type="radio" placeholder="审核" id="reviewRadio2" name="needauditing"
								class="form-control" value="false" >否
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">用户注册是否需要审核</label>
						<div class="col-lg-10">
							<label>
								<input type="radio" placeholder="审核" id="reviewRadio3" name="userauditing"
								class="form-control" value="true" >是
							</label>
							<label>
								<input type="radio" placeholder="审核" id="reviewRadio4" name="userauditing"
								class="form-control" value="false" >否
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button class="btn btn-danger" type="submit">保存</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<script type="text/javascript">
	$(function() {
		var allowComment=${allow_comment};
		var needauditing=${need_auditing};
		var userauditing=${user_auditing};
		$('#basicForm').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});					
				}else{
					showErrors($('#basicForm'),data.errors);
				}
			}
		});
		
		if(allowComment == true){
			document.getElementById('commentRadio1').checked=true;
		}else{
			document.getElementById('commentRadio2').checked=true;
		}
		
		if(needauditing == true){
			document.getElementById('reviewRadio1').checked=true;
		}else{
			document.getElementById('reviewRadio2').checked=true;
		}
		
		if(userauditing == true){
			document.getElementById('reviewRadio3').checked=true;
		}else{
			document.getElementById('reviewRadio4').checked=true;
		}
	});	
</script>
<#include "/manage/foot.ftl">
