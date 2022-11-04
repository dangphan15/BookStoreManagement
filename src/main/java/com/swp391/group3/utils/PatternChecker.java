package com.swp391.group3.utils;

/**
 *
 * @author QuanMX
 */
public class PatternChecker {

    public static boolean isPhoneNumberCorrectPattern(String phone) {
        String phoneRegex = "^\\d{10}$";
        boolean result = false;
        if (phone.matches(phoneRegex)) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public static boolean isEmailCorrectPattern(String email) {
        String emailRegex = "^(.+)@(.+)$";
        boolean result = false;
        result = email.matches(emailRegex);
        return result;
    }
}
