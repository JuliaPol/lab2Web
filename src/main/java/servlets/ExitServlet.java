package servlets;

import bean1.BasketList;
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
public class ExitServlet extends HttpServlet {
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
        String value = request.getParameter("page");
        BasketList bean = BasketList.get(session);
        bean.clearBasket();
        session.invalidate();
        switch (value) {
            case "s":
                String id = request.getParameter("id");
                response.sendRedirect("/s?id=" + id);
                break;
            case "list":
                response.sendRedirect("/");
                break;
            case "bas":
                response.sendRedirect("/jsp/basket.jsp");
                break;
            case "order":
                response.sendRedirect("/");
                break;
        }
    }
}
