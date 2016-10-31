<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 01.11.2016
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <fmt:setBundle basename="Shop"/>
    <div class="bodyAuth">
        <form class="auth" action="j_security_check" method="post" name="loginForm">
            <label><fmt:message key="txtLogin" /></label><br>
            <input type="text" name="j_username" placeholder="Name" size="20"/><br>
            <label><fmt:message key="txtPassword" /></label><br>
            <input type="password" name="j_password" size="20" placeholder="Password"/><br>
            <input type="submit" value="Ввод"/>
        </form>
    </div>
</body>
</html>
