package hibernate;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;

/**
 * Created by Julia on 06.11.2016.
 */
@Entity
@Table(name = "product", schema = "petshop", catalog = "")
public class ProductEntity {
    private int idProduct;
    private String name;
    private Integer price;
    private Collection<ProdOrderEntity> prodOrdersByIdProduct = new HashSet<>();
    private String type;
    private String description;
    private String img;
    private String img1;
    private String img2;

    @Id
    @Column(name = "id_product", nullable = false)
    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "price", nullable = true)
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductEntity that = (ProductEntity) o;

        if (idProduct != that.idProduct) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idProduct;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "productByIdProd")
    public Collection<ProdOrderEntity> getProdOrdersByIdProduct() {
        return prodOrdersByIdProduct;
    }

    public void setProdOrdersByIdProduct(Collection<ProdOrderEntity> prodOrdersByIdProduct) {
        this.prodOrdersByIdProduct = prodOrdersByIdProduct;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 20)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 100)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "img", nullable = true, length = 50)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "img1", nullable = true, length = 50)
    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    @Basic
    @Column(name = "img2", nullable = true, length = 50)
    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }
}
