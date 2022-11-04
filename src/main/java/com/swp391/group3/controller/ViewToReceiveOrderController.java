package com.swp391.group3.controller;

import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="ViewToReceiveOrderController", urlPatterns={"/admin/ViewToReceiveOrderController"})
public class ViewToReceiveOrderController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ToReceiveOrderFeatures.VIEW_ORDERS_PAGE;
        try {
            String status = AppConstants.OrderStatus.TO_RECEIVE;
            OrderDAO orderDao = new OrderDAO();
            List<OrderDTO> orders = orderDao.getAllOrdersByStatus(status);
            request.setAttribute("ORDERS", orders);
        } catch (ClassNotFoundException | SQLException | NamingException ex) {
            ex.printStackTrace();
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
