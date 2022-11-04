package com.swp391.group3.controller;

import com.swp391.group3.user.RegistrationError;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import com.swp391.group3.utils.PatternChecker;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
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
 * @author Dell
 */
public class RegistrationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        ServletContext context = request.getServletContext();
        request.setCharacterEncoding("UTF-8");
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(AppConstants.RegistrationFeatures.REGISTRATION_PAGE);
//        String username = request.getParameter("txtUsername").trim();
        String fullName = request.getParameter("txtFullname").trim();
        String username = request.getParameter("txtPhone").trim();
        String email = request.getParameter("txtEmail").trim();
        String address = request.getParameter("txtAddress").trim();
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtPasswordConfirm");
        String gender = request.getParameter("txtGender");
        boolean isError = false;
        RegistrationError errors = new RegistrationError();

        if (username.length() != 10) {
            isError = true;
            errors.setPhoneNumberLengthError("Length of phone number is incorrect");
        } else if (!PatternChecker.isPhoneNumberCorrectPattern(username) || !username.startsWith("0")) {
            isError = true;
            errors.setPhoneNumberPatternError("Phone number format is incorrect");
        } else if (password.length() < 5 || password.length() > 30) {
            isError = true;
            errors.setPasswordLengthError("Password 6-30 characters only");
        } else if (!password.equals(confirm)) {
            isError = true;
            errors.setPasswordConfirmNotMatch("Confirm password must match");
        } else if (email.length() > 0) {
            if (!PatternChecker.isEmailCorrectPattern(email)) {
                isError = true;
                errors.setEmailPatternError("Email format is incorrect");
            }
        }

        //error does not occurs
        try {
            if (!isError) {
                try {
                    UserDTO dto = new UserDTO(username, fullName, address, gender, email, AppConstants.UserRoles.CUSTOMER);
                    UserDAO dao = new UserDAO();
                    dao.insertNewUser(dto, password);
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
            if (!isError) {
                url = AppConstants.RegistrationFeatures.LOGIN_PAGE;
                response.sendRedirect(url);
            } else {
                request.setAttribute("ERROR", errors);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific isError occurs
     * @throws IOException if an I/O isError occurs
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
     * @throws ServletException if a servlet-specific isError occurs
     * @throws IOException if an I/O isError occurs
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
