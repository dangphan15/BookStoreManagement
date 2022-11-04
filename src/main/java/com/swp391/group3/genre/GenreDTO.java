/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.genre;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class GenreDTO implements Serializable{
    private String name;
    private String description;

    public GenreDTO() {
    }

    public GenreDTO(String name) {
        this.name = name;
    }
    
    public GenreDTO(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
