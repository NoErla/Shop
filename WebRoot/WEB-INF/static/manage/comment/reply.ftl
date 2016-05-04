<#assign menu="comment">
<#assign submenu="auditing_comment">
<#include "/manage/head.ftl">
<style type="text/css">
.content {
width: 483px;
height: 221px;
}
</style>
<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
		<!-- page start-->
			<div class="row">
			<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading">
 					回复评论
				</header>
				<div class="panel-body">
					<form id="replyComment" role="form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/comment/reply.json">
						 <div class="form-group">
						 	<input type="hidden" value="${comment.fatherId!}" id="fatherId" name="fatherId">
						 	<input type="hidden" value="${comment.commentId!}" id="commentId" name="commentId">
						 	<input type="hidden" value="${comment.floor!}" id="floor" name="floor">
						 </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">评论名</label>
                             <div class="col-lg-10">
                                 ${comment.name!}
                             </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">用户id</label>
                             <div class="col-lg-10" id="userId">
                                   ${comment.userId!}
                             </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">内容</label>
                             <div class="col-sm-10">
                                  ${comment.content!}
                              </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">IP</label>
                             <div class="col-lg-10" id="ip">
                                    ${comment.ip!}
                             </div>
                          </div>
                          <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">回复</label>
                             <div class="col-sm-10">
                                  <script id="content" name="content" type="text/plain"
										style="width: 80%; height: 300px;"></script>
								  <script type="text/javascript">
									var contentEditor;
									$(function() {
										contentEditor = UE.getEditor('content',{    
											toolbars: [        [  'undo', 'redo', '|',
											                      'simpleupload','emotion']    ],  
											autoHeightEnabled: true,   
											autoFloatEnabled: true,
											maximumWords: 200
											});
									});
								  </script>
                              </div>
                          </div>
                          
                         <div class="form-group">
                        	<label class="col-sm-2 col-sm-2 control-label"></label>
                        	<div class="col-lg-10">
	                        	<button class="btn btn-danger reply " href="javascript:void(0);" type="submit">回复</button>
                        	</div>
                        </div>
                     </form>
				</div>
			</section>
		</div>
		</div>
<!-- page end-->
		</section>
	</section>
 <!--main content end-->
<script type="text/javascript">
	$(function() {				
		$('#replyComment').ajaxForm({
			dataType : 'json',
			type: 'POST',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					bootbox.alert(data.msg);
				}
			}
		});
	});
</script>
<#include "/manage/foot.ftl">
