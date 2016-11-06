package servlets;

import bean1.BasketList;
import hibernate.HibernateSessionFactory;
import hibernate.ShopEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Julia on 07.11.2016.
 */
public class OrderServlet extends HttpServlet {
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
        String lang = request.getParameter("lang");
        Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx = session1.beginTransaction();
        List list = session1.createQuery("FROM ShopEntity").list();
        StringBuffer valuesCoordX = new StringBuffer();
        StringBuffer valuesCoordY = new StringBuffer();
        StringBuffer valuesAddress = new StringBuffer();
        StringBuffer valuesName= new StringBuffer();
        HttpSession session = request.getSession();
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            ShopEntity cur = (ShopEntity) iterator.next();
            if (valuesCoordX.length() > 0) {
                valuesCoordX.append(',');
            }
            valuesCoordX.append('"').append(cur.getCoordX()).append('"');
            if (valuesCoordY.length() > 0) {
                    valuesCoordY.append(',');
            }
            valuesCoordY.append('"').append(cur.getCoordY()).append('"');
            if (valuesAddress.length() > 0) {
                valuesAddress.append(',');
            }
            valuesAddress.append('"').append(cur.getAddress()).append('"');
            if (valuesName.length() > 0) {
                valuesName.append(',');
            }
            valuesName.append('"').append(cur.getNameShop()).append('"');
        }
        tx.commit();
        session1.close();
//        session.setAttribute("CoordX",valuesCoordX.toString());
//        session.setAttribute("CoordY",valuesCoordY.toString());
//        session.setAttribute("Address",valuesAddress.toString());
//        session.setAttribute("Name",valuesName.toString());
//        System.out.println(session.getAttribute("CoordX"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/order.jsp?lang="+lang+"&CoordX="+valuesCoordX.toString()+"&CoordY="+valuesCoordY.toString()+"&Address="+valuesAddress.toString()+"&Name="+valuesName.toString());
        dispatcher.forward(request,response);
    }
}
