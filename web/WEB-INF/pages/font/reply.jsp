<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/3
  Time: 下午6:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>
<!--contact-->
<div class="contact">
    <div class="container">
        <div class="contact-form">
            <h4>请填写您的回复</h4>
            <form method="get" action="/shop/reply">
                <input type="text" name="id" value="${id}" style="display: none">
                <textarea type="text" name="comment"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
                <input type="submit" value="提交回复" >
            </form>
        </div>

    </div>
</div>


<jsp:include page="layout/footer.jsp"></jsp:include>
