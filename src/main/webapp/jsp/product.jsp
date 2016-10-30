<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean1.AnimalList" %>
<%@ page import="bean1.Animal" %>
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
            <form action="/s1" method="post">
                <input name="id" type="image" src="../image/icon3.png" class="buy" value ="<jsp:getProperty name="animalId" property="id"/>">
            </form>
        </div>
    </div>
</body>
</html>
