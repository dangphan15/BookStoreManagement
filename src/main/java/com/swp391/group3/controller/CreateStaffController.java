/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.user.RegistrationError;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import com.swp391.group3.utils.PatternChecker;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class CreateStaffController extends HttpServlet {

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
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        ServletContext context = request.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty("manageStaffController");
        boolean isError = false;
        RegistrationError errors = new RegistrationError();
//        System.out.println("cc");
        if (username.length() != 10) {
//            System.out.println("1");
            isError = true;
            errors.setPhoneNumberLengthError("Length of phone number is incorrect");
        } else if (!PatternChecker.isPhoneNumberCorrectPattern(username) || !username.startsWith("0")) {
//            System.out.println("2");
            isError = true;
            errors.setPhoneNumberPatternError("Phone number format is incorrect");
        } else if (password.length() < 5 || password.length() > 30) {
//            System.out.println("3");
            isError = true;
            errors.setPasswordLengthError("Password 6-30 characters only");
        } 
//        System.out.println("ccc");
        try {
            if (!isError) {
                try {
                    
                    UserDTO dto = new UserDTO();
                    dto.setUsername(username);
                    dto.setRoleId(roleId);
                    UserDAO dao = new UserDAO();
                    System.out.println("cccc");
                    dao.insertNewUser(dto, password);
                    System.out.println("cccccc");
                } catch (SQLException | ClassNotFoundException | NamingException ex) {
                    String msg = ex.getMessage();
                    isError = true;
                    if (msg.contains("Violation of PRIMARY KEY constraint")) {
                        errors.setDuplicatedUsername("Phone number has been used, please try a new one!");
                    }
                    if (msg.contains("Violation of UNIQUE KEY constraint")) {
                        errors.setEmailHasbeenUsed("Email has been used!");
                    }
                    Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } finally {
            if (isError) {
//                System.out.println(errors.getDuplicatedUsername());
                request.setAttribute("ERROR", errors);
            }
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
