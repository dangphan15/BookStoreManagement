package com.swp391.group3.controller;

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
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("txtPhone");
        if (request.getRequestURI().contains("/admin/")) {
            username = request.getParameter("txtUsername");
        }
        String password = request.getParameter("txtPassword");
        String url = AppConstants.LoginFeatures.LOGIN_PAGE;
        UserDTO dto = null;
        UserDAO dao = null;
        String redirect = null;
        String param = null;
        HttpSession session = null;
        try {
            dao = new UserDAO();
            dto = dao.checkLogin(username, password);
            if (dto != null) {
                session = request.getSession(true);
                session.setAttribute("USER", dto);
                int roleId = dto.getRoleId();
                switch (roleId) {
                    case AppConstants.UserRoles.CUSTOMER:
                    case AppConstants.UserRoles.CREATOR:
                        url = AppConstants.LoginFeatures.START_APP_CONTROLLER;
                        break;
                    case AppConstants.UserRoles.ADMIN:
                        url = AppConstants.LoginFeatures.MANAGER_PAGE;
                        break;
                    case AppConstants.UserRoles.INVENTORY_STAFF:
                        url = AppConstants.LoginFeatures.INVENTORY_STAFF_PAGE;
                        break;
                    case AppConstants.UserRoles.SALE_STAFF:
                        url = AppConstants.LoginFeatures.START_SALE_STAFF;
                        break;
                }
                redirect = (String) session.getAttribute("redirect");
                param = (String) session.getAttribute("param");
                if (redirect != null) {
                    url = redirect;
                    session.removeAttribute("redirect");
                    if (param != null) {
                        url += param;
                        session.removeAttribute("param");
                    }
                }
            } else {
                String error = "Phone or password is incorrect";
                if (request.getRequestURI().contains("/admin/")) {
                    error = "Username or password is incorrect";
                }
                request.setAttribute("ERROR", error);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (request.getRequestURI().contains("/admin/") && dto != null && 
                    (dto.getRoleId() == AppConstants.UserRoles.CUSTOMER || dto.getRoleId() == AppConstants.UserRoles.CREATOR)) {
                String error = "Username or password is incorrect";
                request.setAttribute("ERROR", error);
                url = AppConstants.LoginFeatures.LOGIN_PAGE;
                session.invalidate();
                ServletContext context = request.getServletContext();
                Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
                String actualUrl = siteMaps.getProperty(url);
                RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
                rd.forward(request, response);
            } else if (!request.getRequestURI().contains("/admin/") && dto != null &&
                    (dto.getRoleId() != AppConstants.UserRoles.CUSTOMER && dto.getRoleId() != AppConstants.UserRoles.CREATOR)) {
                String error = "Username or password is incorrect";
                request.setAttribute("ERROR", error);
                url = AppConstants.LoginFeatures.LOGIN_PAGE;
                session.invalidate();
                ServletContext context = request.getServletContext();
                Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
                String actualUrl = siteMaps.getProperty(url);
                RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
                rd.forward(request, response);
            } else if (dto != null || redirect != null) {
                response.sendRedirect(url);
            } else {
                ServletContext context = request.getServletContext();
                Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
                String actualUrl = siteMaps.getProperty(url);
                RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
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
