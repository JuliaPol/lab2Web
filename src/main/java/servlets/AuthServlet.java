package servlets;


import bean1.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Julia on 01.11.2016.
 */
public class AuthServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        User user = User.get(session);
        user.setName(request.getRemoteUser());
        user.setAuth("1");
        String value = request.getParameter("page");
        String lang = request.getParameter("lang");
        switch (value) {
            case "s":
                String id = request.getParameter("id");
                response.sendRedirect("/s?id=" + id +"&lang="+lang);
                break;
            case "list":
                response.sendRedirect("/?lang="+lang);
                break;
            case "bas":
                response.sendRedirect("/jsp/basket.jsp?lang="+lang);
                break;
            case "order":
                response.sendRedirect("/jsp/order.jsp?lang="+lang);
                break;
            default:
                response.sendRedirect("/?lang="+lang);
                break;
        }
    }
}
