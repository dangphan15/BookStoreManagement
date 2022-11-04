package com.swp391.group3.controller;

import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SetExpectedReceiveDateController", urlPatterns = {"/admin/SetExpectedReceiveDateController"})
public class SetExpectedReceiveDateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ToReceiveOrderFeatures.VIEW_ORDER_DETAIL_CONTROLLER;
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            String expectedDate = request.getParameter("expectedDate");
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("USER");
                if (user != null) {
                    OrderDAO dao = new OrderDAO();
                    if (!dao.setExpectedReceiveDate(user.getUsername(), orderId, expectedDate)) {
                        request.setAttribute("ERRORS", "Can not set expected date!");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException | ParseException | NumberFormatException ex) {
            Logger.getLogger(SetExpectedReceiveDateController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ServletContext context = getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
            rd.forward(request, response);
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
