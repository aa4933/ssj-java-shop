<%--
  Created by IntelliJ IDEA.
  User: wuilly
  Date: 2017/1/3
  Time: 下午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="layout/header.jsp"></jsp:include>
<div class="domain-section">
    <div class="about_grid">
        <div class="container">
            <h4 class="domain-head">请填写地址并且选择支付方式</h4>
            <form class="search-form domain-search" method="post" action="/shop/balance">
                <div class="three-fifth domain_row column first">
                    <input type="text" name="address" class="text" value="请输入您的地址" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入您的地址';}">
                </div>
                <div class="one-fifth column">
											<span class="selection-box">
                                                <select class="domains valid" name="payment">
                            <c:forEach items="${payment}" var="i">
                                <option name="${i.payid}" value="${i.paypayment}">${i.paypayment}</option>
                            </c:forEach>
											    </select>
                                            </span>
                </div>
                <div class="one-fifth column">
                    <input type="submit" value="去支付">
                </div>
                <div class="clearfix"> </div>
            </form>
        </div>
    </div>

    <div class="new-domains">
        <div class="container">
            <h4 class="domain-head1">以下是您选购的物品</h4>
            <div class="new_domain">
                <div class="col-md-6">
                    <ul class="list_3">
                        <c:forEach items="${order}" var="i">
                            <li><span>商品编号：${i.pid}</span>数量：${i.pnumber}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="layout/footer.jsp"></jsp:include>