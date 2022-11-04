/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.swp391.group3.book.BookDAO;
import com.swp391.group3.bookImport.BookImportDAO;
import com.swp391.group3.inventory.InventoryDAO;
import com.swp391.group3.price.PriceDAO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "/admin/UpdateBookController", urlPatterns = {"/admin/UpdateBookController"})
public class UpdateBookController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            ServletContext context = request.getServletContext();
            Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
            BookDAO bookDAO = new BookDAO();
            BookImportDAO bookImportDAO = new BookImportDAO();
            InventoryDAO inventoryDAO = new InventoryDAO();
            String url = siteMap.getProperty(AppConstants.ManageBookFeatures.INVENTORY_BOOK_CONTROLLER);
            
            // get data from inventoryBook.jsp
            String bookISBN = request.getParameter("bookISBN");
            String bookQuantity = request.getParameter("bookQuantity");
            String bookPrice = request.getParameter("bookPrice");
            String bookPublisher = request.getParameter("bookPublisher");
            Date importDate = Date.valueOf(request.getParameter("import_date"));
                      
            int currentQuantity=inventoryDAO.getQuantityByBookISBN(bookISBN);
            //update inventory table
            inventoryDAO.updateQuantityBook(bookISBN, Integer.parseInt(bookQuantity)+currentQuantity);
            
             //insert into book_import table
            bookImportDAO.insertBookImport(bookISBN, bookPublisher, 
                    Integer.parseInt(bookQuantity), importDate, Float.parseFloat(bookPrice));
           

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
