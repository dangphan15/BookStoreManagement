/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class StartAppController extends HttpServlet {

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
        ServletContext context = request.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
        BookDAO bookDAO = new BookDAO();
        GenreDAO genreDAO = new GenreDAO();
        AuthorDAO authorDAO = new AuthorDAO();
        String url = siteMap.getProperty(AppConstants.StartAppFeature.HOME_PAGE);
        try {
            List<BookDTO> bookList = bookDAO.getRecommendedBook(18);
            List<GenreDTO> genreList = genreDAO.getAllGenre();
            List<BookDTO> highRatingList = bookDAO.getHighRatingBook(12);
            List<BookDTO> saleOffList = bookDAO.getSaleOffBook(4);
            List<BookDTO>   bestSellingList = bookDAO.getBestSellingBook(18);
            List<BookDTO> trendingList = bookDAO.getTrendingBook(12, 30);
            List<BookDTO> actionAdventureList = bookDAO.getBookByCategory("Action", 18);
            actionAdventureList.addAll(bookDAO.getBookByCategory("Adventure", 18));
            if (actionAdventureList.size() > 18) {
                actionAdventureList = actionAdventureList.subList(0, 18);
            }
            List<BookDTO> romanticList = bookDAO.getBookByCategory("Romantic comedy", 18);
            System.out.println(trendingList.size());
            addAuthor(bookList);
            addAuthor(highRatingList);
            addAuthor(saleOffList);
            addAuthor(bestSellingList);
            addAuthor(trendingList);
            addAuthor(actionAdventureList);
            addAuthor(romanticList);
//            for (int i = 0; i < bookList.size(); ++i) {
//                BookDTO dto = bookList.get(i);
//                List<AuthorDTO> authorsOfBook = authorDAO.getAuthorByBookISBN(dto.getISBN());
//                dto.setAuthors(authorsOfBook);
//            }
//            for (int i = 0; i < highRatingList.size(); ++i) {
//                BookDTO dto = highRatingList.get(i);
//                List<AuthorDTO> authorsOfBook = authorDAO.getAuthorByBookISBN(dto.getISBN());
//                dto.setAuthors(authorsOfBook);
//            }
            request.setAttribute("HIGH_RATING", highRatingList);
            request.setAttribute("BOOK_LIST", bookList);
            request.setAttribute("SALE_OFF_LIST", saleOffList);
            request.setAttribute("BEST_SELLERS", bestSellingList);
            request.setAttribute("TRENDING_LIST", trendingList);
            request.setAttribute("ACTION_ADVENTURE_LIST", actionAdventureList);
            request.setAttribute("ROMANTIC_LIST", romanticList);
            request.setAttribute("GENRE_LIST2", genreList);


        } catch (SQLException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

    }

    private void addAuthor(List<BookDTO> list) throws ClassNotFoundException, SQLException, NamingException {
        AuthorDAO authorDAO = new AuthorDAO();
        for (int i = 0; i < list.size(); ++i) {
            BookDTO dto = list.get(i);
            List<AuthorDTO> authorsOfBook = authorDAO.getAuthorByBookISBN(dto.getISBN());
            dto.setAuthors(authorsOfBook);
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
