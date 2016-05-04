<!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <ul class="list-group margin-bottom-25 sidebar-menu">
            <#list goodsTypeList as types>
            	<#if type.goodsTypeId != types.goodsTypeId>
	            	<#if types.hasSubType >
            		<li class="list-group-item dropdown clearfix">
		            	<a href="javascript:void(0);" class="">
		                  <i class="fa fa-angle-right"></i>
		                  ${types.goodsTypeName }
		                  <i class="fa fa-angle-down"></i>
		                </a>
		                <#list types.subType as subType>
		                <ul class="dropdown-menu" style="display:none;">
		                  	<li>
		                  		<a href="${BASE_PATH }/type/${subType.ename}.htm">
		                  			<i class="fa fa-circle"></i>
		                  			${subType.goodsTypeName }       			
		                  		</a>
		                  	</li>                 	
	                  	</ul>
		                </#list>
                  	</li>
	            	<#else>
	            	<li class="list-group-item clearfix">
	            	<a href="${BASE_PATH }/type/${types.ename}.htm">
	            	<i class="fa fa-angle-right"></i> 
	            	${types.goodsTypeName }
	            	</a>
	            	</li>
	            	</#if>
            	<#else>
            	<#if types.hasSubType >
            		<li class="list-group-item clearfix dropdown active">
		            	<a href="javascript:void(0);" class="">
		                  <i class="fa fa-angle-right"></i>
		                  ${types.goodsTypeName }
		                  <i class="fa fa-angle-down"></i>
		                </a>
		              	<#list types.subType as subType>
		                <ul class="dropdown-menu" style="display:none;">
		                  	<li>
		                  		<a href="${BASE_PATH }/type/${subType.ename}.htm">
		                  			<i class="fa fa-circle"></i>
		                  			${subType.goodsTypeName }       			
		                  		</a>
		                  	</li>                 	
	                  	</ul>
		                </#list>
                  	</li>
	            	<#else>
	            	<li class="list-group-item clearfix dropdown active">
	            	<a href="${BASE_PATH }/type/${types.ename}.htm">
	            	<i class="fa fa-angle-right"></i> 
	            	${types.goodsTypeName }
	            	</a>
	            	</li>
	            	</#if>
            	</#if>
            	
            </#list>
              
              
            </ul>

            <div class="sidebar-filter margin-bottom-25">
              

              <h3>价格</h3>
              <p>
                <label>最大:</label>
                <input type="text" id="amount1" style="border:0; color:#f6931f; font-weight:bold;" value="0">
              </p>
              <p>
                <label>最小:</label>
                <input type="text" id="amount1" style="border:0; color:#f6931f; font-weight:bold;" value="0">
              </p>
              <p>
                <label><a href=""#><i class="fa fa-search"></i></a></label>
              </p>
              
              
            </div>

            <div class="sidebar-products clearfix">
              <h2>推荐商品</h2>
              <div class="item">
                <a href="item.html"><img src="${BASE_PATH }/static/assets/temp/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="item.html">女士手表</a></h3>
                <div class="price">$31.00</div>
              </div>
              <div class="item">
                <a href="item.html"><img src="${BASE_PATH }/static/assets/temp/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="item.html">123</a></h3>
                <div class="price">$23.00</div>
              </div>
              <div class="item">
                <a href="item.html"><img src="${BASE_PATH }/static/assets/temp/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="item.html">123</a></h3>
                <div class="price">$86.00</div>
              </div>
            </div>
          </div>
          <!-- END SIDEBAR -->

    