package com.swp391.group3.user;

/**
 *
 * @author Dell
 */
public class UpdatePasswordError {

    private String passwordConfirmNotMatch;
    private String passwordLengthError;
    private String oldPasswordDoesNotMatch;

    public String getOldPasswordDoesNotMatch() {
        return oldPasswordDoesNotMatch;
    }

    public void setOldPasswordDoesNotMatch(String oldPasswordDoesNotMatch) {
        this.oldPasswordDoesNotMatch = oldPasswordDoesNotMatch;
    }

    public String getPasswordConfirmNotMatch() {
        return passwordConfirmNotMatch;
    }

    public void setPasswordConfirmNotMatch(String passwordConfirmNotMatch) {
        this.passwordConfirmNotMatch = passwordConfirmNotMatch;
    }

    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    public UpdatePasswordError() {
    }

}
