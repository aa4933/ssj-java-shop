<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2016/12/29
  Time: 下午5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="slider.jsp"></jsp:include>

<title>登录／注册</title>

<div class="login-content">
    <div class="container">
        <div class="login-page">
            <div class="account_grid">
                <div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
                    <h3>新用户注册</h3>
                    <p>通过创建一个私人账户在我们的商店，您将能够通过结帐过程更快，存储多个送货地址，查看和跟踪您的订单在您的帐户和更多。</p>
                    <a class="acount-btn" href="register">注册</a>
                </div>
                <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
                    <h3>注册用户登录</h3>
                    <p>如果您已经注册帐户，请登录。</p>
                    <form method="post" action="/login/login">
                        <div>
                            <span>登录用户名<label>*</label></span>
                            <input name="name" type="text" value="" >
                        </div>
                        <div>
                            <span>登录密码<label>*</label></span>
                            <input name="password" type="password" value="">
                        </div>
                                <input type="submit" value="登录">
                        &nbsp;&nbsp;&nbsp;
                                <input type="reset" value="取消">
                                <a class="forgot" href="#">忘记密码？</a>

                    </form>
                </div>
                <div class="clearfix"> </div>
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


<jsp:include page="layout/footer.jsp"></jsp:include>