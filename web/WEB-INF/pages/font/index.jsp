<%--
  Created by IntelliJ IDEA.
  User: xiaoqiang
  Date: 2016/12/29
  Time: 下午5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content=" " />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="static/font/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="static/font/js/jquery-1.11.1.min.js"></script>
    <!-- Custom Theme files -->
    <link href="static/font/css/style.css" rel='stylesheet' type='text/css' />

    <!-- Custom Theme files -->
    <!-- dropdown -->
    <script src="static/font/js/jquery.easydropdown.js"></script>
    <link href="static/font/css/nav.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="static/font/js/move-top.js"></script>
    <script type="text/javascript" src="static/font/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- end-smoth-scrolling -->
<!-- Header Starts Here -->

<div class="banner" >

    <div class="header">

        <div class="container">
            <div class="logo">
                <a href="#"><img src="static/font/images/logo.png" alt=""></a>
            </div>
            <div class="search-bar">
                <input type="text"  value="搜索" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '搜索';}">
                <input type="submit" value="" />
            </div>
            <span class="menu">菜单</span>

            <div class="banner-top">
                <ul class="nav banner-nav">
                    <li><a class="active" href="/">首页</a></li>

                    <li class="dropdown1"><a class="down-scroll" href="shop?page=1">商城</a>
                        <ul class="dropdown2">
                            <li><a href="shop?page=1">全部产品</a></li>
                            <c:forEach items="${res}" var="mainType">
                                <li><a href="shop?type=${mainType.tid}&&page=1">${mainType.ttype}</a></li>
                            </c:forEach>
                        </ul>
                    </li>

                    <c:choose>
                        <c:when test="${suc== 1 }">
                            <li class="dropdown1"><a class="down-scroll" href="">${username}</a>
                                <ul class="dropdown2">
                                    <c:if test="${cart >0 }">
                                        <li><a href="cart">购物车(${cart})</a></li>
                                    </c:if>
                                    <li><a href="user">个人信息</a></li>
                                    <li><a href="logout">退出登录</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="dropdown1"><a href="login">登录／注册</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <script>
                    $("span.menu").click(function(){
                        $(" ul.nav").slideToggle("slow" , function(){
                        });
                    });
                </script>
            </div>
            <div class="clearfix"> </div>
            <%--<jsp:include page="slider.jsp"></jsp:include>--%>
        </div>
        </div>

</div>
<div class="clearfix"> </div>
<div class="copyrights">Collect from <a href="http://www.timestroy.com.cn" >时光故事</a></div>
<!-- Header Ends Here -->




<div class="best">
    <div class="container">
        <article>
            <figure class="float-left"><img src="static/font/images/470x240.jpg" alt="Placeholder"></figure>
            <h2><span>高端定制</span> For You</h2>
            <p>时间故事手表绝不是简单的计时工具，甚至也不是一件装饰。它更是融入了当下最时尚的元素与卓越的设计理念，更能凸显您不凡的品位。时间故事更加入了人性化的设计，您可以上传您的照片或是文字，说出您平日难以表达的话语，我们将尽最大努力满足您的需要，全力打造您的专属手表，彰显您的个性，真正做到“我的手表我做主”!</p>
        </article>
    </div>
</div>


<div class="fullwidth-section semi-background">
    <div class="fullwidth-bg">
        <div class="overlay left-aligned">
            <div class="dt-sc-one-half column first">
                <div class="dt-support">
                    <h2>致力于奉献</h2>
                    <p>作为一个尊贵的高端客户，享受直接支持的专家，体验我们最完善、最体贴的私人定制服务随时调用专用热线</p>
                    <span>880-866-8888</span>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- #Testimonials -->
<div id="testimonialWrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div id="testimonialPicture"></div>
            </div>
            <div class="col-md-7 col-md-offset-1">
                <h2>品牌介绍</h2>
                <h3>“时间故事以人与人之间的感情为主题，现有爱情故事、亲情故事、友情故事、亲子故事、商务和时光倒流故事六个系列当一些话说不出口，一些爱无法言语时，让时间故事替您表达吧!送给孩子，记录他成长中的点点滴滴，让他感受到您浓浓的爱与期望;送给爸妈，刻下那无法言语的爱，让字字的思念和句句的牵挂带去您对父母深深的祝福;送给恋人，为他(她)书写浪漫情书，刻下爱的誓言，让爱情升温;送给好友，可以在表上刻下你们的友情故事，或是一些悄悄话，或是几句贴心的话语，都会加深你们间的友谊;送给您的客户，它将拉近彼此间的商界友谊，成为客户长久珍藏的最佳礼品。时间故事，让您的爱情更甜蜜，亲情更坚固，友情更深厚，人生更加精彩!”</h3>
                <a href="#">-www.timestory.com.cn-</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- /#Testimonials -->

<!-- #Footer -->
    <jsp:include page="layout/footer.jsp"></jsp:include>
<!-- /#Footer -->


