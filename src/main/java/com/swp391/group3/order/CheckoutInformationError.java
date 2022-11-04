package com.swp391.group3.order;

/**
 *
 * @author Dell
 */
public class CheckoutInformationError {
    private String emptyReceiverNameError;
    private String phoneNumberFormatError;
    private String emptyPhoneNumberError;
    private String emptyAddressError;
    private String emptyPaymentMethodError;
    private String emailFormatError;

    public CheckoutInformationError() {
    }

    public String getEmptyReceiverNameError() {
        return emptyReceiverNameError;
    }

    public void setEmptyReceiverNameError(String emptyReceiverNameError) {
        this.emptyReceiverNameError = emptyReceiverNameError;
    }

    public String getPhoneNumberFormatError() {
        return phoneNumberFormatError;
    }

    public void setPhoneNumberFormatError(String phoneNumberFormatError) {
        this.phoneNumberFormatError = phoneNumberFormatError;
    }

    public String getEmptyPhoneNumberError() {
        return emptyPhoneNumberError;
    }

    public void setEmptyPhoneNumberError(String emptyPhoneNumberError) {
        this.emptyPhoneNumberError = emptyPhoneNumberError;
    }

    public String getEmptyAddressError() {
        return emptyAddressError;
    }

    public void setEmptyAddressError(String emptyAddressError) {
        this.emptyAddressError = emptyAddressError;
    }

    public String getEmptyPaymentMethodError() {
        return emptyPaymentMethodError;
    }

    public void setEmptyPaymentMethodError(String emptyPaymentMethodError) {
        this.emptyPaymentMethodError = emptyPaymentMethodError;
    }

    public String getEmailFormatError() {
        return emailFormatError;
    }

    public void setEmailFormatError(String emailFormatError) {
        this.emailFormatError = emailFormatError;
    }
    
}
