<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 17.10.2016
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <jsp:useBean id="user" class="bean1.User" scope="session" />
</head>
<body>
    <div class="hat">
        <a href = "/"> <img src = "../image/logo.png" width="90" height="70"></a>
        <h3>PetShop</h3>
        <div class="basket">
            <c:if test="${user.auth==null}">
                <a href="/s2?page=list&lang=<%=lang%>" class="button1"><%=res.getString("login")%></a>
            </c:if>
            <c:if test="${user.auth=='1'}">
                <a href="/s?page=office&lang=<%=lang%>" class="aBas">${user.name}</a>
                <a href="/s3?page=list" class="button1"><%=res.getString("logout")%></a>
            </c:if>
            <a href="/s2?page=history&lang=<%=lang%>" class="button1"><%=res.getString("history")%></a>
            <c:if test="${f:getSize()>0}">
                <a href="/s2?page=order&lang=<%=lang%>" class="button1"><%=res.getString("checkout")%></a>
            </c:if>
            <a href="/jsp/basket.jsp?lang=<%=lang%>"> <img src="../image/basket.png"></a>
            <p id="productsInBasket"> ${f:getSize()}</p>
        </div>
        <div class="language">
            <a href = "?lang=ru_RU"> <img src = "../image/russia.png" width="30" height="30"></a>
            <a href = "?lang=en_GB"> <img src = "../image/england.png" width="30" height="30"></a>
            <a href = "?lang=be_BY"> <img src = "../image/belarus.png" width="30" height="30"></a>
        </div>
    </div>
</body>
</html>
