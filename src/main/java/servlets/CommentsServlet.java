package servlets;

import bean1.AnimalList;
import bean1.BasketList;
import dao.CommentsDao;
import dao.HibernateSessionFactory;
import dao.ShopDao;
import entities.CommentsEntity;
import entities.Order1Entity;
import entities.ShopEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Julia on 12.11.2016.
 */
public class CommentsServlet extends HttpServlet {
    CommentsDao commentsDao = new CommentsDao();

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
        HttpSession session = request.getSession();
        String lang = request.getParameter("lang");
        String comment = request.getParameter("comment");
        PrintWriter out = response.getWriter();
        if (!"".equals(comment)) {
            Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction tx = session1.beginTransaction();
            CommentsEntity commentsEntity = new CommentsEntity();
            commentsEntity.setUser(request.getRemoteUser());
            commentsEntity.setText(comment);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String fileDate = dateFormat.format(new java.util.Date());
            try {
                commentsEntity.setDate(dateFormat.parse(fileDate));
                session1.save(commentsEntity);
                tx.commit();
            } catch (Exception e) {
                if (tx != null)
                    tx.rollback();
                e.printStackTrace();
            } finally {
                session1.close();
            }
        }
        List<CommentsEntity> list = commentsDao.getAllComments();
        for (Iterator iterator = list.iterator(); iterator.hasNext(); ) {
            CommentsEntity cur = (CommentsEntity) iterator.next();
            out.println("<div class=\"comment\">");
            out.println("<p>"+cur.getUser()+"</p>");
            out.println("<p>"+cur.getText()+"</p>");
            out.println("<p>"+cur.getDate()+"</p>");
            out.println("</div>");
        }
    }
}
