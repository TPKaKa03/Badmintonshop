/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public List<Item> getItems() {
        return items;
    }

    public int getAmountById(int id) {
        return getItemById(id).getAmmount();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setAmmount(m.getAmmount() + t.getAmmount());
        } else {

            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getAmmount() + i.getPrice());
        }
        return t;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    /**
     * Get amount prouduct
     * 
     * @param pid
     * @return 
     */
    public int getQuantityByPid(int pid) {
        Item i = this.getItemById(pid);
        return (i != null) ? i.getAmmount() : 0;
    }
   
    
    public void initializeCartFromText(String txt, List<Product> listProduct ) {
        if (txt != null) {
            String[] prod = txt.split("-");
            for (String p : prod) {
                String[] ent = p.split(":");
                try {
                    int id = Integer.parseInt(ent[0]);
                    int quantity = Integer.parseInt(ent[1]);
                    Product product = getProductById(id, listProduct);
              
                    if (product != null) {
                        Item item = new Item(product, quantity, product.getPrice());
                        this.addItem(item);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
