<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 17.10.2016
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <div class="hat">
        <a href = "/"> <img src = "../image/logo.png" width="90" height="70"></a>
        <h3>PetShop</h3>
        <div class="basket">
            <a href="#" class="button1"><%=res.getString("login")%></a>
            <a href="#" class="button1"><%=res.getString("history")%></a>
            <a href="/jsp/basket.jsp"> <img src="../image/basket.png"></a>
        </div>
        <div class="language">
            <a href = "?lang=ru"> <img src = "../image/russia.png" width="30" height="30"></a>
            <a href = "?lang=en"> <img src = "../image/england.png" width="30" height="30"></a>
            <a href = "?lang=be"> <img src = "../image/belarus.png" width="30" height="30"></a>
        </div>
    </div>
</body>
</html>
