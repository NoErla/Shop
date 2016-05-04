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
 					审核评论
				</header>
				<div class="panel-body">
					<form id="updateComment" role="form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/comment/update.json">
						 <div class="form-group">
						 	<input type="hidden" value="${comment.commentId!}" id="commentId" name="commentId">
						 </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">评论名</label>
                             <div class="col-lg-10">
                                  <input type="text" value="${comment.name!}" id="name" name="name">
                             </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">用户id</label>
                             <div class="col-lg-10" id="userId">
                                   <input type="text" value="${comment.userId!}" id="userId" name="userId">
                             </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">内容</label>
                             <div class="col-sm-10">
                                  <script id="content" name="content" type="text/plain"
										style="width: 80%; height: 300px;">${comment.content!}</script>
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
                            <!--   <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">URL</label>-->
                             <div class="col-lg-10" id="url">
                                  <input type="hidden" value="${comment.url!}" id="url" name="url">
                             </div>
                          </div>
                         <div class="form-group">
                             <label class="col-lg-2 col-sm-2 control-label" for="inputEmail1">IP</label>
                             <div class="col-lg-10" id="ip">
                                    <input type="text" value="${comment.ip!}" id="ip" name="ip">
                             </div>
                          </div>
                          <div id="errorshow" ></div>
                         <div class="form-group">
                        	<label class="col-sm-2 col-sm-2 control-label"></label>
                        	<div class="col-lg-10">
	                        	<#if comment.status=="hidden">
	                        	<a class="btn btn-danger js_status" href="javascript:void(0);" status="display">审核通过</a>
	                        	<a class="btn btn-success js_status" href="javascript:void(0);" status="trash">垃圾评论</a>
	                        	<button class="btn btn-danger update " href="javascript:void(0);" type="submit">更改</button>
	                        	<#elseif comment.status=="display">
	                        	<a class="btn btn-success js_status" href="javascript:void(0);" status="hidden">退回审核</a>
	                        	<a class="btn btn-success js_status" href="javascript:void(0);" status="trash">垃圾评论</a>
	                        	<button class="btn btn-danger update " href="javascript:void(0);" type="submit">更改</button>
	                        	<#elseif comment.status=="trash">
	                        	<a class="btn btn-success js_status" href="javascript:void(0);" status="hidden">退回审核</a>
	                        	<a class="btn btn-danger js_status" href="javascript:void(0);" status="display">审核通过</a>
	                        	<button class="btn btn-danger update " href="javascript:void(0);" type="submit">更改</button>
	                        	</#if>
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
		var commentId = ${comment.commentId};
		$('.js_status').click(function() {
			var status = $(this).attr("status");
			$.post("${BASE_PATH}/manage/comment/check.json", {
				'commentId' : commentId,
				'status' : status
			}, function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}
			});
		});

		$('#updateComment').ajaxForm({
			dataType : 'json',
			type : 'POST',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				} else {
					addElementDiv("errorshow",data.msg);
				}
			}
		});
	});
		function addElementDiv(obj,msg) {
	    	var parent = document.getElementById(obj);
	    	parent.innerHTML = msg;
	    	}
</script>
<#include "/manage/foot.ftl">
