/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;


import model.Product1;

/**
 *
 * @author ACER
 */
public class FilterDAO extends DBContext {

    public List<Product1> getNewProduct() {
        List<Product1> list = new ArrayList<>();
        String sql = "SELECT Top 3 [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[sellID]\n"
                + "      ,[cateID]\n"
                + "      ,[amount]\n"
                + "  FROM [dbo].[Product]\n"
                + "  order by id DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product1 p = new Product1();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setImage(rs.getString(3));
                p.setTitle(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setSellID(rs.getInt(6));
                Category c = getCategorybyID(rs.getInt(7));
                p.setCategory(c);
                p.setAmount(rs.getInt(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product1> getOldProduct() {
        List<Product1> list = new ArrayList<>();
        String sql = "SELECT Top 3 [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[sellID]\n"
                + "      ,[cateID]\n"
                + "      ,[amount]\n"
                + "  FROM [dbo].[Product]\n"
                + "  order by id ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product1 p = new Product1();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setImage(rs.getString(3));
                p.setTitle(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setSellID(rs.getInt(6));
                Category c = getCategorybyID(rs.getInt(7));
                p.setCategory(c);
                p.setAmount(rs.getInt(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
    //getCategorybyid

    public Category getCategorybyID(int id) {

        String sql = "SELECT * FROM Category where cid= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

//    public static void main(String[] args) {
//        FilterDAO dao = new FilterDAO();
//        List<Product1> list = dao.getNewProduct();
//        for (Product1 o : list) {
//            System.out.println(o);
//
//        }
//    }
    // GET PRODUCT BY PRICE
     public List<Product1> getProductByPrice(double from, double to) {
        List<Product1> list = new ArrayList<>();
        String sql = "SELECT Top 3 [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[sellID]\n"
                + "      ,[cateID]\n"
                + "      ,[amount]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where price between ? and ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, from);
            ps.setDouble(2, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product1 p = new Product1();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setImage(rs.getString(3));
                p.setTitle(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setSellID(rs.getInt(6));
                Category c = getCategorybyID(rs.getInt(7));
                p.setCategory(c);
                p.setAmount(rs.getInt(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
      public static void main(String[] args) {
        FilterDAO dao = new FilterDAO();
        List<Product1> list = dao.getProductByPrice(0, 500);
        for (Product1 o : list) {
            System.out.println(o);
        }
    }
      

}
