package com.swp391.group3.controller;

import com.swp391.group3.services.GoogleOAuthService;
import com.swp391.group3.user.GoogleUserPojo;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author QuanMX
 */
public class GoogleLoginController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String responsedCode = request.getParameter("code");
        String url = AppConstants.LoginFeatures.LOGIN_PAGE;
        try {
            if (responsedCode == null || responsedCode.isEmpty()) {
                
            } else {
                String accessToken = GoogleOAuthService.getAccessToken(responsedCode);
//                System.out.println(accessToken);
                GoogleUserPojo userPojo = GoogleOAuthService.getUserInformation(accessToken);
                System.out.println(userPojo);
                
                UserDAO dao = new UserDAO();
                
                UserDTO userDto = dao.getUserByEmail(userPojo.getEmail());
                if (userDto != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("USER", userDto);
                    url = AppConstants.LoginFeatures.START_APP_CONTROLLER;
                    // redirect after login if any
                    String redirect = (String)session.getAttribute("redirect");
                    String param = (String)session.getAttribute("param");
                    if (redirect != null) {
                        url = redirect;
                        session.removeAttribute("redirect");
                        if (param != null) {
                            url += param;
                            session.removeAttribute("param");
                        }
                    }
                } else {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("USER_POJO", userPojo);
                    url = AppConstants.SignInWithGoogleFeatures.VERIFY_PHONE_NUMBER_PAGE;
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(GoogleLoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GoogleLoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(GoogleLoginController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect(url);
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
