/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.inventory.InventoryDAO;
import com.swp391.group3.price.PriceDAO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.io.PrintWriter;
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            ServletContext context = request.getServletContext();
            Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
            BookDAO bookDAO = new BookDAO();
            PriceDAO priceDAO = new PriceDAO();
            InventoryDAO inventoryDAO = new InventoryDAO();
            String url = siteMap.getProperty(AppConstants.ManageBookFeatures.INVENTORY_BOOK_CONTROLLER);

            //get Parameter
            String[] genres = request.getParameterValues("updateGenres");
            for (String i : genres) {
                System.out.println(i);
            }
            String bookISBN = request.getParameter("updateBookISBN");
            String bookName = request.getParameter("updateBookName");
            String bookTranslator = request.getParameter("updateBookTranslator");
            String bookAuthorAlias = request.getParameter("updateBookAuthorAlias");
            String bookPrice = request.getParameter("updateBookPrice");
            String bookImage = request.getParameter("updateBookImage");
            String bookWeight = request.getParameter("updateBookWeight");
            String bookSize = request.getParameter("bookSize");
            String bookLanguage = request.getParameter("bookLanguage");
            String bookLayout = request.getParameter("bookLayout");
            String bookPage = request.getParameter("bookPage");
            String bookYearOfPublish = request.getParameter("bookYearOfPublish");
            String bookPublisher = request.getParameter("bookPublisher");
            String bookDes = request.getParameter("updateBookDes");
            String bookQuantity = request.getParameter("bookQuantity");
           
            if(bookTranslator.equals("")||bookTranslator==null){
                bookTranslator="unknown";
            }
            BookDTO book = new BookDTO(bookISBN, bookName, bookLanguage, bookDes, bookTranslator,
                    Float.parseFloat(bookPrice), Float.parseFloat(bookWeight), bookSize,
                    Integer.parseInt(bookYearOfPublish),
                    Integer.parseInt(bookPage), bookLayout, bookPublisher, bookImage);
            
            boolean result = bookDAO.updateBook(book, genres, bookAuthorAlias, Integer.parseInt(bookQuantity));
            if ((result) == false) {
                request.setAttribute("MESSEGE", "Update failed!");
            } else {
                         
                request.setAttribute("MESSEGE", "Update successfully!");

            }

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
