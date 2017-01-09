<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/1
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>

<div class="register-content">
    <div class="container">
        <div class="register">
            <form method="post" action="/login/register">
                <div class="register-top-grid">
                    <h3>基本信息</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>登录用户名<label>*</label></span>
                        <input name="username" type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>真实姓名<label>*</label></span>
                        <input name="realname" type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>登录密码<label>*</label></span>
                        <input name="password" type="password">
                    </div>
                    <div class="clearfix"> </div>
                </div>

                <div class="clearfix"> </div>
                    <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
                        <input type="submit" value="注册">
                        &nbsp;&nbsp;&nbsp;
                        <input type="reset" value="取消">
                    </div>
            </form>
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