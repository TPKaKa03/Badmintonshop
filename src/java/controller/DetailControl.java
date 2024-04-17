/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;

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

/**
 *
 * @author ACER
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {

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
            out.println("<title>Servlet DetailControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailControl at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("pid");
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategory();
        Product p = dao.getProducByID(id);
        request.setAttribute("detail", p);
        //-------------------------

        Product last = dao.getLast();
        request.setAttribute("pa", last);
        //-------------------------------------
        request.setAttribute("listCC", listC);
        //  String cid = request.getParameter("id");
        int a = p.getCateID();
        List<Product> listtop = dao.getTop3ProducByCid(a);
        List<Product> list = dao.getProducByCid(id);
        request.setAttribute("listP", list);

//        add amount of cart 
        String txt = "";
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        List<Product> listAllP = dao.getAllProduct();
        Cart cart = new Cart();
        cart.initializeCartFromText(txt, listAllP);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);

//        List<Category> listct = da.getAllCategory();
//        String[] pp = {"0 and 250",
//            "250 and 500",
//            "500 and 100"
//        };
//        boolean[] pb = new boolean[pp.length + 1];
//        pb[0] = true;
        //  FilterDAO pa = new FilterDAO();
//        List<Product1> news = p.getNewProduct();
//        List<Product1> olds = p.getOldProduct();
//        boolean[] chid = new boolean[listct.size()+1];
        //   request.setAttribute("data", listct);
//        request.setAttribute("news", news);
//        request.setAttribute("olds", olds);
//        request.setAttribute("pp", pp);
//        request.setAttribute("pb", pb);
//        request.setAttribute("cid", 0);
//        request.setAttribute("chid", chid);
//-----------------------------------------------------------
        request.setAttribute("listtop", listtop);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

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

        DAO dao = new DAO();
        List<Product> listProduct = dao.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        String c_id = request.getParameter("size");
        String number = request.getParameter("quantity");
        String id = request.getParameter("pid");
        if (txt.isEmpty()) {
            txt = id + ":" + number + ":" + c_id;
        } else {
            txt += "-" + id + ":" + number + ":" + c_id;
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24);
        response.addCookie(c);

        response.sendRedirect("detail?pid=" + id);
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
