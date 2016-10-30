package bean1;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Julia on 17.10.2016.
 */
public class AnimalList {
    private static ArrayList<Animal> animalList = new ArrayList();

    public static void addElem(Animal animal) {
        animalList.add(animal);
    }
    public static void deleteList() {
        animalList.clear();
        Animal.setCountElem(0);
    }
    public static ArrayList<Animal> getAnimalList() {
        return animalList;
    }

    public static Animal getAnimal(int id) {
        return animalList.get(id);
    }
}
