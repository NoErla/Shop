<#include "head.ftl" >

    <div class="clear"></div>
    <div id="myCarousel" class="carousel " data-ride="carousel" data-interval="2000"style="border:0px;width:80%;height:400px;margin:0 10%;">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;</a>
    </div>

    <div class="clear"></div>

    <div class="i_container">
        <div class="i_container_in">
            <div class="i_video" id="com_indexistop_videos">
                <div class="title01">
                    <h3>公司简介</h3>
                </div>
                
            
            </div>

            <div class="i_video">
                <div class="title01">
                    <h3>项目</h3>
					<span><a href="${BASE_PATH}/folder/products.htm"> 更多 </a>
					</span>
                </div>
                </div>
            </div>
            <div class="i_video">
                <div class="title01">
                    <h3>政策法规</h3>
					<span><a href="${BASE_PATH}/blog/news/policy.htm"> 更多 </a>
					</span>
                </div>
                <div class="i_news_l">
                    <ul>
                        

                    </ul>
                </div>
            </div>
            <div class="i_news" id="com_indexistop_news">
                <div class="title01">
                    <h3>推荐新闻</h3>
                    <span> <a href="${BASE_PATH}/blog/article/news.htm">更多</a> </span>
                </div>
                <div class="i_news_l">
                    <ul>
                        
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>

    <div class="m_background" id="com_rotationbg"></div>
    <script type="text/javascript">

        //修改导航
        function load() {
            $("ul#navctive li:eq(1) a").removeClass("nava").addClass("navactive");
            $(".carousel-inner").find("div.item").eq(0).addClass("active");

        }
    </script>
    <div class="clear"></div>
    <!-- /.row -->

    <#include "footer.ftl">