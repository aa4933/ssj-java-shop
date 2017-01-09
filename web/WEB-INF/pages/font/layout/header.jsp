<%--
  Created by IntelliJ IDEA.
  User: xiaoqiang
  Date: 2016/12/29
  Time: 下午5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
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
</head>
<body>
<!-- Header Starts Here -->
<div class="banner inner-banner" >
    <div class="header">
        <div class="container">
            <div class="logo">
                <a href="#"><img src="static/font/images/logo.png" alt=""></a>
            </div>
            <div class="search-bar">
                <input type="text"  value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '搜索';}">
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

        </div>
    </div>

</div>
<div class="clearfix"> </div>
<!-- Header Ends Here -->