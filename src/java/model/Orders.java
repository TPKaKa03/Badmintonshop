/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author ACER
 */

/**
 * 
 * 
 * CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[order_date] [date] NOT NULL,
	[size] [nvarchar](50) NULL,
	[discount] [float] NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED
 * @author ACER
 */
public class Orders {
   
    private LocalDate order_date;
    private int cid;
    private Double total_price;
    public Orders() {
    }

    public Orders(LocalDate order_date, int cid, Double total_price) {
        this.order_date = order_date;
        this.cid = cid;
        this.total_price = total_price;
    }

    public LocalDate getOrder_date() {
        return order_date;
    }

    public void setOrder_date(LocalDate order_date) {
        this.order_date = order_date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Double total_price) {
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "Orders{" + "order_date=" + order_date + ", cid=" + cid + ", total_price=" + total_price + '}';
    }
    

    

   

    
}
