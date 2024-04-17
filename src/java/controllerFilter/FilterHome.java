/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerFilter;

import dal.DAO;
import dal.FilterDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


import model.Product1;

/**
 *
 * @author ACER
 */
@WebServlet(name = "FilterHome", urlPatterns = {"/filter"})
public class FilterHome extends HttpServlet {

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
       
        String[] pp = {"0 and 250",
            "250 and 500",
            "500 and 100"
        };
        boolean[] pb = new boolean[pp.length + 1];
        pb[0] = true;
        FilterDAO p = new FilterDAO();
        List<Product1> products = new ArrayList<>();
        String[] price = request.getParameterValues("price");
        if (price != null) {
            double from = 0, to = 0;
            for (int i = 0; i < price.length; i++) {

                List<Product1> temp = new ArrayList<>();
                if (price[i].equals("0")) {
                    from = 0;
                    to = 5000;
                    products = p.getProductByPrice(from, to);
                    pb[0] = true;
                    pb[1] = false;
                    pb[2] = false;
                    pb[3] = false;
                    break;
                } else {
                    if (price[i].equals("1")) {
                        from = 0;
                        to = 250;
                        temp = p.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[1] = true;
                        pb[0] = false;
                    }
                    if (price[i].equals("2")) {
                        from = 250;
                        to = 500;
                        temp = p.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[2] = true;
                         pb[0] = false;
                    }
                    if (price[i].equals("3")) {
                        from = 500;
                        to = 1500;
                        temp = p.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[3] = true;
                        pb[0] = false;
                    }

                }

            }
        }
        if (price == null) {
            pb[0] = true;
        }
        request.setAttribute("products", products);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.getRequestDispatcher("Filter.jsp").forward(request, response);
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

        processRequest(request, response);

//        DAO d = new DAO();
//        List<Category> list = d.getAllCategory();
//        String[] pp = {"0 and 250",
//            "250 and 500",
//            "500 and 100"
//        };
//        boolean[] pb = new boolean[pp.length + 1];
//        pb[0] = true;
//        FilterDAO p = new FilterDAO();
//        List<Product1> news = p.getNewProduct();
//        List<Product1> olds = p.getOldProduct();
//        boolean[] chid = new boolean[list.size()+1];
//        request.setAttribute("data", list);
//        request.setAttribute("news", news);
//        request.setAttribute("olds", olds);
//        request.setAttribute("pp", pp);
//        request.setAttribute("pb", pb);
//        request.setAttribute("cid", 0);
//        request.setAttribute("chid", chid);
//        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
        processRequest(request, response);

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
