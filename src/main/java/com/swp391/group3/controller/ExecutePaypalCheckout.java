/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.swp391.group3.cart.CartObject;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.services.CheckoutService;
import com.swp391.group3.services.PaymentServices;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ExecutePaypalCheckout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        String url = AppConstants.ExecutePaypalCheckoutFeatures.ERROR_PAGE;
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("PAYPAL_ORDER") != null) {
                PaymentServices paymentServices = new PaymentServices();
                Payment payment = paymentServices.executePayment(paymentId, payerId);
                OrderDTO orderDto = (OrderDTO) session.getAttribute("PAYPAL_ORDER");
                CheckoutService checkoutService = new CheckoutService();
                if (checkoutService.insertOrderInformation((CartObject) session.getAttribute("CART"), orderDto)) {
                    url = AppConstants.ExecutePaypalCheckoutFeatures.VIEW_CART_PAGE;
                    session.removeAttribute("CART");

                }
            }
        } catch (PayPalRESTException ex) {
            Logger.getLogger(ExecutePaypalCheckout.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
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
