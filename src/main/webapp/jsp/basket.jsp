<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 23.10.2016
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <script src="../js/script.js"></script>
    <c:if test="${empty pageContext.request.parameterMap.lang[0]}">
        <c:choose>
            <c:when test="${empty cookie.lang.value}">
                <fmt:setLocale value="ru_RU"/>
            </c:when>
            <c:otherwise>
                <fmt:setLocale value="${cookie.lang.value}"/>
            </c:otherwise>
        </c:choose>
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
    <jsp:useBean id="basket" class="bean1.BasketList" scope="session" />
    <jsp:useBean id="user" class="bean1.User" scope="session" />
    <title><fmt:message key="title"/></title>
</head>
<body>
    <div class="body2">
        <div class="hat">
            <a href = "/?lang=${lang}"> <img src = "../image/logo.png" width="90" height="70"></a>
            <h3>PetShop</h3>
            <div class="basket">
                <c:if test="${user.auth==null}">
                    <a href="/s2?page=bas&lang=${lang}" class="button1"><fmt:message key="login" /></a>
                </c:if>
                <c:if test="${user.auth=='1'}">
                    <a href="/jsp/office.jsp" class="aBas">${user.name}</a>
                    <a href="/s3?page=bas" class="button1"><fmt:message key="logout" /></a>
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
        <div class="hBasket">
            <h3 id="hBasket"><fmt:message key="basket"/></h3>
            <form action="/s1" method="post">
                <input type="submit" id="button2" name="idClear" value="<fmt:message key="clearBasket"/>">
            </form>
        </div>
        <div class="goods">
            <c:forEach var="product" items="${f:getBasketList()}" >
                <div class="productBasket">
                    <h4><fmt:message key="${f: getAnimal(product.key).name}"/></h4>
                    <p id="price2">${f: getAnimal(product.key).cost}</p>
                    <div class="number">
                        <form action="/s1" method="post">
                            <input name="idM" type="image" src="../image/minus-big-symbol.png" value="${product.key}" >
                        </form>
                        <input type="text" value="${product.value}" size="3"/>
                        <form action="/s1" method="post">
                            <input name="idP" type="image" src="../image/add-icon.png" value="${product.key}">
                        </form>
                    </div>
                    <img src="${f: getAnimal(product.key).img}.jpg" width="200px" height="150px">
                    <p class="description1"><fmt:message key="${f: getAnimal(product.key).description}"/></p>
                    <hr>
                </div>
            </c:forEach>
        </div>
        <div class="order">
            <h3><fmt:message key="youOrder"/></h3>
            <h4><fmt:message key="allOrder"/></h4>
            <h4 id="countOrder">${f:getSize()}</h4>
            <h4 id="sum"><fmt:message key="sum"/>: ${f:getSum()}</h4>
            <a href="/s2?page=order"><input type="button" id="button3" value="<fmt:message key="checkout"/>"></a>
        </div>
    </div>
</body>
</html>
