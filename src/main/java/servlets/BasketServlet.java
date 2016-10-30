package servlets;

import bean1.BasketList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Julia on 29.10.2016.
 */
public class BasketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        BasketList bean = BasketList.get(session);
        request.getRemoteAddr();
        String value = request.getParameter("id");
        if (value == null) {
            value = request.getParameter("idP");
            if (value == null) {
                value = request.getParameter("idM");
                if (value == null) {
                    value = request.getParameter("idServlet");
                    if (value == null) {
                        bean.clearBasket();
                        response.sendRedirect("/");
                    } else {
                        bean.addItem(Integer.parseInt(value));
                        response.sendRedirect("/s");
                    }
                } else {
                    bean.deleteItem(Integer.parseInt(value));
                    response.sendRedirect("/jsp/basket.jsp");
                }
            } else {
                bean.addItem(Integer.parseInt(value));
                response.sendRedirect("/jsp/basket.jsp");
            }
        } else {
            bean.addItem(Integer.parseInt(value));
            response.sendRedirect("/");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "GET requests are not supported");
    }
}
