<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 01.11.2016
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyDVzWKXbnX2Iz2bn-C_FEAfz_Z032mVZs4"></script>
    <title>Order</title>
    <script src="../js/script.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
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
    <%--<%--%>
        <%--double[] arrX ={59.970960891326854, 59.970960891326854 };--%>
        <%--double[] arrY ={30.319606160730018, 30.34724364241947 };--%>
        <%--String[] address={"wer","yyyy"};--%>
        <%--String[] shop={"PS1","PS2"};--%>
        <%--StringBuffer values = new StringBuffer();--%>
        <%--for (int i = 0; i < arrX.length; ++i) {--%>
            <%--if (values.length() > 0) {--%>
                <%--values.append(',');--%>
            <%--}--%>
            <%--values.append('"').append(arrX[i]).append('"');--%>
        <%--}--%>
        <%--StringBuffer values1 = new StringBuffer();--%>
        <%--for (int i = 0; i < arrY.length; ++i) {--%>
            <%--if (values1.length() > 0) {--%>
                <%--values1.append(',');--%>
            <%--}--%>
            <%--values1.append('"').append(arrY[i]).append('"');--%>
        <%--}--%>
        <%--StringBuffer values2 = new StringBuffer();--%>
        <%--for (int i = 0; i < address.length; ++i) {--%>
            <%--if (values2.length() > 0) {--%>
                <%--values2.append(',');--%>
            <%--}--%>
            <%--values2.append('"').append(address[i]).append('"');--%>
        <%--}--%>
        <%--StringBuffer values3 = new StringBuffer();--%>
        <%--for (int i = 0; i < shop.length; ++i) {--%>
            <%--if (values3.length() > 0) {--%>
                <%--values3.append(',');--%>
            <%--}--%>
            <%--values3.append('"').append(shop[i]).append('"');--%>
        <%--}--%>
    <%--%>--%>
    <script type="text/javascript">
        var colArray = [${pageContext.request.parameterMap.CoordX[0]}];
        var colArray1 = [${pageContext.request.parameterMap.CoordY[0]}];
        var colArray2 = [${pageContext.request.parameterMap.Address[0]}];
        var colArray3 = [${pageContext.request.parameterMap.Name[0]}];
    </script>
</head>
<body onload="initialize(colArray,colArray1,colArray2,colArray3);">
    <div class="bodyOffice">
        <div class="hat">
            <a href = "/?lang=${lang}"> <img src = "../image/logo.png" width="90" height="70"></a>
            <h3>PetShop</h3>
            <div class="basket">
                <a href="/jsp/office.jsp?lang=${lang}" class="aBas">${user.name}</a>
                <a href="/s3?page=list&lang=${lang}" class="button1"><fmt:message key="logout" /></a>
                <a href="#" class="button1"><fmt:message key="history" /></a>
                <a href="/jsp/basket.jsp?lang=${lang}"><img src="../image/basket.png"></a>
                <p id="productsInBasket"> ${f:getSize()} </p>
            </div>
            <div class="language">
                <a href = "?page=order&lang=ru_RU" onclick="addCookie('ru_RU');"> <img src = "../image/russia.png" width="30" height="30"></a>
                <a href = "?page=order&lang=en_GB" onclick="addCookie('en_GB');"> <img src = "../image/england.png" width="30" height="30"></a>
                <a href = "?page=order&lang=be_BY" onclick="addCookie('be_BY');"> <img src = "../image/belarus.png" width="30" height="30"></a>
            </div>
        </div>
        <div id="map_canvas"></div>
    </div>
</body>
</html>
