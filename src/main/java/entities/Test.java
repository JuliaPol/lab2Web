package entities;

import dao.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by Julia on 06.11.2016.
 */
public class Test {
        public static void main(String[] args) {
            System.out.println("Hibernate tutorial");
            Session session1 = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction tx = session1.beginTransaction();
            Integer resId = null;
            Order1Entity order = new Order1Entity();
            String s1="ыыы";
            order.setProduct("папап");
            order.setAddress("Ddd");
            order.setCountProduct(2);
            order.setDate(new java.util.Date());
            order.setUser("chjk");
            resId = (Integer) session1.save(order);
            tx.commit();
            session1.close();
        }
}
