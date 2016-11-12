<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 11.11.2016
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bean1.*" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <script src="../js/script.js"></script>
    <jsp:useBean id="user" class="bean1.User" scope="session" />
    <jsp:useBean id="basket" class="bean1.BasketList" scope="session" />
    <c:if test="${empty pageContext.request.parameterMap.lang[0]}">
        <c:set var="lang" value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'ru_RU'}">
        <fmt:setLocale value="ru_RU"/>
        <c:set var="lang" value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'en_GB'}">
        <fmt:setLocale value="en_GB"/>
        <c:set var="lang" value="en_GB"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'be_BY'}">
        <fmt:setLocale value="be_BY"/>
        <c:set var="lang" value="be_BY"/>
    </c:if>
    <fmt:setBundle basename="Shop"/>
</head>
<body>
<div class="bodyHistory">
    <div class="hat">
        <a href = "/?lang=${lang}"> <img src = "../image/logo.png" width="90" height="70"></a>
        <h3>PetShop</h3>
        <div class="basket">
            <a href="/s?page=office&lang=${lang}" class="aBas">${user.name}</a>
            <a href="/s3?page=list&lang=${lang}" class="button1"><fmt:message key="logout" /></a>
            <a href="/s2?page=history&lang=${lang}" class="button1"><fmt:message key="history" /></a>
            <c:if test="${f:getSize()>0}">
                <a href="/s2?page=order&lang=${lang}" class="button1"><fmt:message key="checkout"/></a>
            </c:if>
            <a href="/jsp/basket.jsp?lang=${lang}"><img src="../image/basket.png"></a>
            <p id="productsInBasket"> ${f:getSize()} </p>
        </div>
        <div class="language">
            <a href = "?page=office&lang=ru_RU" onclick="addCookie('ru_RU');"> <img src = "../image/russia.png" width="30" height="30"></a>
            <a href = "?page=office&lang=en_GB" onclick="addCookie('en_GB');"> <img src = "../image/england.png" width="30" height="30"></a>
            <a href = "?page=office&lang=be_BY" onclick="addCookie('be_BY');"> <img src = "../image/belarus.png" width="30" height="30"></a>
        </div>
    </div>
    <h2 id="history"><fmt:message key="history"/></h2>
    <div class="history">
        <c:forEach var="order1" items="${sessionScope.orders}">
            <div class="historyOffice">
                <ul>
                    <li id="historyLi1">
                        <p><fmt:message key="${order1.product}"/></p>
                        <c:if test="${fn:length(order1.address) > 3}">
                            <p>${order1.address}</p>
                        </c:if>
                        <c:if test="${fn:length(order1.address) == 3}">
                            <p><fmt:message key="${order1.address}"/></p>
                        </c:if>
                    </li>
                    <li id="historyLi2">
                        <p><fmt:message key="count"/> ${order1.countProduct}</p>
                        <p><fmt:message key="date"/> ${order1.date}</p>
                    </li>
                </ul>
                <hr>
            </div>
        </c:forEach>
    </div>
</body>
</html>
