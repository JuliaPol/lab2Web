<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
    <title>AuthorizationError</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
    <c:if test="${empty pageContext.request.parameterMap.lang[0]}">
        <fmt:setLocale value="ru_RU"/>
        <c:set var="lang" value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'ru_RU'}">
        <fmt:setLocale value="ru_RU"/>
        <c:set var="lang" value="ru_RU"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'en_GB'}">
        <fmt:setLocale value="en_GB"/>
        <c:set var="lang" value="eb_GB"/>
    </c:if>
    <c:if test="${pageContext.request.parameterMap.lang[0] eq 'be_BY'}">
        <fmt:setLocale value="be_BY"/>
        <c:set var="lang" value="be_BY"/>
    </c:if>
<body>
<fmt:setBundle basename="Shop"/>
<div class="bodyAuth">
    <h1><fmt:message key="error" /></h1>
    <form class="auth" action="j_security_check?lang=${lang}" method="post" name="loginForm">
        <div class="authLang">
            <a href = "?page=${pageContext.request.parameterMap.page[0]}&lang=ru_RU" onclick="addCookie('ru_RU');"> <img src = "../image/russia.png" width="30" height="30"></a>
            <a href = "?page=${pageContext.request.parameterMap.page[0]}&lang=en_GB" onclick="addCookie('en_GB');"> <img src = "../image/england.png" width="30" height="30"></a>
            <a href = "?page=${pageContext.request.parameterMap.page[0]}&lang=be_BY" onclick="addCookie('be_BY');"> <img src = "../image/belarus.png" width="30" height="30"></a>
        </div>
        <label class="authLab"><fmt:message key="txtLogin" /></label><br>
        <input class="authInp" type="text" name="j_username" placeholder="Name" size="20"/><br>
        <label class="authLab"><fmt:message key="txtPassword" /></label><br>
        <input class="authInp" type="password" name="j_password" size="20" placeholder="Password"/><br>
        <input class="authButt" type="submit" value="Ввод"/>
    </form>
</div>
</body>
</html>
