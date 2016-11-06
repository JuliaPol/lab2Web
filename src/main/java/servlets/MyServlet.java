package servlets;

/**
 * Created by Julia on 15.10.2016.
 */

import bean1.AnimalList;
import bean1.BasketList;
import bean1.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;

public class MyServlet extends HttpServlet {

    private String param;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        param = config.getInitParameter("paramOne");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String lang = request.getParameter("lang");
        String page = request.getParameter("page");
        if ("office".equals(page)) {
            String paramOffice = param;
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/office1.jsp?lang="+lang+"&paramO="+paramOffice);
            dispatcher.forward(request,response);
        }
        int id = Integer.parseInt(request.getParameter("id"));
        Cookie[] cookies = request.getCookies();
        if (lang == null) {
            for (int i = 0; i < cookies.length; i++) {
                if ("lang".equals(cookies[i].getName())) {
                    lang = cookies[i].getValue();
                    break;
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
        int param1;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numServlet;
        String log;
        String userName;
        if (user.getName() == null) {
            numServlet = 2;
            log = "login";
            userName = "";
        } else {
            numServlet = 3;
            log = "logout";
            userName = user.getName();
        }
        String displayOrder ="";
        if(BasketList.getSize()>0) {
            displayOrder="<a href="+"/s2?page=order&lang="+lang+"\" class=\"button1\">"+res.getString("checkout")+"</a>";
        }
        param1 = Integer.parseInt(param);
        StringBuilder sb = new StringBuilder();
        StringBuilder append = sb.append("<html>\n" +
                "    <head>\n" +
                "        <meta charset=\"utf-8\">\n" +
                "        <title>" + res.getString("title") + "</title>\n" +
                "        <link rel=\"stylesheet\" type=\"text/css\" href=\"../../../../css/style.css\">\n" +
                "        <link href=\"https://fonts.googleapis.com/css?family=Kurale\" rel=\"stylesheet\">\n" +
                "        <script src=\"../../../js/script.js\"></script>\n" +
                "    </head>");
        sb.append("<body>\n" +
                "       <div class=\"body\"> \n" +
                "            <div class=\"hat\">\n" +
                "                <a href = \"/\"> <img src = \"../../../../image/logo.png\" width=\"90\" height=\"70\"></a> \n" +
                "                <h3>PetShop</h3>\n" +
                "                <div class=\"basket\">\n" +
                "                   <a href=\"s?page=office&lang="+lang+"\" class=\"aBas\">" + userName + "</a>\n" +
                "                   <a href=\"/s" + numServlet + "?page=s&id=" + id + "&lang"+lang+"\" class=\"button1\">" + res.getString(log) + "</a>\n" +
                "                   <a href=\"#\" class=\"button1\">" + res.getString("history") + "</a>\n" +
                "                   "+ displayOrder +"\n"+
                "                   <a href=\"/jsp/basket.jsp\" ><img src=\"../../../../image/basket.png\"></a>\n" +
                "                   <p id=\"productsInBasket\">" + BasketList.getSize() + "</p>\n" +
                "                </div>\n" +
                "                <div class=\"language\"> \n" +
                "                    <a href = \"s?id=" + id + "&lang=ru_RU\"> <img src = \"../../../../image/russia.png\" width=\"30\" height=\"30\"></a> \n" +
                "                    <a href = \"s?id=" + id + "&lang=en_GB\"> <img src = \"../../../../image/england.png\" width=\"30\" height=\"30\"></a> \n" +
                "                    <a href = \"s?id=" + id + "&lang=be_BY\"> <img src = \"../../../../image/belarus.png\" width=\"30\" height=\"30\"></a> \n" +
                "                </div>\n" +
                "            </div>");
        sb.append(" <div class=\"card\"> \n" +
                "                 <!--<input id=\"arrL\" type=\"image\" src=\"../../../../image/1.png\">\n" +
                "                 <input id=\"arrR\" type=\"image\" src=\"../../../../image/2.png\">-->\n" +
                "                 <h3>" + res.getString(AnimalList.getAnimalList().get(id-1).getName()) + "</h3>\n" +
                "                 <div class=\"price\">\n" +
                "                     <p id=\"price\">" + AnimalList.getAnimalList().get(id-1).getCost() + "</p>\n" +
                "                     <form action=\"/s1\" method=\"post\">\n" +
                "                       <input name=\"idServlet\" type=\"image\" src=\"../image/icon3.png\" class=\"buy\" value =" + id + ">\n" +
                "                     </form>\n" +
                "                 </div>\n" +
                "                 <div class=\"cat\">\n" +
                "                     <img src = \"../../../../" + AnimalList.getAnimalList().get(id-1).getImg() + ".jpg\" width=\"250\" height=\"200\">\n" +
                "                     <img src=\"../../../../" + AnimalList.getAnimalList().get(id-1).getImg1() + ".jpg\" width=\"250\" height=\"200\">\n" +
                "                     <img src=\"../../../../" + AnimalList.getAnimalList().get(id-1).getImg2() + ".jpg\" width=\"250\" height=\"200\">\n" +
                "                 </div>\n" +
                "                 <div class=\"nav\">\n" +
                "                     <ul>\n" +
                "                         <li><a href=\"#v\" id=\"a1\" class=\"menu\" style=\"color:" + ((param1 == 1) ? "#600083;" : "#953bd6;") + "\" onclick=\"show('1')\">" + res.getString("view") + "</a></li>\n" +
                "                         <li><a href=\"#v\" id=\"a2\" class=\"menu\" style=\"color:" + ((param1 == 2) ? "#600083;" : "#953bd6;") + "\" onclick=\"show('2')\">" + res.getString("characteristics") + "</a></li>\n" +
                "                         <li><a href=\"#v\" id=\"a3\" class=\"menu\" style=\"color:" + ((param1 == 3) ? "#600083;" : "#953bd6;") + "\" onclick=\"show('3')\">" + res.getString("reviews") + "</a></li>\n" +
                "                     </ul>\n" +
                "                 </div>\n" +
                "                 <div class=\"view\" name=\"v\">\n" +
                "                     <div id=\"view1\" class=\"specification\" style=\"display:" + ((param1 == 1) ? "block;" : "none;") + "\">\n" +
                "                         <p> " + res.getString(AnimalList.getAnimalList().get(id-1).getDescription()) + "</p>\n" +
                "                         <p> " + res.getString("about2") + "</p>\n" +
                "                     </div>\n" +
                "                     <div id=\"characteristics\" class=\"specification\" style=\"display:" + ((param1 == 2) ? "block;" : "none;") + "\">\n" +
                "                        <ul>\n" +
                "                            <li>" + res.getString("li1") + "</li>\n" +
                "                            <li>" + res.getString("li2") + "</li>\n" +
                "                            <li>" + res.getString("li3") + "</li>\n" +
                "                            <li>" + res.getString("li4") + "</li>\n" +
                "                            <li>" + res.getString("li5") + "</li>\n" +
                "                            <li>" + res.getString("li6") + "</li>\n" +
                "                            <li>" + res.getString("li7") + "</li>\n" +
                "                            <li>" + res.getString("li8") + "</li>\n" +
                "                            <li>" + res.getString("li9") + "</li>\n" +
                "                            <li>" + res.getString("li10") + "</li>\n" +
                "                            <li>" + res.getString("li11") + "</li>\n" +
                "                        </ul>\n" +
                "                     </div>\n" +
                "                     <div id=\"reviews\" class=\"specification\" style=\"display:" + ((param1 == 3) ? "block;" : "none;") + "\">\n" +
                "                         <ul>\n" +
                "                            <li><b>" + res.getString("rewN1") + "</b>" + res.getString("rew1") + "</li>\n" +
                "                            <li><b>" + res.getString("rewN2") + "</b> " + res.getString("rew2") + " </li>\n" +
                "                            <li><b>" + res.getString("rewN3") + "</b> " + res.getString("rew3") + "</li>\n" +
                "                        </ul>\n" +
                "                     </div>\n" +
                "                 </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </body>\n" +
                "</html>");
        PrintWriter out = response.getWriter();
        out.println(sb.toString());
        out.flush();
        out.close();
    }

}
