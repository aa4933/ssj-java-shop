<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/3
  Time: 下午12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="layout/header.jsp"></jsp:include>
<div class="bolg-posts">
    <div class="container">
        <div class="single">


            <div class="single-top">
                <img src="${product.pimage}" alt=" ">
                <%--<img  src="static/font/images/single-post-img.jpg" alt=""/>--%>
            </div>


            <div class="top-single">
                <h2>${product.pname}</h2>
                <div class="grid-single">
                    <div class="single-one"><span><i> </i>${product.pprice}（元）</span></div>


                    <%--<div class="clearfix"> </div>--%>
                </div>



                <div class="leave">
                    <form action="/shop/cart?id=${product.pid}" method="post">

                        <div class="text-top">
                            <div class="col-md-4 text-in">
                                <div class="eget">
                                    ${product.pdescription}
                                </div>
                                <input type="submit" value="加入购物车" >
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                </div>


                <div class="top-comments">
                    <h3>${ideaNum}条评价</h3>
                    <c:forEach items="${ideas}" var="idea">
                        <div class="met">
                            <div class="code-in">
                                <p class="smith"><a href="#">${idea.cname}</a> <span>${idea.newtime}</span></p>

                                <c:if test="${idea.cheader==null}">
                                <p class="reply"><a href="reply?id=${idea.id}"><i> </i>回复</a></p>
                                </c:if>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="comments-top-top">
                                <div class="men" >
                                    <img   src="static/font/images/men.png" alt="">
                                </div>
                                <p class="men-it">${idea.newmessage} </p>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <c:if test="${idea.cheader!=null}">
                            <div class="met met-in">
                                <div class="code-in">
                                    <p class="smith"><a href="#">${idea.cheader}</a> <span>${idea.retime}</span></p>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="comments-top-top top-in">
                                    <div class="men" >
                                        <img   src="static/font/images/men.png" alt="">
                                    </div>
                                    <p class="men-it">
                                    ${idea.remessage}
                                    </p>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="leave">
                    <form method="get" action="/shop/comment">
                        <div class="text-top">
                            <div class="col-md-8 text-in">
                                <textarea name="comment"  value=" " onfocus="this.value='';" onblur="if (this.value == '') {this.value = '您的意见对我们很重要！';}">您的意见对我们很重要！</textarea>
                            </div>
                            <div class="col-md-4 text-in">
                                <input type="text" name="pid" value="${product.pid}" style="display: none">
                                &nbsp;&nbsp;&nbsp;
                                <input type="submit" value="提交评价" >
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                    <p>您可以在这里对产品作出您的想法和意见，或者评价</p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>



<jsp:include page="layout/footer.jsp"></jsp:include>