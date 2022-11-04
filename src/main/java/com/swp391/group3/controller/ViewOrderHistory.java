package com.swp391.group3.controller;

import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.order.OrderHistory;
import com.swp391.group3.orderDetail.OrderDetailBook;
import com.swp391.group3.orderDetail.OrderDetailDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author QuanMX
 */
public class ViewOrderHistory extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ViewOrderHistotyFeatures.ERROR_PAGE;
        String status = request.getParameter("status");
        //System.out.println(status);
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("USER") != null) {
                url = AppConstants.ViewOrderHistotyFeatures.ORDER_HISTORY_PAGE;
                UserDTO user = (UserDTO) session.getAttribute("USER");
                String username = user.getUsername();
                OrderDAO orderDao = new OrderDAO();
                List<OrderDTO> orderList = orderDao.getOrdersByUsername(username);
                if (status != null) {
                    orderList = orderDao.getOrdersByUsernameAndStatus(username, status);
                }
                List<OrderHistory> orders = null;
                OrderHistory orderHistory = null;
                List<OrderDetailBook> orderDetailBooks = null;
                if (orderList != null) {
                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                    for (OrderDTO dto : orderList) {
                        orderDetailBooks = orderDetailDao.getOrderDetailBooksByOrderId(dto.getOrderId());
                        if (orders == null) {
                            orders = new ArrayList<>();
                        }

                        orderHistory = new OrderHistory();
                        orderHistory.setId(dto.getOrderId());
                        orderHistory.setTotal(dto.getTotal());
                        orderHistory.setBooks(orderDetailBooks);
                        orderHistory.setStatus(dto.getStatus());
                        orderHistory.setOrderTime(dto.getOrderTime());
                        System.out.println(orderHistory.getOrderTime());
                        orders.add(orderHistory);
                    }
                }
                request.setAttribute("ORDER_HISTORY", orders);
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(ViewOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewOrderHistory.class.getName()).log(Level.SEVERE, null, ex);
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
