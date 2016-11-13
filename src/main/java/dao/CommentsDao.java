package dao;

import entities.CommentsEntity;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by Julia on 12.11.2016.
 */
public class CommentsDao {
    Session session1 = HibernateSessionFactory.getSessionFactory().openSession();

    public List<CommentsEntity> getAllComments() {
        return session1.createQuery("SELECT s FROM CommentsEntity s ORDER BY idComments DESC", CommentsEntity.class)
                .getResultList();
    }
}
