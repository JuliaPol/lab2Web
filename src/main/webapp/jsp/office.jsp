<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 01.11.2016
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bean1.*" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <script src="../js/script.js"></script>
</head>
<body>
    <jsp:forward page="/s">
        <jsp:param name="page" value="office" />
        <jsp:param name="lang" value="${pageContext.request.parameterMap.lang[0]}"/>
    </jsp:forward>
</body>
</html>
