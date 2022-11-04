/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.author;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class AuthorDTO implements Serializable{
    private String aliasName;
    private String name;
    private int yearOfBirth;

    public AuthorDTO() {
    }

    public AuthorDTO(String aliasName, String name, int yearOfBirth) {
        this.aliasName = aliasName;
        this.name = name;
        this.yearOfBirth = yearOfBirth;
    }

    public String getAliasName() {
        return aliasName;
    }

    public void setAliasName(String aliasName) {
        this.aliasName = aliasName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(int yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }
    
}
