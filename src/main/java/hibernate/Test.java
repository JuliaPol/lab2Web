package hibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by Julia on 06.11.2016.
 */
public class Test {
        public static void main(String[] args) {
            System.out.println("Hibernate tutorial");

            Session session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();

            ShopEntity shopEntity = new ShopEntity();
            shopEntity.setAddress("addressShop1");//КАД/пр-кт Энгельса Санкт-Петербург Ленинградская обл., Россия
            shopEntity.setCoordX(60.09141769719149);
            shopEntity.setCoordY(30.38050303420414);
            shopEntity.setIdShop(1);
            shopEntity.setNameShop("PS1");

            UserEntity userEntity = new UserEntity();
            userEntity.setName("name");
            userEntity.setAddress("address1");
            userEntity.setUserId(1);

            ProductEntity productEntity = new ProductEntity();
            productEntity.setIdProduct(1);
            productEntity.setName("БАРС");
            productEntity.setPrice(100);

//            OrderEntity orderEntity = new OrderEntity();
//            orderEntity.setIdOrder(1);
//            orderEntity.setDateOrder(new java.util.Date());
//            orderEntity.setAmount(300);
//            orderEntity.setUserByIdUser(userEntity);
//            orderEntity.setShopByIdShop(shopEntity);

//            ProdOrderEntity prodOrderEntity = new ProdOrderEntity();
//            prodOrderEntity.setId(1);
//            prodOrderEntity.setProductByIdProd(productEntity);
//            prodOrderEntity.setOrderByIdOrder(orderEntity);
//            prodOrderEntity.setCount(2);

//            productEntity.getProdOrdersByIdProduct().add(prodOrderEntity);
//            orderEntity.getProdOrdersByIdOrder().add(prodOrderEntity);
//            shopEntity.getOrdersByIdShop().add(orderEntity);
//            userEntity.getOrdersByUserId().add(orderEntity);
            session.save(userEntity);
//            session.save(orderEntity);
            session.save(shopEntity);
            session.save(productEntity);
//            session.save(prodOrderEntity);

            tx.commit();
            session.close();
        }
}
