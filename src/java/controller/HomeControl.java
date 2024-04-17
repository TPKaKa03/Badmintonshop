/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.FilterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;
import model.Product1;

/**
 *
 * @author ACER
 */
@WebServlet(name = "HomeControl", urlPatterns = {"/Home"})
public class HomeControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        //    List<Product> list = dao.getAllProduct();
        Product last = dao.getLast();
        List<Category> listC = dao.getAllCategory();
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Product> listp = dao.getProductbyPaging(index);
        // day list len jsp
//        HttpSession session = request.getSession();
//        session.setAttribute("list", list);

        int count = dao.getTotalProduct();
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
        // su ly  phan Cart
        String txt = "";
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        //  List<Product> list = dao.getAllProduct();

        Cart cart = new Cart();
        cart.initializeCartFromText(txt, listp);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
//        request.setAttribute("data", list);

       
        request.setAttribute("listCC", listC);
        //  request.setAttribute("listP", list);
        request.setAttribute("p", last);
         request.setAttribute("listP", listp);
        request.setAttribute("endP", endPage);
        //---------------------------------------\
//        DAO d = new DAO();
//        List<Category> listt = d.getAllCategory();
//        String[] pp = {"0 and 250",
//            "250 and 500",
//            "500 and 100"
//        };
//        boolean[] pb = new boolean[pp.length + 1];
//        pb[0] = true;
//        FilterDAO p = new FilterDAO();
//        List<Product1> products = new ArrayList<>();
//        String[] price = request.getParameterValues("price");
//        if (price != null) {
//            double from = 0, to = 0;
//            for (int i = 0; i < price.length; i++) {
//
//                List<Product1> temp = new ArrayList<>();
//                if (price[i].equals("0")) {
//                    from = 0;
//                    to = 5000;
//                    products = p.getProductByPrice(from, to);
//                    pb[0] = true;
//                    break;
//
//                } else {
//                    if (price[i].equals("1")) {
//                        from = 0;
//                        to = 250;
//                        temp = p.getProductByPrice(from, to);
//                        products.addAll(temp);
//                        pb[1] = true;
//                    }
//                    if (price[i].equals("2")) {
//                        from = 250;
//                        to = 500;
//                        temp = p.getProductByPrice(from, to);
//                        products.addAll(temp);
//                        pb[2] = true;
//                    }
//                    if (price[i].equals("3")) {
//                        from = 500;
//                        to = 1500;
//                        temp = p.getProductByPrice(from, to);
//                        products.addAll(temp);
//                        pb[3] = true;
//                    }
//
//                }
//
//            }
//        }
//        if (price == null) {
//            pb[0] = true;
//        }
//        request.setAttribute("products", products);
//        request.setAttribute("pp", pp);
//        request.setAttribute("pb", pb);
        DAO d = new DAO();
        List<Category> list = d.getAllCategory();
        String[] pp = {"0 and 250",
            "250 and 500",
            "500 and 100"
        };
        boolean[] pb = new boolean[pp.length + 1];
        pb[0] = true;
       // FilterDAO p = new FilterDAO();
//        List<Product1> news = p.getNewProduct();
//        List<Product1> olds = p.getOldProduct();
        boolean[] chid = new boolean[list.size() + 1];
        request.setAttribute("data", list);
//        request.setAttribute("news", news);
//        request.setAttribute("olds", olds);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("chid", chid);
        request.getRequestDispatcher("Home.jsp").forward(request, response);

    }

//         response.sendRedirect("Home.jsp");
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sortOption = request.getParameter("sortOption");
       DAO dao = new DAO();
        String indexPage = request.getParameter("indexs");
        if (indexPage == null) {
            indexPage = "1";
        }
        int count = dao.getTotalProduct();
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
         request.setAttribute("endP", endPage);
        if (sortOption != null) {
            if (sortOption.equals("0")) {
              //  DAO dao = new DAO();
               int index = Integer.parseInt(indexPage);
                List<Product> listc = dao.getProductbyPagingASC(index);
                request.setAttribute("listP", listc);
                
                request.getRequestDispatcher("filtest.jsp").forward(request, response);

            } else if (sortOption.equals("1")) {
             //   DAO dao = new DAO();
                  int index = Integer.parseInt(indexPage);
                List<Product> listc = dao.getProductbyPagingDESC(index);
                request.setAttribute("listP", listc);
                request.getRequestDispatcher("filtest.jsp").forward(request, response);
            } 
        
         
    } else{
   
       response.sendRedirect("Home.jsp");
        
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
