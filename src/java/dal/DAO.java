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
import model.Product;
import model.Account;

public class DAO extends DBContext {

//    public Admin checkAccount(String username, String password) {
//        String sql = "SELECT * FROM Admin WHERE username=? AND password=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            st.setString(2, password);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                Admin a = new Admin(username, password, rs.getInt("role"));
//                return a;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
    // Fix laij cho bangr Customer
    public Account checkAccount1(String username, String password) {
        String sql = "SELECT * FROM Account WHERE [user]=? AND pass=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account b = new Account(rs.getInt("uID"), username, password, rs.getInt("isSell"), rs.getInt("isAdmin"), rs.getString(6));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    // GETTaLL ACCOUNTT
    // tra ve 1ist product

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Account> list = dao.getAllAccount();
//        for (Account o : list) {
//            System.out.println(o);
//        }
//    }
    // tra ve 1ist product
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

    // edit AmountCart
    public void editAmountCart(int accountID, int productID, int amount) {
        String sql = "update Cart set [amount]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
//          public static void main(String[] args) {
//        DAO dao = new DAO();
//        dao.editAmountCart(1, 3, 5);
//        }
    // delete Cart

    public void deleteCart(int productID) {
        String sql = "delete from Cart where productID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        for (Product o : list) {
            System.out.println(o);
        }
    }
    // check cartExit
//     public Cart checkCartExist(int accountID,int productID) {
//
//       String sql = "select * from Cart\r\n"
//       		+ "where [accountID] = ? and [productID] = ?";
//       try {
//             PreparedStatement ps = connection.prepareStatement(sql);
//           ps.setInt(1, accountID);
//           ps.setInt(2, productID);
//           ResultSet rs=  ps.executeQuery();
//           if (rs.next()) {
//               Cart b = new Cart(rs.getInt(1),
//                       rs.getInt(2),
//                       rs.getInt(3),
//                       rs.getInt(4),
//                       rs.getString(5));
//               return b;
//           }
//       } catch (SQLException e) {
//       }
//      return null;
//   }
    // edit CartAmount
    public void editAmountAndSizeCart(int accountID, int productID, int amount, String size) {
        String sql = "update Cart set [amount]=?,\r\n"
                + "[size]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, amount);
            ps.setString(2, size);
            ps.setInt(3, accountID);
            ps.setInt(4, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // InsertCart
    public void insertCart(int accountID, int productID, int amount, String size) {
        String sql = "insert Cart(accountID, productID, amount,size)\r\n"
                + "values(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.setString(4, size);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
//     public static void main(String[] args) {
//    DAO dao = new DAO();
//    Cart cart = dao.checkCartExist(1, 1);
//    
//    if (cart != null) {
//        System.out.println("Cart exists:");
//        System.out.println("Account ID: " + cart.getAccountID());
//        System.out.println("Product ID: " + cart.getProductID());
//        // In các thông tin khác của giỏ hàng nếu cần
//    } else {
//        System.out.println("Cart does not exist.");
//    }
//}
// public static void main(String[] args) {
//    DAO dao = new DAO();
//    dao.insertCart(0, 0, 0, "medium");}
    //get productByPaging 

    public List<Product> getProductbyPaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "ORDER BY id \n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

    // getProductByPagingASC
    public List<Product> getProductbyPagingASC(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "ORDER BY price ASC\n" // ASC for ascending order, you can use DESC for descending
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

    // getProductByPagingASC
    public List<Product> getProductbyPagingDESC(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "ORDER BY price DESC\n" // ASC for ascending order, you can use DESC for descending
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

    // getProduct by sellID
    public List<Product> getProductbyPagingSell(int sellid, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product where sellID = ?\n"
                + "                 ORDER BY id \n"
                + "                OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sellid);
            ps.setInt(2, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

//     public static void main(String[] args) {
//        DAO dao = new DAO();
//       List<Product>list =  dao.getProductbyPaging(1);
//       for(Product o:list){
//           System.out.println(o);   
//       }
//        }
    // getCartbyAccountID
//     public List<Cart> getCartByAccountID(int accountID) {
//    	 List<Cart> list = new ArrayList<>();
//        String sql = "select * from Cart where accountID = ?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1,accountID );
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//
//                list.add(new Cart(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getInt(4),
//                        rs.getString(5)
//                       ));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    // getProduct bysellID
    public List<Product> getProductsellID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product where sellID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }

    // get Product byid
    public List<Product> getProductByID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
        
    }
    // Insert in to Product

    public void insertProduct(String name, String image, String title, float priceValue, int sid, String cateID, int num) {
        String sql = "insert into Product values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //  st.setInt(1,id);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, title);
            st.setFloat(4, priceValue);
            st.setInt(5, sid);
            st.setString(6, cateID);
            st.setInt(7, num);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }

    // update Product
    public void updateProduct(String name, String image, String title, float priceValue, int cateIDValue, String pid) {
//        String sql = "UPDATE [dbo].[Product]\n"
//                + "   SET [name] = ?,\n"
//                + "       [image] = ?,\n"
//                + "     [title] =?           ,\n"
//                + "      [price] = ? ,\n"
//                + "      [cateID] = ?,\n"
//                + " WHERE id = ?";
//        

        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?,\n"
                + "       [image] = ?,\n"
                + "       [title] = ?,\n"
                + "       [price] = ?,\n"
                + "       [cateID] = ?\n" // Remove the comma here
                + " WHERE id = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //  st.setInt(1,id);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, title);
            st.setFloat(4, priceValue);
            st.setInt(5, cateIDValue);
            st.setString(6, pid);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
    // getAll Category

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//
//        dao.updateProduct("aa", "v", "ccc", 2, 0, "1");
//
//    }
    public boolean existedUser(String username) {
        String sql = "SELECT * FROM Account WHERE [user]=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

//    public void regiser(Admin ac) {
//        String sql = "insert into admin values (?,?,?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, ac.getUsername());
//            st.setString(2, ac.getPassword());
//            st.setInt(3, ac.getRole());
//            st.executeUpdate();
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
    // fic lai cho phu hop vowi bang customer
    public void regiser(Account ac) {
        String sql = "insert into [user] values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ac.getPass());
            st.setString(2, ac.getUser());
            st.setInt(4, ac.getIsAdmin());
            st.setInt(3, ac.getIsSell());
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public void change(Admin a) {
//        String sql = "update admin set password ? where username?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, a.getPassword());
//            st.setString(2, a.getUsername());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//    }
    // fix laij cho hu hop voi customer
    public void change(String c, int a) {
        String sql = "update Account set pass = ? where uID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(2, a);
            st.setString(1, c);
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//      List<Product> list=dao.getTop3ProducByCid("1");
//      for(Product o: list){
//          System.out.println(o);   
//      }
//      
//    }

    public Product getLast() {
        String sql = "SELECT top 1* FROM Product order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // getProduct by CategoryID
//    public List<Product> getProducByCid(String id_c) {
//        List<Product> list = new ArrayList<>();
//        String sql = "SELECT * FROM Products Where cid=?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            ps.setString(1, id_c); // 1 la dau cham hoi thu 1                   
//            while (rs.next()) {
//
//                list.add(new Product(rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(8)));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//
//    }
//    
    // dem so luong product trong db
    public int getTotalProduct() {
        String sql = "Select count(*) from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    // đem so luong product theo sellID
    public int getTotalProductbysellID(int sellID) {
        String sql = "Select count(*) from Product where sellID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sellID); // 1 la dau cham hoi thu 1
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }
//     public static void main(String[] args) {
//        DAO dao = new DAO();
//       int t = dao.getTotalProductbysellID(1);
//      
//            System.out.println(t);
//      
//    }

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//
//        int count = dao.getTotalProduct();
//        System.out.println(count);
//
//    }
    public List<Product> getProducByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE cateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid); // Đặt giá trị cho tham số trước khi thực hiện truy vấn để ý cxhoxo này

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // san pham cung loại
    public List<Product> getTop3ProducByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * from Product WHERE cateID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid); // Đặt giá trị cho tham số trước khi thực hiện truy vấn để ý cxhoxo này

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Category> getAllCategory() {
        List<Category> listc = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                listc.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listc;
        
    }
    // getProduct by ID

    public Product getProducByID(String id) {
        
        String sql = "SELECT * FROM Product WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id); // Đặt giá trị cho tham số trước khi thực hiện truy vấn để ý cxhoxo này

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // get product by name
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product Where name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%"); // Đặt giá trị cho tham số trước khi thực hiện truy vấn để ý cxhoxo này

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // delete product
    public void deleteProduct(String pid) {
        String sql = "delete from Product where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pid);
            
            ps.executeQuery();
            
        } catch (SQLException e) {
        }
    }

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//       dao.deleteProduct("Yonex9");
//    
//
//        }
    // insert account
    public void insertAccount(String user, String pass, int isSell,
            int isAdmin) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([user]\n"
                + "           ,[pass]\n"
                + "           ,[isSell]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // delete account

    public void deleteAccount(String id) {
        String sql = "delete from Account where uID= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // DELETE PRODUCT BY ACCOUNT_ID
    public void deleteProductBySellID(String id) {
        String sql = "delete from Product\n"
                + "where [sellID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // DELETE ORDER BY CID

    public void deleteOrdersByAccountId(String id) {
        String sql = "delete from Orders\n"
                + "where [cid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    // SortProduct DESC BY Price

    public List<Product> sortbyDESC() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ORDER BY price DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    // sorrt product by ASC

    public List<Product> sortbyASC() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ORDER BY price ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // check account exit by email
    public Account checkAccountExistByUsernameAndEmail(String username, String email) {
        String sql = "SELECT * FROM Account WHERE [user] = ? AND [email] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)
                );
            }
        } catch (SQLException e) {
            System.out.println(e); // handle the exception appropriately, don't ignore it
        }
        return null;
    }
    
}
