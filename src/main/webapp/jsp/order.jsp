<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <script type="text/javascript">
        var colArray = [${pageContext.request.parameterMap.CoordX[0]}];
        var colArray1 = [${pageContext.request.parameterMap.CoordY[0]}];
        var colArray2 = [${pageContext.request.parameterMap.Address[0]}];
        var colArray3 = [${pageContext.request.parameterMap.Name[0]}];
        var colArray4 = [${pageContext.request.parameterMap.Id[0]}];
    </script>
</head>
<body onload="initialize(colArray,colArray1,colArray2,colArray3,colArray4);">
    <div class="bodyOffice">
        <div class="hat">
            <a href = "/?lang=${lang}"> <img src = "../image/logo.png" width="90" height="70"></a>
            <h3>PetShop</h3>
            <div class="basket">
                <a href="/s?page=office&lang=${lang}" class="aBas">${user.name}</a>
                <a href="/s3?page=list&lang=${lang}" class="button1"><fmt:message key="logout" /></a>
                <a href="/s2?page=history&lang=${lang}" class="button1"><fmt:message key="history" /></a>
                <a href="/jsp/basket.jsp?lang=${lang}"><img src="../image/basket.png"></a>
                <p id="productsInBasket"> ${f:getSize()} </p>
            </div>
            <div class="language">
                <a href = "?page=order&lang=ru_RU" onclick="addCookie('ru_RU');"> <img src = "../image/russia.png" width="30" height="30"></a>
                <a href = "?page=order&lang=en_GB" onclick="addCookie('en_GB');"> <img src = "../image/england.png" width="30" height="30"></a>
                <a href = "?page=order&lang=be_BY" onclick="addCookie('be_BY');"> <img src = "../image/belarus.png" width="30" height="30"></a>
            </div>
        </div>
        <div class="orderBas">
            <h2><fmt:message key="youOrder"/></h2>
            <c:forEach var="product" items="${f:getBasketList()}" >
                <div class="productBasket1">
                    <h4><fmt:message key="${f: getAnimal(product.key).name}"/></h4>
                    <p id="price3">${f: getAnimal(product.key).cost}</p>
                    <p id="countProd"><fmt:message key="count"/> ${product.value}</p>
                    <p class="description2"><fmt:message key="${f: getAnimal(product.key).description}"/></p>
                    <img src="${f: getAnimal(product.key).img}.jpg" width="200px" height="150px">
                    <hr>
                </div>
            </c:forEach>
        </div>
        <div class="navBar">
            <a href="#" id="navBarA1" class="menu1" style="color: #600083;" onclick="show1('1');"><fmt:message key="takeAway"/></a>
            <a href="#" id="navBarA2" class="menu1" onclick="show1('2');"><fmt:message key="delivery"/></a>
        </div>
        <div id="takeAway" class="specification1" style="display: block;">
            <ul>
                <li>
                    <div id="map_canvas"></div>
                </li>
                <form method="post" action="/s4?lang=${lang}">
                    <li id="liTake">
                        <c:forEach var="shop" items="${sessionScope.shops}">
                            <div class="shop">
                                <input id="radio${shop.idShop}" class="radioShop" type="radio" name="shop" value="${shop.address}"><fmt:message key="${shop.nameShop}"/>
                                <p><fmt:message key="${shop.address}"/></p>
                            </div>
                        </c:forEach>
                    </li>
                    <p class="sumOrder"><fmt:message key="sum"/></p>
                    <p class="sumOrder1">${f:getSum()}</p>
                    <input class="button4" type="submit" value="<fmt:message key="order"/>">
                </form>
            </ul>
        </div>
        <div id="delivery" class="specification1" style="display: none;">
            <form method="post" action="/s4?lang=${lang}">
                <label><fmt:message key="city"/></label><br>
                <input class="deliveryInp" name="city" type="text" placeholder="City" size="50"/><br>
                <label><fmt:message key="region"/></label><br>
                <input class="deliveryInp" name="region" type="text" placeholder="Region" size="50"/><br>
                <label><fmt:message key="street"/></label><br>
                <input class="deliveryInp" name="street" type="text" placeholder="Street" size="50"/><br>
                <label><fmt:message key="house"/></label><br>
                <input class="deliveryInp" name="house" type="text" placeholder="House" size="50"/><br>
                <p class="sumOrder"><fmt:message key="sum"/></p>
                <p class="sumOrder1">${f:getSum()}</p>
                <input class="button4" type="submit" value="<fmt:message key="order"/>">
            </form>
        </div>
    </div>
</body>
</html>
