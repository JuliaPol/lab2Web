package servlets;


import bean1.User;
import dao.CommentsDao;
import dao.HibernateSessionFactory;
import dao.OrderDao;
import entities.CommentsEntity;
import entities.Order1Entity;
import entities.ProductEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Julia on 01.11.2016.
 */
public class AuthServlet extends HttpServlet {

    OrderDao orderDao = new OrderDao();
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
        Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx = session1.beginTransaction();
        List<Order1Entity> list = orderDao.getAllProducts();
        session.setAttribute("orders",list);
        tx.commit();
        session1.close();
        switch (value) {
            case "history":
                response.sendRedirect("/jsp/history.jsp?lang="+lang);
                break;
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
                response.sendRedirect("/s4?lang="+lang);
                break;
            default:
                response.sendRedirect("/?lang="+lang);
                break;
        }
    }
}
