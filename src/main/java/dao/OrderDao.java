package dao;

import entities.Order1Entity;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by Julia on 12.11.2016.
 */
public class OrderDao {
    Session session1 = HibernateSessionFactory.getSessionFactory().openSession();

    public List<Order1Entity> getAllProducts() {
        return session1.createQuery("SELECT s FROM Order1Entity s ", Order1Entity.class)
                .getResultList();
    }
}
