package dao;

import entities.ShopEntity;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by Julia on 12.11.2016.
 */
public class ShopDao {

    Session session1 = HibernateSessionFactory.getSessionFactory().openSession();

    public List<ShopEntity> getAllShopes() {
        return session1.createQuery("SELECT s FROM ShopEntity s ", ShopEntity.class)
                .getResultList();
    }
}
