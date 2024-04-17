/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Product1 {
   private int id;  //1
    private String name;//2
    private String image ;//3
    private String title; //4
    private Double price;//5
    private int sellID; //6
    private Category category; //7s
    private int amount; // 8  

    public Product1() {
    }

    public Product1(int id, String name, String image, String title, Double price, int sellID, Category category, int amount) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.title = title;
        this.price = price;
        this.sellID = sellID;
        this.category = category;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getSellID() {
        return sellID;
    }

    public void setSellID(int sellID) {
        this.sellID = sellID;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Product1{" + "id=" + id + ", name=" + name + ", image=" + image + ", title=" + title + ", price=" + price + ", sellID=" + sellID + ", category=" + category + ", amount=" + amount + '}';
    }
    
}
