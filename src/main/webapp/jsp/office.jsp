<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 01.11.2016
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bean1.*" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office</title>
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
    <div class="bodyOffice">
        <div class="hat">
            <a href = "/"> <img src = "../image/logo.png" width="90" height="70"></a>
            <h3>PetShop</h3>
            <div class="basket">
                <c:if test="${user.auth==null}">
                    <a href="/s2?page=list" class="button1"><fmt:message key="login" /></a>
                </c:if>
                <c:if test="${user.auth=='1'}">
                    <a href="/jsp/office.jsp" class="aBas">${user.name}</a>
                    <a href="/s3?page=list" class="button1"><fmt:message key="logout" /></a>
                </c:if>
                <a href="#" class="button1"><fmt:message key="history" /></a>
                <a href="/jsp/basket.jsp"><img src="../image/basket.png"></a>
                <p id="productsInBasket"> ${f:getSize()} </p>
            </div>
            <div class="language">
                <a href = "?lang=ru_RU" onclick="addCookie('ru_RU');"> <img src = "../image/russia.png" width="30" height="30"></a>
                <a href = "?lang=en_GB" onclick="addCookie('en_GB');"> <img src = "../image/england.png" width="30" height="30"></a>
                <a href = "?lang=be_BY" onclick="addCookie('be_BY');"> <img src = "../image/belarus.png" width="30" height="30"></a>
            </div>
        </div>
        <div class="userOffice">
            <h2><fmt:message key="yourName"/>${user.name}</h2>
            <h2><fmt:message key="mark" /></h2>
        </div>
    </div>
</body>
</html>
