package entities;

import javax.persistence.*;

/**
 * Created by Julia on 06.11.2016.
 */
@Entity
@Table(name = "shop", schema = "petshop")
public class ShopEntity {
    private int idShop;
    private String nameShop;
    private String address;
    private Double coordX;
    private Double coordY;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_shop", nullable = false)
    public int getIdShop() {
        return idShop;
    }

    public void setIdShop(int idShop) {
        this.idShop = idShop;
    }

    @Basic
    @Column(name = "name_shop", nullable = true, length = 30)
    public String getNameShop() {
        return nameShop;
    }

    public void setNameShop(String nameShop) {
        this.nameShop = nameShop;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 200)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "coordX", nullable = true, precision = 0)
    public Double getCoordX() {
        return coordX;
    }

    public void setCoordX(Double coordX) {
        this.coordX = coordX;
    }

    @Basic
    @Column(name = "coordY", nullable = true, precision = 0)
    public Double getCoordY() {
        return coordY;
    }

    public void setCoordY(Double coordY) {
        this.coordY = coordY;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ShopEntity that = (ShopEntity) o;

        if (idShop != that.idShop) return false;
        if (nameShop != null ? !nameShop.equals(that.nameShop) : that.nameShop != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (coordX != null ? !coordX.equals(that.coordX) : that.coordX != null) return false;
        if (coordY != null ? !coordY.equals(that.coordY) : that.coordY != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idShop;
        result = 31 * result + (nameShop != null ? nameShop.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (coordX != null ? coordX.hashCode() : 0);
        result = 31 * result + (coordY != null ? coordY.hashCode() : 0);
        return result;
    }
}