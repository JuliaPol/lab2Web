package bean1;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by Julia on 29.10.2016.
 */
public class BasketList {
    private static Map<Integer, Integer> basketList = new HashMap<Integer, Integer>();

    public void addItem(int id) {
        int val = 1;
        for (Map.Entry<Integer, Integer> entry: basketList.entrySet())
        {
            if(entry.getKey() == id) {
                val = entry.getValue();
                val++;
            }
        }
        basketList.put(id,val);
    }

    public void deleteItem(int id) {
        int val = 1;
        for (Map.Entry<Integer, Integer> entry: basketList.entrySet())
        {
            if(entry.getKey()==id) {
                val = entry.getValue();
                if(val > 1) {
                    val--;
                    basketList.put(id,val);
                } else {
                    for(Iterator<Map.Entry<Integer, Integer>> it = basketList.entrySet().iterator(); it.hasNext(); ) {
                        Map.Entry<Integer, Integer> entry1 = it.next();
                        if(entry1.getKey()== id) {
                            it.remove();
                        }
                    }
                }
                break;
            }
        }
    }

    public static Map<Integer,Integer> getBasketList() {
        return new HashMap<Integer, Integer>(basketList);
    }

    public static BasketList get(HttpSession session) {
        BasketList cart = (BasketList) session.getAttribute("cart");
        if (cart == null) {
            cart = new BasketList();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    public static int getSize() {
        int size = 0;
        for (int val : basketList.values()) {
            size+=val;
        }
        return size;
    }

    public static int getSum() {
        int sum = 0;
        for (Map.Entry<Integer, Integer> entry: basketList.entrySet()) {
            int id = entry.getKey();
            if(entry.getValue()>1) {
                sum+=AnimalList.getAnimalList().get(id-1).getCost()*entry.getValue();
            } else {
                sum+=AnimalList.getAnimalList().get(id-1).getCost();
            }
        }
        return sum;
    }

    public void clearBasket() {
        basketList.clear();
    }
}
