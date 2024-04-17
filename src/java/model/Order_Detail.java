/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 * @author ACER
 */
public class Order_Detail {
    private int  detail_id;
    private double price ;
    private int order_id;
    private int product_id;
     private int amount;
    public Order_Detail() {
    }

    public Order_Detail(int detail_id, double price, int order_id, int product_id, int amount) {
        this.detail_id = detail_id;
        this.price = price;
        this.order_id = order_id;
        this.product_id = product_id;
        this.amount = amount;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Order_Detail{" + "detail_id=" + detail_id + ", price=" + price + ", order_id=" + order_id + ", product_id=" + product_id + ", amount=" + amount + '}';
    }
    
   
   
}
