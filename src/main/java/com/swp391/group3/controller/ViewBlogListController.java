package com.swp391.group3.controller;

import com.swp391.group3.blog.BlogDAO;
import com.swp391.group3.blog.BlogDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
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

@WebServlet(name="ViewBlogListController", urlPatterns={"/ViewBlogListController"})
public class ViewBlogListController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.BlogFeatures.VIEW_BLOG_LIST_PAGE;
        try {
            BlogDAO dao = new BlogDAO();
            List<BlogDTO> blogs = dao.getBlogsByStatus("approved");
            Collections.sort(blogs, (BlogDTO b1, BlogDTO b2) -> b2.getPostedTime().compareTo(b1.getPostedTime()));
            request.setAttribute("BLOGS", blogs);
        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            Logger.getLogger(ViewBlogListController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ServletContext context = getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            request.getRequestDispatcher(actualUrl).forward(request, response);
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
