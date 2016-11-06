package hibernate;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.HashSet;

/**
 * Created by Julia on 06.11.2016.
 */
@Entity
@Table(name = "order", schema = "petshop")
public class OrderEntity {
    private int idOrder;
    private java.util.Date dateOrder;
    private Integer amount;
    private ShopEntity shopByIdShop;
    private UserEntity userByIdUser;
    private Collection<ProdOrderEntity> prodOrdersByIdOrder = new HashSet<>();

    @Id
    @Column(name = "id_order", nullable = false)
    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "date_order", nullable = true)
    public java.util.Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(java.util.Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    @Basic
    @Column(name = "amount", nullable = true)
    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderEntity that = (OrderEntity) o;

        if (idOrder != that.idOrder) return false;
        if (dateOrder != null ? !dateOrder.equals(that.dateOrder) : that.dateOrder != null) return false;
        if (amount != null ? !amount.equals(that.amount) : that.amount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idOrder;
        result = 31 * result + (dateOrder != null ? dateOrder.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_shop", referencedColumnName = "id_shop")
    public ShopEntity getShopByIdShop() {
        return shopByIdShop;
    }

    public void setShopByIdShop(ShopEntity shopByIdShop) {
        this.shopByIdShop = shopByIdShop;
    }

    @ManyToOne
    @JoinColumn(name = "id_user", referencedColumnName = "user_id")
    public UserEntity getUserByIdUser() {
        return userByIdUser;
    }

    public void setUserByIdUser(UserEntity userByIdUser) {
        this.userByIdUser = userByIdUser;
    }

    @OneToMany(mappedBy = "orderByIdOrder")
    public Collection<ProdOrderEntity> getProdOrdersByIdOrder() {
        return prodOrdersByIdOrder;
    }

    public void setProdOrdersByIdOrder(Collection<ProdOrderEntity> prodOrdersByIdOrder) {
        this.prodOrdersByIdOrder = prodOrdersByIdOrder;
    }
}
