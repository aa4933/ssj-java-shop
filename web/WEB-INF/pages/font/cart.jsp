<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/2
  Time: 下午4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="bolg-posts">
    <div class="container">
        <div class="blog">
            <c:forEach items="${carts}" var="cart">
                <div class="col-md-6 blog-top">
                    <div class="blog-in">
                        <a href="single.html"><img src="static/font/images/b3.jpg" alt=" "></a>
                        <div class="blog-grid">
                            <h3><a href="single.html">商品编号${cart.pid}</a></h3>
                            <p>商品数量${cart.pnumber}</p>
                            <div class="date">
                                <span class="date-in"><i> </i>${cart.pprice}元</span>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <i class="black"> </i>
                </div>
            </c:forEach>
            <div class="clearfix"> </div>
            <a href="balance" class="more">去结算</a>
        </div>
    </div>

</div>


<jsp:include page="layout/footer.jsp"></jsp:include>