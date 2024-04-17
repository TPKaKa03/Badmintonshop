/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class NumberSP {
    private int sldaban;
    private int productid;

    public NumberSP() {
    }

    public NumberSP(int sldaban, int productid) {
        this.sldaban = sldaban;
        this.productid = productid;
    }

    public int getSldaban() {
        return sldaban;
    }

    public void setSldaban(int sldaban) {
        this.sldaban = sldaban;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    @Override
    public String toString() {
        return "NumberSP{" + "sldaban=" + sldaban + ", productid=" + productid + '}';
    }

    
    
    
}
