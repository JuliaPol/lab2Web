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
        /*ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream ous = null;
        try {
            ous = new ObjectOutputStream(baos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //сохраняем состояние объекта в поток и закрываем его
        try {
            ous.writeObject(animal);
            ous.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(bais);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //создаём копию и инициализируем его состояние параметром
        Animal cloneAnimal = null;
        try {
            cloneAnimal = (Animal) ois.readObject();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }*/
        animalList.add(animal);
    }
    public static void deleteList() {
        animalList.clear();
        Animal.setCountElem(0);
    }
    public static ArrayList<Animal> getAnimalList() {
        return animalList;
    }
}
