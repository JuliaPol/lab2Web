<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 23.10.2016
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="f" uri="/tld/tag1.tld" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <script src="../js/script.js"></script>
    <c:if test="${empty pageContext.request.parameterMap.lang[0]}">
        <fmt:setLocale value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'ru'}">
        <fmt:setLocale value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'en'}">
        <fmt:setLocale value="en_GB"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'be'}">
        <fmt:setLocale value="be_BY"/>
    </c:if>
    <fmt:setBundle basename="Shop"/>
    <title><fmt:message key="title"/></title>
</head>
<body>
    <div class="body">
        <div class="hat">
            <a href = "/"> <img src = "../image/logo.png" width="90" height="70"></a>
            <h3>PetShop</h3>
            <div class="basket">
                <a href="#" class="button1"><fmt:message key="login" /></a>
                <a href="#" class="button1"><fmt:message key="history" /></a>
                <a href="/jsp/basket.jsp"><img src="../image/basket.png"></a>
            </div>
            <div class="language">
                <a href = "?lang=ru"> <img src = "../image/russia.png" width="30" height="30"></a>
                <a href = "?lang=en"> <img src = "../image/england.png" width="30" height="30"></a>
                <a href = "?lang=be"> <img src = "../image/belarus.png" width="30" height="30"></a>
            </div>
        </div>
        <div class="hBasket">
            <h3 id="hBasket"><fmt:message key="basket"/></h3>
            <input type="button" id="button2" value="<fmt:message key="clearBasket"/>">
        </div>
        <div class="goods">
            <c:forEach var="product" items="${f: getProductList()}" >
                ${f:getProductList()}
                <c:import url="productInBasket.jsp" />
            </c:forEach>
        </div>
        <div class="order">
            <h3><fmt:message key="youOrder"/></h3>
            <h4><fmt:message key="allOrder"/></h4>
            <h4 id="countOrder">${countOrder}</h4>
            <h4 id="sum">${sumPrice}</h4>
            <input type="button" id="button3" value="<fmt:message key="checkout"/>">
        </div>
    </div>


</body>
</html>
