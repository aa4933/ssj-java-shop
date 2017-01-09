<%--
  Created by IntelliJ IDEA.
  User: xiaoqiang
  Date: 2017/1/2
  Time: 下午4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"></jsp:include>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>商城</title>

<div class="bolg-posts">
    <div class="container">
        <div class="blog">
            <c:forEach items="${products}" var="product">
                <div class="col-md-6 blog-top">
                    <div class="blog-in">
                        <a href="product?id=${product.pid}"><img src="${product.pimage}" alt=" "></a>
                        <div class="blog-grid">
                            <h3><a href="#">
                                    ${fn:substring(product.pname, 0, 10)}
                            </a></h3>
                            <p>
                                ${fn:substring(product.pdescription, 0, 80)}</p>
                            <a href="product?id=${product.pid}" class="more">商品详情</a>
                            <div class="date">
                                <span class="date-in"><i> </i>${product.pprice}元</span>
                                <%--<div class="clearfix"> </div>--%>
                            </div>
                        </div>
                    </div>
                    <i class="black"> </i>
                </div>
            </c:forEach>

            <div class="clearfix"> </div>
            <ul class="start">
                <c:forEach begin="1" end="${pages}"  step="1" varStatus="i">

                    <c:choose>
                        <c:when test="${i.index== page }">
                            <li><span>${i.index}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="shop?page=${i.index}">${i.index}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>




<jsp:include page="layout/footer.jsp"></jsp:include>