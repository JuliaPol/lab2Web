package servlets;

import bean1.AnimalList;
import bean1.BasketList;
import dao.ShopDao;
import dao.HibernateSessionFactory;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Julia on 07.11.2016.
 */
public class OrderServlet extends HttpServlet {

    ShopDao shopDao = new ShopDao();

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
        String shop = request.getParameter("shop");
        String page = request.getParameter("page");
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
        ResourceBundle res = ResourceBundle.getBundle("Shop", locale);
        if ("delivery".equals(page)) {
            String city = request.getParameter("city");
            if ("".equals(city)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/order.jsp?lang=" + lang);
                dispatcher.forward(request, response);
            } else {
                String region = request.getParameter("region");
                String street = request.getParameter("street");
                String house = request.getParameter("house");
                shop = city + " " + region + " " + street + " " + house;
            }
        }
        if (shop == null) {
            Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction tx = session1.beginTransaction();
            List<ShopEntity> list = shopDao.getAllShopes();
            session.setAttribute("shops", list);
            StringBuffer valuesCoordX = new StringBuffer();
            StringBuffer valuesCoordY = new StringBuffer();
            StringBuffer valuesAddress = new StringBuffer();
            StringBuffer valuesName = new StringBuffer();
            StringBuffer valuesId = new StringBuffer();
            for (Iterator iterator = list.iterator(); iterator.hasNext(); ) {
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
                valuesAddress.append('"').append(res.getString(cur.getAddress())).append('"');
                if (valuesName.length() > 0) {
                    valuesName.append(',');
                }
                valuesName.append('"').append(res.getString(cur.getNameShop())).append('"');
                if (valuesId.length() > 0) {
                    valuesId.append(',');
                }
                valuesId.append('"').append(cur.getIdShop()).append('"');
            }
            tx.commit();
            session1.close();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/order.jsp?lang=" + lang + "&CoordX=" + valuesCoordX.toString() + "&CoordY=" + valuesCoordY.toString() + "&Address=" + valuesAddress.toString() + "&Name=" + valuesName.toString() + "&Id=" + valuesId.toString());
            dispatcher.forward(request, response);
        } else {
            BasketList prod = BasketList.get(session);
            Map<Integer, Integer> prod1 = BasketList.getBasketList();
            for (Map.Entry<Integer, Integer> entry : prod1.entrySet()) {
                Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
                Transaction tx = session1.beginTransaction();
                Order1Entity order = new Order1Entity();
                order.setProduct(AnimalList.getAnimal(entry.getKey()).getName());
                //String s=new String(shop.getBytes("ISO-8859-1"),"UTF-8");
                order.setAddress(shop);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                try {
                    String fileDate = dateFormat.format(new java.util.Date());
                    order.setDate(dateFormat.parse(fileDate));
                    order.setCountProduct(entry.getValue());
                    order.setUser(request.getRemoteUser());
                    session1.save(order);
                    tx.commit();
                    session1.close();
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            prod.clearBasket();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/?lang=" + lang);
            dispatcher.forward(request, response);
        }
    }
}
