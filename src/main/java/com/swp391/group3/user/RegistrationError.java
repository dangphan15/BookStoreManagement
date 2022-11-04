package com.swp391.group3.user;

/**
 *
 * @author Dell
 */
public class RegistrationError {

    private String passwordConfirmNotMatch;
    private String duplicatedUsername;
    private String phoneNumberPatternError;
    private String phoneNumberLengthError;
    private String emailPatternError;
    private String passwordLengthError;
    private String fullNameLengthError;
    private String emailHasbeenUsed;

    public String getEmailHasbeenUsed() {
        return emailHasbeenUsed;
    }

    public void setEmailHasbeenUsed(String emailHasbeenUsed) {
        this.emailHasbeenUsed = emailHasbeenUsed;
    }

    public void setFullNameLengthError(String fullNameLengthError) {
        this.fullNameLengthError = fullNameLengthError;
    }

    public String getPasswordConfirmNotMatch() {
        return passwordConfirmNotMatch;
    }

    public void setPasswordConfirmNotMatch(String passwordConfirmNotMatch) {
        this.passwordConfirmNotMatch = passwordConfirmNotMatch;
    }

    public String getDuplicatedUsername() {
        return duplicatedUsername;
    }

    public void setDuplicatedUsername(String duplicatedUsername) {
        this.duplicatedUsername = duplicatedUsername;
    }

    public String getPhoneNumberPatternError() {
        return phoneNumberPatternError;
    }

    public void setPhoneNumberPatternError(String phoneNumberPatternError) {
        this.phoneNumberPatternError = phoneNumberPatternError;
    }

    public String getPhoneNumberLengthError() {
        return phoneNumberLengthError;
    }

    public void setPhoneNumberLengthError(String phoneNumberLengthError) {
        this.phoneNumberLengthError = phoneNumberLengthError;
    }

    public String getEmailPatternError() {
        return emailPatternError;
    }

    public void setEmailPatternError(String emailPatternError) {
        this.emailPatternError = emailPatternError;
    }

    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    public RegistrationError() {
    }

}
