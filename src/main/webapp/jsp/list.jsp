<%--
  Created by IntelliJ IDEA.
  User: Julia
  Date: 16.10.2016
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bean1.*" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateSessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="hibernate.ProductEntity" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tag1.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <script src="../js/script.js"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String lang = request.getParameter("lang");
        String type = request.getParameter("type");
        Cookie[] cookies = request.getCookies();
        if(lang == null) {
            for (int i = 0; i < cookies.length; i++) {
                if ("lang".equals(cookies[i].getName())) {
                    lang = cookies[i].getValue();
                }
            }
        }
        Locale locale;
        if ("en_GB".equals(lang)) {
            locale = new Locale("en", "GB");
        } else if ("ru_RU".equals(lang)) {
            locale = Locale.getDefault();
        } else if ("be_BY".equals(lang)) {
            locale = new Locale("be", "BY");
        } else {
            locale = Locale.getDefault();
        }
        Cookie cookie1 = new Cookie("lang", lang);
        response.addCookie(cookie1);
        ResourceBundle res = ResourceBundle.getBundle("Shop", locale);
        AnimalList.deleteList();
        Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx = session1.beginTransaction();
        List list = session1.createQuery("FROM ProductEntity").list();
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            ProductEntity cur = (ProductEntity) iterator.next();
            AnimalList.addElem(new Animal(cur.getIdProduct(),cur.getType(), cur.getName(), cur.getDescription(), cur.getImg(), cur.getImg1(), cur.getImg2(), cur.getPrice()));
        }
        tx.commit();
        session1.close();
        ArrayList<Animal> animalList1 = AnimalList.getAnimalList();
    %>
    <title><%=res.getString("title")%>
    </title>
    <jsp:useBean id="animalId" class="bean1.Animal" scope="page"/>
    <jsp:useBean id="basket" class="bean1.BasketList" scope="session" />
</head>
<body>
<div class="body1">1
    <%@include file="hat.jsp" %>
    <div class="card1">
        <div class="smallcard">
            <div class="filter" id="t">
                <select name="selectName" onchange="itemsChanged();">
                    <option value='val'><%=res.getString("select")%>
                    </option>
                    <option value='all'><%=res.getString("all")%>
                    </option>
                    <option value='cats'><%=res.getString("cats")%>
                    </option>
                    <option value='dogs'><%=res.getString("dogs")%>
                    </option>
                    <option value='birds'><%=res.getString("birds")%>
                    </option>
                </select>
            </div>
            <%
                if (type == null) {
                    if (cookies == null) {
                        type = "all";
                        Cookie cookie = new Cookie("type", type);
                        response.addCookie(cookie);
                    } else {
                        for (int i = 0; i < cookies.length; i++) {
                            if ("type".equals(cookies[i].getName())) {
                                type = cookies[i].getValue();
                                break;
                            }
                        }
                        if (type == null) {
                            type = "all";
                            Cookie cookie = new Cookie("type", type);
                            cookie.setMaxAge(15);
                            response.addCookie(cookie);
                        }
                    }
                } else {
                    Cookie cookie = new Cookie("type", type);
                    cookie.setMaxAge(15);
                    response.addCookie(cookie);
                }
            %>
            <h2><%=res.getString(type)%></h2>
            <%
                if (type != null) {
                    switch (type) {
                        case "cats":
                            for (int i = 0; i < animalList1.size(); i++) {
                                if (animalList1.get(i).getType().equals("cats")) {
                                    animalId.setName(res.getString(animalList1.get(i).getName()));
                                    animalId.setDescription(res.getString(animalList1.get(i).getDescription()));
                                    animalId.setImg(animalList1.get(i).getImg());
                                    animalId.setCost(animalList1.get(i).getCost());
                                    animalId.setId(animalList1.get(i).getId());
                                    animalId.setType(animalList1.get(i).getType());
            %>
            <%@include file="product.jsp" %>
            <%
                                }
                            }
                            break;
                        case "dogs":
                            for (int i = 0; i < animalList1.size(); i++) {
                                if (animalList1.get(i).getType().equals("dogs")) {
                                    animalId.setName(res.getString(animalList1.get(i).getName()));
                                    animalId.setDescription(res.getString(animalList1.get(i).getDescription()));
                                    animalId.setImg(animalList1.get(i).getImg());
                                    animalId.setCost(animalList1.get(i).getCost());
                                    animalId.setId(animalList1.get(i).getId());
                                    animalId.setType(animalList1.get(i).getType());
                    %>
                    <%@include file="product.jsp" %>
                    <%
                                }
                            }
                            break;
                        case "birds":
                            for (int i = 0; i < animalList1.size(); i++) {
                                if (animalList1.get(i).getType().equals("birds")) {
                                    animalId.setName(res.getString(animalList1.get(i).getName()));
                                    animalId.setDescription(res.getString(animalList1.get(i).getDescription()));
                                    animalId.setImg(animalList1.get(i).getImg());
                                    animalId.setCost(animalList1.get(i).getCost());
                                    animalId.setId(animalList1.get(i).getId());
                                    animalId.setType(animalList1.get(i).getType());
                    %>
                    <%@include file="product.jsp" %>
                    <%
                                }
                            }
                            break;
                        case "all":
                            for (int i = 0; i < animalList1.size(); i++) {
                                animalId.setName(res.getString(animalList1.get(i).getName()));
                                animalId.setDescription(res.getString(animalList1.get(i).getDescription()));
                                animalId.setImg(animalList1.get(i).getImg());
                                animalId.setCost(animalList1.get(i).getCost());
                                animalId.setId(animalList1.get(i).getId());
                                animalId.setType(animalList1.get(i).getType());
                    %>
                    <%@include file="product.jsp" %>
                    <%
                            }
                            break;
                        default:
                            for (int i = 0; i < animalList1.size(); i++) {
                                animalId.setName(res.getString(animalList1.get(i).getName()));
                                animalId.setDescription(res.getString(animalList1.get(i).getDescription()));
                                animalId.setImg(animalList1.get(i).getImg());
                                animalId.setCost(animalList1.get(i).getCost());
                                animalId.setId(animalList1.get(i).getId());
                                animalId.setType(animalList1.get(i).getType());
                    %>
                    <%@include file="product.jsp" %>
                    <%
                            }
                            break;
                    }
                }
            %>
        </div>
    </div>
    <a href="#t" id="arrow"><img src="../image/arrow_up%20(1).png"></a>
</div>
</body>
</html>
