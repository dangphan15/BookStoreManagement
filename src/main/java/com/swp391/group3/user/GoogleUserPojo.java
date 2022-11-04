/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.user;

/**
 *
 * @author Dell
 */
public class GoogleUserPojo {

    private String id;
    private String email;
    private String picture;
    private String verified_email;
    private String hd;

    public GoogleUserPojo() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getVerified_email() {
        return verified_email;
    }

    public void setVerified_email(String verified_email) {
        this.verified_email = verified_email;
    }

    public String getHd() {
        return hd;
    }

    public void setHd(String hd) {
        this.hd = hd;
    }

    @Override
    public String toString() {
        return "GoogleUserPojo{" + "id=" + id + ", email=" + email + ", picture=" + picture + ", verified_email=" + verified_email + ", hd=" + hd + '}';
    }
    

}
