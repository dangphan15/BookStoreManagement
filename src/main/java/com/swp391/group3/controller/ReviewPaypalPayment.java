package com.swp391.group3.controller;

import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.services.PaymentServices;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.util.Properties;
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
public class ReviewPaypalPayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
           
            request.setAttribute("PAYER", payerInfo);
            request.setAttribute("TRANSACTION", transaction);
            request.setAttribute("ADDRESS", shippingAddress);

            String url = AppConstants.ReviewPaypalBillFeatures.REVIEW_PAGE;

            ServletContext context = request.getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
            rd.forward(request, response);

        } catch (PayPalRESTException ex) {
            request.setAttribute("ERROR", ex.getMessage());
            ex.printStackTrace();
            String url = AppConstants.ReviewPaypalBillFeatures.ERROR_PAGE;
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
