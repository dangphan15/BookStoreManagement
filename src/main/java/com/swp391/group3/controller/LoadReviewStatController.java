package com.swp391.group3.controller;

import com.google.gson.Gson;
import com.swp391.group3.rating.RatingDAO;
import com.swp391.group3.rating.RatingDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="LoadReviewStatController", urlPatterns={"/LoadReviewStatController"})
public class LoadReviewStatController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            String isbn = request.getParameter("ISBN");
            RatingDAO dao = new RatingDAO();
            RatingDTO dto = dao.getRatingByISBN(isbn);
            if (dto != null) {
                String json = new Gson().toJson(dto);
                out.print(json);
            }
            out.flush();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoadReviewStatController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadReviewStatController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoadReviewStatController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
