/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "/admin/InventoryBookController", urlPatterns = {"/admin/InventoryBookController"})
public class InventoryBookController extends HttpServlet {

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
        try {
            ServletContext context = request.getServletContext();
            Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
            BookDAO bookDAO = new BookDAO();
            AuthorDAO authorDAO = new AuthorDAO();
            GenreDAO genreDAO = new GenreDAO();

            String txtsearch = request.getParameter("txtsearch");

            String url = siteMap.getProperty(AppConstants.ManageBookFeatures.INVENTORY_BOOK_PAGE);

            List<BookDTO> bookList = new ArrayList<>();
            if (txtsearch == null) {
                bookList = bookDAO.getAllBook();
            } else {
                bookList = bookDAO.getBookByName(txtsearch);
            }
            for (BookDTO book : bookList) {
                book.setAuthors(authorDAO.getAuthorByBookISBN(book.getISBN()));
            }
            
            Date currentDate=new Date(System.currentTimeMillis());
            Map<String, Boolean> genreList = genreDAO.getAllGenreToMap();

            request.setAttribute("bookList", bookList);
            request.setAttribute("genreList", genreList);
            request.setAttribute("currentDate", currentDate);
            
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
