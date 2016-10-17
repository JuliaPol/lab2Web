<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 17.10.2016
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="product">
        <a href="#"><h3><jsp:getProperty name="animalId" property="name"/></h3></a>
        <div class="photo"> <img src="<jsp:getProperty name="animalId" property="img"/>.jpg" width="250px" height="200px"></div>
        <div class="description"> <p><jsp:getProperty name="animalId" property="description"/></p></div>
        <div class="price1">
            <p id="price1"><jsp:getProperty name="animalId" property="cost"/></p>
            <input type="image" src="../image/icon3.png" id="buy">
        </div>
    </div>
</body>
</html>
