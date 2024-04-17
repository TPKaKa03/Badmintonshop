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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;

import model.Product;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CategoryServelet", urlPatterns = {"/category"})
public class CategoryServelet extends HttpServlet {

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
            out.println("<title>Servlet CategoryServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServelet at " + request.getContextPath() + "</h1>");
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
        String cid = request.getParameter("id");
        DAO dao = new DAO();
        List<Product> list = dao.getProducByCid(cid);
        List<Category> listC = dao.getAllCategory();
       request.setAttribute("listCC", listC);
      
        request.setAttribute("listP", list);
        
        
        Product last = dao.getLast();
        request.setAttribute("p", last);
        DAO d = new DAO();
        List<Category> listca = d.getAllCategory();
        String[] pp = {"0 and 250",
            "250 and 500",
            "500 and 100"
        };
        boolean[] pb = new boolean[pp.length + 1];
        pb[0] = true;
        FilterDAO p = new FilterDAO();
//        List<Product1> news = p.getNewProduct();
//        List<Product1> olds = p.getOldProduct();
        boolean[] chid = new boolean[listca.size()+1];
        request.setAttribute("data", listca);
//        request.setAttribute("news", news);
//        request.setAttribute("olds", olds);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("chid", chid);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
   
    
    
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
