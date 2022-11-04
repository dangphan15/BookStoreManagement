package com.swp391.group3.controller;

import com.swp391.group3.blog.BlogDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CreateBlogController", urlPatterns = {"/CreateBlogController"})
public class CreateBlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = AppConstants.ViewBookDetailFeature.VIEW_BOOK_DETAIL_CONTROLLER;
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String isbn = request.getParameter("ISBN");
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("USER");
                if (user != null) {
                    String author = user.getUsername();
                    BlogDAO dao = new BlogDAO();
                    if (title != null && content != null && isbn != null) {
                        dao.createBlog(author, isbn, title, content);
                    }
                }
            }
            url += ("?ISBN=" + isbn);

        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(CreateBlogController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
