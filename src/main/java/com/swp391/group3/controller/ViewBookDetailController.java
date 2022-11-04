/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.blog.BlogDAO;
import com.swp391.group3.blog.BlogDTO;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.inventory.InventoryDAO;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class ViewBookDetailController extends HttpServlet {

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
        BookDAO dao = new BookDAO();
        GenreDAO genreDAO = new GenreDAO();
        AuthorDAO authorDAO = new AuthorDAO();
        InventoryDAO inventoryDAO = new InventoryDAO();
        String ISBN = request.getParameter("ISBN");
        String url = siteMap.getProperty(AppConstants.ViewBookDetailFeature.VIEW_BOOK_DETAIL_PAGE);
        int quantity = 0;
        boolean isAllowed = false;
        try {
            BookDTO dto = dao.getBookByISBN(ISBN);
            List<AuthorDTO> authorsOfBook = authorDAO.getAuthorByBookISBN(dto.getISBN());
            List<GenreDTO> genreOfBook = genreDAO.getGenreByBookISBN(dto.getISBN());
            dto.setAuthors(authorsOfBook);
            dto.setGenres(genreOfBook);
            quantity = inventoryDAO.getQuantityByBookISBN(ISBN);
            request.setAttribute("BOOK", dto);
            if (quantity > 0) {
                request.setAttribute("STOCK_STATUS", "in stock");
            } else {
                request.setAttribute("STOCK_STATUS", "out of stock");
            }
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO user = (UserDTO)session.getAttribute("USER");
                if (user != null) {
                    UserDAO userDAO = new UserDAO();
                    isAllowed = userDAO.isAllowedToRateBook(user.getUsername(), ISBN);
                }
            }
            request.setAttribute("IS_ALLOWED_TO_RATE", isAllowed);
            BlogDAO blogDAO = new BlogDAO();
            List<BlogDTO> blogs = blogDAO.getApprovedBlogsByISBN(ISBN);
            if (blogs != null) {
                request.setAttribute("BLOGS", blogs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ViewBookDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewBookDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewBookDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            //System.out.println(url);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
