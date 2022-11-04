package com.swp391.group3.controller;

import com.swp391.group3.user.RegistrationError;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import com.swp391.group3.utils.PatternChecker;
import java.io.IOException;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author QuanMX
 */
public class UpdateAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("txtFullName").trim();
        String email = request.getParameter("txtEmail").trim();
        String address = request.getParameter("txtAddress").trim();
        String gender = request.getParameter("txtGender");

        boolean isError = false;
        RegistrationError errors = new RegistrationError();

        if (email.length() > 0) {
            if (!PatternChecker.isEmailCorrectPattern(email)) {
                isError = true;
                errors.setEmailPatternError("Email format is incorrect");

            }

        }
        String url = AppConstants.UpdateInforFeatures.UPDATE_INFOR_PAGE;
        UserDTO user = null;
        UserDTO dto = null;
        UserDAO dao = null;
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("USER") != null) {
                user = (UserDTO) session.getAttribute("USER");
                dto = new UserDTO(user.getUsername(), fullName, address, gender, email, user.getRoleId());
            }

            if (!isError) {
                try {
                    dao = new UserDAO();
                    int result = dao.updateUserInfor(dto);
                    if (result > 0) {
                        user = dto;
                        session.setAttribute("USER", user);
                    }

                } catch (SQLException | ClassNotFoundException | NamingException ex) {
                    isError = true;
                    Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
                    if (ex.getMessage().contains("Violation of UNIQUE KEY constraint")) {
                        errors.setEmailHasbeenUsed("Email has been used!");
                    }
                }

            }
        } finally {
            if (!isError) {
                String msg = "Information has been updated successfully";
                url = AppConstants.UpdateInforFeatures.UPDATE_INFOR_PAGE;
                request.setAttribute("MESSAGE", msg);

            } else {
                request.setAttribute("ERROR", errors);

            }
            request.setAttribute("USER", dto);
            ServletContext context = request.getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
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
