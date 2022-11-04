package com.swp391.group3.controller;

import com.google.gson.Gson;
import com.swp391.group3.comment.CommentDAO;
import com.swp391.group3.comment.CommentDTO;
import com.swp391.group3.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoadMoreCommentsController", urlPatterns = {"/LoadMoreCommentsController"})
public class LoadMoreCommentsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int amount = Integer.parseInt(request.getParameter("amount"));
            String ISBN = request.getParameter("ISBN");
            String filter = request.getParameter("filter");
            String username = request.getParameter("username");
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("USER");
                if (user != null && !user.getUsername().equals(username)) {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                } else {
                    CommentDAO commentDAO = new CommentDAO();
                    List<CommentDTO> comments = commentDAO.getMoreActiveComments(ISBN, username, 5, amount, filter);
                    if (comments != null) {
                        String json = new Gson().toJson(comments);
                        out.print(json);
                    } else {
                        out.print("{}");
                    }
                    out.flush();
                }
            }
        } catch (NamingException ex) {
            Logger.getLogger(LoadMoreCommentsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadMoreCommentsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoadMoreCommentsController.class.getName()).log(Level.SEVERE, null, ex);
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
