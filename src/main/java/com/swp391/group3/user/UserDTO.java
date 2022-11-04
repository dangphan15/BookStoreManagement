package com.swp391.group3.user;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class UserDTO implements Serializable{

    private String username;
    private String fullName;
    private String address;
    private String gender;
    private String email;
    private int roleId;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public UserDTO() {
    }

    public UserDTO(String username, String fullName, String address, String gender, String email, int roleId) {
        this.username = username;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.roleId = roleId;
    }

    public UserDTO(String username, String fullName, String address, String email, int roleId) {
        this.username = username;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.roleId = roleId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    
    
}
