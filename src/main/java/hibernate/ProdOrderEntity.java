package hibernate;

import javax.persistence.*;

/**
 * Created by Julia on 06.11.2016.
 */
@Entity
@Table(name = "prod_order", schema = "petshop")
public class ProdOrderEntity {
    private Integer count;
    private OrderEntity orderByIdOrder;
    private ProductEntity productByIdProd;

    @Basic
    @Column(name = "count", nullable = true)
    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProdOrderEntity that = (ProdOrderEntity) o;

        if (count != null ? !count.equals(that.count) : that.count != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return count != null ? count.hashCode() : 0;
    }

    @ManyToOne
    @JoinColumn(name = "id_order", referencedColumnName = "id_order")
    public OrderEntity getOrderByIdOrder() {
        return orderByIdOrder;
    }

    public void setOrderByIdOrder(OrderEntity orderByIdOrder) {
        this.orderByIdOrder = orderByIdOrder;
    }

    @ManyToOne
    @JoinColumn(name = "id_prod", referencedColumnName = "id_product")
    public ProductEntity getProductByIdProd() {
        return productByIdProd;
    }

    public void setProductByIdProd(ProductEntity productByIdProd) {
        this.productByIdProd = productByIdProd;
    }

    private int id;

    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
