package com.swp391.group3.controller;

import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.orderDetail.OrderDetailBook;
import com.swp391.group3.orderDetail.OrderDetailDAO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
 * @author QuanMX
 */
public class ViewDetailOrderHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ViewOrderHistotyDetailFeatures.ERROR_PAGE;
        try {
            String txtId = request.getParameter("orderId");
            int id = Integer.parseInt(txtId);

            OrderDAO orderDao = new OrderDAO();
            OrderDTO orderDto = orderDao.getOrderInforDetailByOrderId(id);

            OrderDetailDAO orderDetailDao = new OrderDetailDAO();
            List<OrderDetailBook> books = orderDetailDao.getOrderDetailBooksByOrderId(id);
            request.setAttribute("ORDER_INFOR", orderDto);
            request.setAttribute("BOOKS", books);
            url = AppConstants.ViewOrderHistotyDetailFeatures.ORDER_DETAIL_PAGE;
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(ViewDetailOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewDetailOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewDetailOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
