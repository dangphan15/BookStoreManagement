package com.swp391.group3.services;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author QuanMX
 */
public class PaymentServices {

    private static final String CLIENT_ID = AppConstants.PaymentService.CLIENT_ID;
    private static final String SECRET_KEY = AppConstants.PaymentService.SECRET_KEY;
    private static final String MODE = AppConstants.PaymentService.MODE;

    public String authorizedPayment(OrderDTO orderDto) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectUrls();
        List<Transaction> listTransaction = getTransactionInformation(orderDto);
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
        APIContext apiContext = new APIContext(CLIENT_ID, SECRET_KEY, MODE);
        Payment approvePayment = requestPayment.create(apiContext);
        return getApprovalLink(approvePayment);
    }

    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);
        Payment payment = new Payment().setId(paymentId);
        APIContext apiContext = new APIContext(CLIENT_ID, SECRET_KEY, MODE);
        return payment.execute(apiContext, paymentExecution);
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, SECRET_KEY, MODE);
        return Payment.get(apiContext, paymentId);
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }
        return approvalLink;
    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("John").setLastName("Doe").setEmail(AppConstants.PaymentService.TEST_EMAIL);
        payer.setPayerInfo(payerInfo);
        return payer;
    }

    private RedirectUrls getRedirectUrls() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8084/BookStoreManagement/viewCartPage");
        redirectUrls.setReturnUrl("http://localhost:8084/BookStoreManagement/reviewPayment");
        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDTO orderDto) {
        Details detail = new Details();
        detail.setSubtotal(orderDto.getPaypalTotal());

        Amount amount = new Amount();
        amount.setCurrency("USD");
        System.out.println("order total: " + orderDto.getTotal());
        System.out.println("order total: " + orderDto.getPaypalTotal());

        amount.setTotal(orderDto.getPaypalTotal());
        amount.setDetails(detail);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Mua sach phai tra tien nhen! <3");
        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);
        return listTransaction;
    }
}
