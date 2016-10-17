package bean1;

import java.io.Serializable;

/**
 * Created by Julia on 16.10.2016.
 */
public class Animal implements Serializable {
    private String type;
    private String name;
    private String description;
    private String img;
    private String cost;
    private int id;
    private static int countElem;

    public Animal() {
        this.type = null;
        this.name = null;
        this.description = null;
        this.img = null;
        this.cost = null;
        this.id = countElem;
        countElem++;
    }

    public Animal(String type, String name, String description, String img, String cost, int id) {
        this.type = type;
        this.name = name;
        this.description = description;
        this.img = img;
        this.cost = cost;
        this.id = id;
    }

    public String getCost() {
        return cost;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getImg() {
        return img;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
