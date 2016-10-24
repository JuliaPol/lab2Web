<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 24.10.2016
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="productBasket">
        <h4>${nameProduct}</h4>
        <p id="price2">${priceProduct}</p>
        <div class="number">
            <input type="button" value="-" id="min">
            <input type="text" value="${countProduct}" size="5"/>
            <input type="button" value="+" id="pl">
        </div>
        <img src="${imgProduct}">
        <p class="description1">${descriptionProduct}</p>
    </div>
</body>
</html>
