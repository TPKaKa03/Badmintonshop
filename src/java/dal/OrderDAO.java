/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.NumberSP;
import model.Orders;
import model.Product;

/**
 * (<username, nvarchar(30),>
 * ,<order_date, date,>
 * ,<size, nvarchar(50),>
 * ,<discount, float,>
 * ,<cid, int,>) GO
 *
 * @author ACER
 */
public class OrderDAO extends DBContext {

    public boolean addOrder(Account a, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date_raw = curDate.toString();
        Date date = Date.valueOf(date_raw);

        try {
            String sql = "INSERT INTO [dbo].[Orders]([order_date],[cid],[ total_price])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setInt(2, a.getuID());
            ps.setDouble(3, cart.getTotalMoney());
            ps.executeUpdate();
//            return true;
            // take id of order table that have just added
            String sql1 = "SELECT TOP 1 order_id FROM Orders ORDER BY order_id DESC";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("order_id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]([price],[order_id] ,[product_id] ,[amount]) VALUES\n"
                            + "           (?,?,?,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(4, i.getAmmount());
                    ps2.setInt(2, oid);
                    ps2.setDouble(1, i.getPrice());
                    ps2.setInt(3, i.getProduct().getId());

                    ps2.executeUpdate();
                }
            }// String query2 = "INSERT INTO OrderDetail (order_id, product_id, quantity, price, total_price)"
            //            + "VALUES (?, ?, ?, ?, ?)";
            // update stock of product 

            String sql3 = "Update from Product set amount = amount-? where id = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                ps3.setInt(1, i.getAmmount());
                ps3.setInt(2, i.getProduct().getId());
                ps3.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    // getALLOrders
//    [order_id] [int] IDENTITY(1,1) NOT NULL,
//	[order_date] [date] NOT NULL,
//	[cid] [int] NOT NULL,
//	[ total_price] [float] NULL,

    public List<Orders> getAllOrders(int cid) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE cid =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getDate(2).toLocalDate(), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
//       public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        List<Orders> list = dao.getAllOrders();
//        for (Orders o : list) {
//            System.out.println(o);
//        }
//    } 

    public List<Account> getAllAccount() {
        List<Account> listP = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listP.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

//           select SUM([ total_price]) from Orders
//        		where MONTH(order_date) = 10
//        		Group by MONTH(order_date)
    // TOTAL MONEY MONTH
    public double totalMoneyMonth(int month) {
        String sql = "select SUM([ total_price]) from Orders\n"
                + "        		where MONTH(order_date) = ?\n"
                + "        		Group by MONTH(order_date)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    // TOTAL MONEY DAY
    public double totalMoneyDay(int day) {
        String sql = "			select \n"
                + "        			SUM([ total_price])\n"
                + "        		from Orders\n"
                + "        		where DATEPART(dw,[order_date]) = ?\n"
                + "        		Group by order_date";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, day);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    // add san pham da ban 
    public boolean addNumberSale(int number, int id) {
        String sql = "INSERT INTO [dbo].[NumberSP]\n"
                + "           ([SLDaBan]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, id);
            ps.setInt(1, number);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;
    }

//    public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        dao.addNumberSale(1, 3);
//
//    }
    // TOP 10 SP ban chay
    public List<NumberSP> getTop5SanPhamBanChay() {
        List<NumberSP> list = new ArrayList<>();
        String sql = "select top(5) *\r\n"
                + "from NumberSP\r\n"
                + "order by SLDaBan desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NumberSP(rs.getInt(1),
                        rs.getInt(2)
                ));
            }
        } catch (SQLException e) {
        }
        return list;
    }

//    public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        List<NumberSP> list = dao.getTop5SanPhamBanChay();
//        for (NumberSP o : list) {
//            System.out.println(o);
//        }
//    }
    // filter by price 
    public List<Product> getProductByPrice(String priceRange) {
        List<Product> list = new ArrayList<>();
        String[] priceValues = priceRange.split(" and ");
        if (priceValues.length == 2) {
            try {
                double minPrice = Double.parseDouble(priceValues[0]);
                double maxPrice = Double.parseDouble(priceValues[1]);
                String sql = "SELECT * FROM Product WHERE price BETWEEN ? AND ?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setDouble(1, minPrice);
                ps.setDouble(2, maxPrice);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Product(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8)
                    ));
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Product> list = dao.getProductByPrice("0 and 100");
        for (Product o : list) {
            System.out.println(o);
        }
    }
    

}
