package hibernate;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;

/**
 * Created by Julia on 06.11.2016.
 */
@Entity
@Table(name = "user", schema = "petshop")
public class UserEntity {
    private int userId;
    private String name;
    private String address;
    private Collection<OrderEntity> ordersByUserId = new HashSet<>();

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 100)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (userId != that.userId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "userByIdUser")
    public Collection<OrderEntity> getOrdersByUserId() {
        return ordersByUserId;
    }

    public void setOrdersByUserId(Collection<OrderEntity> ordersByUserId) {
        this.ordersByUserId = ordersByUserId;
    }
}
