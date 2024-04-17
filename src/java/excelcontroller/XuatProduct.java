/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package excelcontroller;

import dal.DAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;
import model.Product;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author ACER
 */
@WebServlet(name = "XuatProduct", urlPatterns = {"/xuatExcelProductControl"})
public class XuatProduct extends HttpServlet {

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

        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();

        System.out.print(list.get(0));

        int maximum = 2147483647;
        int minimum = 1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum = rn.nextInt(range) + minimum;

        FileOutputStream file = new FileOutputStream("C:\\ExcelWebBanGiay\\" + "san-pham" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet workSheet = workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;
        XSSFCell cell5;

        row = workSheet.createRow(0);
        cell0 = row.createCell(0);
        cell0.setCellValue("ID");
        cell1 = row.createCell(1);
        cell1.setCellValue("Name");
        cell2 = row.createCell(2);
        cell2.setCellValue("Image");
        cell3 = row.createCell(3);
        cell3.setCellValue("Price");
        cell4 = row.createCell(4);
        cell4.setCellValue("Title");
        cell5 = row.createCell(5);
        cell5.setCellValue("Title");

        int i = 0;

        for (Product pro : list) {
            i = i + 1;
            row = workSheet.createRow(i);
            cell0 = row.createCell(0);
            cell0.setCellValue(pro.getId());
            cell1 = row.createCell(1);
            cell1.setCellValue(pro.getName());
            cell2 = row.createCell(2);
            cell2.setCellValue(pro.getImage());
            cell3 = row.createCell(3);
            cell3.setCellValue(pro.getPrice());
            cell4 = row.createCell(4);
            cell4.setCellValue(pro.getTitle());
            cell4 = row.createCell(5);
            cell4.setCellValue(pro.getTitle());

        }

        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("manager").forward(request, response);
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
