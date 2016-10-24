package function;

import bean1.Animal;
import bean1.AnimalList;

import java.util.ArrayList;

/**
 * Created by Julia on 25.10.2016.
 */
public class Basket extends AnimalList {

    private static ArrayList<Animal> productList = new ArrayList();

    public static void addElem(Animal animal) {
        productList.add(animal);
    }
    public static void deleteList() {
        productList.clear();
        Animal.setCountElem(0);
    }
    public static ArrayList<Animal> getProductList() {
        return productList;
    }


}
