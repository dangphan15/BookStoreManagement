package com.swp391.group3.controller;

import com.swp391.group3.user.RegistrationError;
import com.swp391.group3.user.UpdatePasswordError;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
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
public class UpdatePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oldPassword = request.getParameter("txtOldPassword");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtPasswordConfirm");
        boolean isError = false;
        UpdatePasswordError errors = new UpdatePasswordError();
        String url = AppConstants.UpdatePasswordFeatures.UPDATE_PASSWORD_PAGE;

        if (password.length() < 5 || password.length() > 30) {
            isError = true;
            errors.setPasswordLengthError("Password 6-30 characters only");
        } else if (!password.equals(confirm)) {
            isError = true;
            errors.setPasswordConfirmNotMatch("Confirm password must match");
        }
        try {
            if (!isError) {
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("USER") != null) {
                    UserDAO dao = new UserDAO();
                    UserDTO user = (UserDTO) session.getAttribute("USER");
                    if (dao.checkLogin(user.getUsername(), oldPassword) == null) {
                        isError = true;
                        errors.setOldPasswordDoesNotMatch("Old password is not correct");
                    } else {
                        int result = dao.updateUserPassword(password, user.getUsername());
                        if (result > 0) {
                            url = AppConstants.UpdatePasswordFeatures.USER_INFOR_PAGE;
                        }
                    }

                }

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdatePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdatePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdatePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (isError) {
                request.setAttribute("ERROR", errors);

            } else {
                String msg = "Password has been updated successfully";
                request.setAttribute("MESSAGE", msg);
            }
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
