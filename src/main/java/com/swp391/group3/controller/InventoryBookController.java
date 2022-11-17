/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.publisher.PublisherDAO;
import com.swp391.group3.publisher.PublisherDTO;
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            ServletContext context = request.getServletContext();
            Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
            String url = siteMap.getProperty(AppConstants.ManageBookFeatures.INVENTORY_BOOK_PAGE);
            BookDAO bookDAO = new BookDAO();
            AuthorDAO authorDAO = new AuthorDAO();
            GenreDAO genreDAO = new GenreDAO();
            PublisherDAO publisherDAO = new PublisherDAO();

            String txtsearch = request.getParameter("txtsearch");
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            int count = 0;

            List<BookDTO> bookList = new ArrayList<>();
            if (txtsearch == null || txtsearch.equals("")) {
                bookList = bookDAO.getAllBookPaging(index);
                count = bookDAO.getAllBook().size();
                if (bookList != null) {
                     for (BookDTO book : bookList) {
                        book.setAuthors(authorDAO.getAuthorByBookISBN(book.getISBN()));
                        book.setGenres(genreDAO.getGenreByBookISBN(book.getISBN()));
                    }
                }
            } else {
                bookList = bookDAO.getBookByNamePaging(txtsearch, index);
                if (bookDAO.getBookByName(txtsearch) != null) {
                    count = bookDAO.getBookByName(txtsearch).size();
                    for (BookDTO book : bookList) {
                        book.setAuthors(authorDAO.getAuthorByBookISBN(book.getISBN()));
                        book.setGenres(genreDAO.getGenreByBookISBN(book.getISBN()));
                    }
                }
            }

            Date currentDate = new Date(System.currentTimeMillis());
            Map<String, Boolean> genreList = genreDAO.getAllGenreToMap();

            List<PublisherDTO> publisherList = new ArrayList<>();
            publisherList = publisherDAO.getAllPublishers();

            List<AuthorDTO> authorList = new ArrayList<>();
            authorList = authorDAO.getAllAuthor();

            List<String> languageList = new ArrayList<>();
            languageList = bookDAO.getAllLanguage();

            List<String> layoutList = new ArrayList<>();
            layoutList = bookDAO.getAllLayout();

            //Paging 
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }

            request.setAttribute("bookList", bookList);
            request.setAttribute("genreList", genreList);
            request.setAttribute("currentDate", currentDate);
            request.setAttribute("publisherList", publisherList);
            request.setAttribute("authorList", authorList);
            request.setAttribute("languageList", languageList);
            request.setAttribute("layoutList", layoutList);
            request.setAttribute("endPage", endPage);
            request.setAttribute("txtsearch", txtsearch);

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
