<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/1
  Time: 下午5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>
<!-- #Testimonials -->
<div id="testimonialWrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div id="testimonialPicture"></div>
            </div>
            <div class="col-md-7 col-md-offset-1">
                <h2>您可以在下面修改信息</h2>
                <h3>“MyVPS is awesome! Reliable, secure hosting, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel pharetra diam. Aenean convallis nibh facilisis risus and clients. 9/12, 5 Stars all around lorem ipsum dolto sit amet!”</h3>
                <a href="#">修改头像</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- /#Testimonials -->

<div class="register-content">
    <div class="container">
        <div class="register">
            <form method="post" action="/login/alter">
                <div class="register-top-grid">
                    <h3>基本信息</h3>

                    <input name="cid" type="text" value="${user.cid}" style="display: none">
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>登录用户名<label>*</label></span>
                        <input name="username" type="text" value="${user.cusername}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>真实姓名<label>*</label></span>
                        <input name="realname" type="text" value="${user.crealname}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>登录密码<label>*</label></span>
                        <input name="password" type="text" value="${user.cpassword}">
                    </div>

                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>电话号码<label>（选填）</label></span>
                        <input name="phone" type="text" value="${user.cphone}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>验证问题<label>（选填）</label></span>
                        <input name="question" type="text" value="${user.cquestion}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>验证回答<label>（选填）</label></span>
                        <input name="answer" type="text" value="${user.canswer}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>邮箱<label>（选填）</label></span>
                        <input name="email" type="text" value="${user.cemail}">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>地址<label>（选填）</label></span>
                        <input name="address" type="text" value="${user.caddress}">
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <!--
                <div class="register-bottom-grid">
                    <h3>LOGIN INFORMATION</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Password<label>*</label></span>
                        <input type="password">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Confirm Password<label>*</label></span>
                        <input type="password">
                    </div>
                </div>
                -->

                <div class="clearfix"> </div>
                <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
                    <input type="submit" value="修改信息">
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp"></jsp:include>