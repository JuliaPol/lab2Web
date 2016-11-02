<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Authorization</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script src="../js/script.js"></script>
    <c:if test="${empty pageContext.request.parameterMap.lang[0]}">
        <%--<c:choose>--%>
            <%--<c:when test="${empty cookie.lang.value}">--%>
                <%--<fmt:setLocale value="ru_RU"/>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<fmt:setLocale value="${cookie.lang.value}"/>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
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
    <fmt:setBundle basename="Shop"/>
</head>
<body>
    <div class="bodyAuth">
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
