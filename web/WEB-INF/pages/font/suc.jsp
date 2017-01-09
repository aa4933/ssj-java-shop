<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/3
  Time: 下午4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>

<div class="domain">
    <div class="container">
        <div class="row PageHead">
            <div class="col-md-12">
                <h1>支付成功！</h1>
                <h3>您可以继续选购或者退出</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <form action="/" method="get">
                    <input type="hidden" name="direct" value="true"/>
                    <div class="row">
                    </div>
                    <div class="submitbtn">
                        <input type="submit" class="btn btn-success btn-lg" value="完成"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<jsp:include page="layout/footer.jsp"></jsp:include>

