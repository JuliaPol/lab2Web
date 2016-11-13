<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 02.11.2016
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bean1.*" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <script>setInterval(function(){myTimer('${lang}')},1000);</script>
</head>
<body onload="loadXMLDoc()">
<div class="bodyOffice">
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
    <h1><fmt:message key="office"/></h1>
    <div class="userOffice">
        <h2><fmt:message key="yourName"/>${user.name}</h2>
        <p id="date"></p>
        <h2><fmt:message key="mark"/>${pageContext.request.parameterMap.paramO[0]}</h2>
        <a id="history1" href="/s2?page=history&lang=${lang}" ><fmt:message key="history1"/></a>
    </div>
    <div class="officeComments">
        <h2><fmt:message key="comment"/></h2>
        <textarea id="comment" name="comment" rows="10" cols="45"></textarea><br>
        <input class="button5" type="submit" value="<fmt:message key="send"/>" onclick="loadXMLDoc()">
    </div>
    <div id="RESULT"></div>
</div>
</body>
</html>
