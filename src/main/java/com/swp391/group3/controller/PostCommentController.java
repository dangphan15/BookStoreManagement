package com.swp391.group3.controller;

import com.google.gson.Gson;
import com.swp391.group3.comment.CommentDAO;
import com.swp391.group3.comment.CommentDTO;
import com.swp391.group3.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PostCommentController", urlPatterns = {"/PostCommentController"})
public class PostCommentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String content = request.getParameter("content");
            String isbn = request.getParameter("ISBN");
            float star = Float.parseFloat(request.getParameter("star"));
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("USER");
                String username = request.getParameter("username");
                if (user == null || !user.getUsername().equals(username)) {
                    session.setAttribute("redirect", "viewBookDetailController");
                    session.setAttribute("param", "?ISBN=" + isbn + "#user-comment");
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                } else {
                    Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                    CommentDAO dao = new CommentDAO();
                    int id = dao.insertComment(isbn, username, content, "Active", star, currentTime);
                    CommentDTO comment = new CommentDTO(id, isbn, username, user.getFullName(),
                            content, "Active", star, currentTime);
                    String json = new Gson().toJson(comment);
                    out.print(json);
                    out.flush();
                }
            } else {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PostCommentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PostCommentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(PostCommentController.class.getName()).log(Level.SEVERE, null, ex);
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
