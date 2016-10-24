
<%@ taglib prefix="f" uri="/tld/tag1.tld" %>

<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 17.10.2016
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="product">
        <a href="/s?id=<jsp:getProperty name="animalId" property="id"/>"><h4><jsp:getProperty name="animalId" property="name"/></h4></a>
        <div class="photo"> <img src="<jsp:getProperty name="animalId" property="img"/>.jpg" width="250px" height="200px"></div>
        <div class="description"> <p><jsp:getProperty name="animalId" property="description"/></p></div>
        <div class="price1">
            <p id="price1"><jsp:getProperty name="animalId" property="cost"/></p>
            <a href="/jsp/basket.jsp"><input type="image" src="../image/icon3.png" class="buy" onclick="${f: addElem(animalId)}"></a>
        </div>
    </div>
</body>
</html>
