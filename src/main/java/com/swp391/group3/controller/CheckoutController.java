package com.swp391.group3.controller;

import com.swp391.group3.book.BookDTO;
import com.swp391.group3.cart.CartObject;
import com.swp391.group3.order.CheckoutInformationError;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.services.CheckoutService;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import com.swp391.group3.utils.PatternChecker;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;
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
public class CheckoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String receiverName = request.getParameter("txtReceiverName").trim();
        String phone = request.getParameter("txtPhone").trim();
        String address = request.getParameter("txtAddress").trim();
        String email = request.getParameter("txtEmail").trim();
        String payment = request.getParameter("txtPayment").trim();
        boolean isError = false;
        String url = AppConstants.CheckoutFeatures.ERROR_PAGE;
        CheckoutInformationError errors = new CheckoutInformationError();
        if (receiverName.isEmpty()) {
            isError = true;
            errors.setEmptyReceiverNameError("Receiver name is required");
        } else if (phone.isEmpty()) {
            isError = true;
            errors.setEmptyPhoneNumberError("Phone number is required");
        } else if (!PatternChecker.isPhoneNumberCorrectPattern(phone)) {
            isError = true;
            errors.setPhoneNumberFormatError("Phone number format is incorrect");
        } else if (address.isEmpty()) {
            isError = true;
            errors.setEmptyAddressError("Address is required");
        } else if (!email.isEmpty() && !PatternChecker.isEmailCorrectPattern(email)) {
            isError = true;
            errors.setEmailFormatError("Email format is incorrect");
        } else if (payment.isEmpty()) {
            isError = true;
            errors.setEmptyPaymentMethodError("Payment method is required");
        }
        try {

            //1. if it does not have any error
            if (!isError) {

                HttpSession session = request.getSession(false);
                // user has loggin 
                if (session != null && session.getAttribute("USER") != null) {
                    CartObject cart = (CartObject) session.getAttribute("CART");
                    float total = 0;
                    if (cart != null) {
                        Map<BookDTO, Integer> items = cart.getItems();
                        for (BookDTO dto : items.keySet()) {
                            total += dto.getCurrentPrice() * items.get(dto);
                        }
                        // check out with paypal
                        if (payment.equals(AppConstants.PaymentMethod.PAYPAL)) {

                            OrderDTO orderDto = new OrderDTO();
                            orderDto.setReceiverName(receiverName);
                            orderDto.setAddress(address);
                            orderDto.setPhone(phone);
                            Timestamp orderTime = new Timestamp(System.currentTimeMillis());
                            orderDto.setOrderTime(orderTime);
                            orderDto.setTotal(total);
                            UserDTO user = (UserDTO) session.getAttribute("USER");
                            orderDto.setUsername(user.getUsername());
                            orderDto.setStatus(AppConstants.OrderStatus.TO_CONFIRM);
                            session.setAttribute("PAYPAL_ORDER", orderDto);
                            url = AppConstants.CheckoutFeatures.PAYPAL_CHECKOUT;

                        } else if (payment.equals(AppConstants.PaymentMethod.COD)) //check out with cod
                        {
                            OrderDTO orderDto = new OrderDTO();
                            orderDto.setReceiverName(receiverName);
                            orderDto.setAddress(address);
                            orderDto.setPhone(phone);
                            Timestamp orderTime = new Timestamp(System.currentTimeMillis());
                            orderDto.setOrderTime(orderTime);
                            orderDto.setTotal(total);
                            UserDTO user = (UserDTO) session.getAttribute("USER");
                            orderDto.setUsername(user.getUsername());
                            orderDto.setStatus(AppConstants.OrderStatus.TO_CONFIRM);
                            orderDto.setPayment(payment);
                            CheckoutService checkoutService = new CheckoutService();
                            boolean isCheckout = checkoutService.insertOrderInformation(cart, orderDto);
                            if (isCheckout) {
                                session.removeAttribute("CART");
                                url = AppConstants.CheckoutFeatures.VIEW_CART_PAGE;
                            }
                        }

                    }

                } else // user does not loggin
                {
                    //verify phone number
                    // check out with paypal
                    //check out with cod

                }

            } else { //2. if it has error

                request.setAttribute("ERROR", errors);

                url = AppConstants.CheckoutFeatures.VIEW_CART_PAGE;
            }

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
