<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 16.10.2016
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <title>Магазин</title>
    <jsp:useBean id="animalId" class="bean1.Animal" scope="page"/>
</head>
<body>
    <div class="body">
        <%@include file="hat.jsp"%>
        <div class="card">
            <div class="smallcard">
                <div class="filter" id="t">
                    <select name='selectName'>
                        <option value='one'>Все животные</option>
                        <option value='two'>Коты</option>
                        <option value='three'>Собаки</option>
                        <option value='four'>Птицы</option>
                    </select>
                </div>
                <jsp:setProperty name="animalId" property="name" value="Барсик"/>
                <jsp:setProperty name="animalId" property="img" value="../image/cat-1692702_640"/>
                <jsp:setProperty name="animalId" property="description" value="Кот Барсик здоров, проверен на вирусные заболевания, выращен в отличных условиях,с любовью."/>
                <jsp:setProperty name="animalId" property="cost" value="10 000руб"/>
                <%@include file="product.jsp"%>
                <jsp:setProperty name="animalId" property="name" value="Милые котята"/>
                <jsp:setProperty name="animalId" property="description" value="Три красивых и добрых котёнка ждут своего хозяина. По отдельности не продаются."/>
                <jsp:setProperty name="animalId" property="img" value="../image/DSCN0371"/>
                <jsp:setProperty name="animalId" property="cost" value="3 000руб"/>
                <%@include file="product.jsp"%>
                <%@include file="product.jsp"%>
                <jsp:setProperty name="animalId" property="name" value="Кль"/>
                <%@include file="product.jsp"%>
            </div>
        </div>
        <a href="#t" id="arrow"><img src="../image/arrow_up%20(1).png"></a>
    </div>
</body>
</html>
