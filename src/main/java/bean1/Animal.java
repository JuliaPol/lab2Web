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
    private String img1;
    private String img2;
    private int cost;
    private int id;
    private static int countElem = 0;

    public Animal() {
        this.type = null;
        this.name = null;
        this.description = null;
        this.img = null;
        this.cost = 0;
        this.id = countElem;
        countElem++;
    }

    public Animal(String type, String name, String description, String img, String img1, String img2, int cost) {
        this.type = type;
        this.name = name;
        this.description = description;
        this.img = img;
        this.img1 = img1;
        this.img2 = img2;
        this.cost = cost;
        this.id = countElem;
        countElem++;
    }

    public static void setCountElem(int countElem) {
        Animal.countElem = countElem;
    }

    public int getCost() {
        return cost;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg1() {
        return img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setCost(int cost) {
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
