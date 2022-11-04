package com.swp391.group3.price;

import java.io.Serializable;
import java.sql.Timestamp;

public class PriceDTO implements Serializable {
    private int id;
    private String isbn;
    private float price;
    private Timestamp applicableDate;
    private String status;

    public PriceDTO() {
    }

    public PriceDTO(int id, String isbn, float price, Timestamp applicableDate, String status) {
        this.id = id;
        this.isbn = isbn;
        this.price = price;
        this.applicableDate = applicableDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Timestamp getApplicableDate() {
        return applicableDate;
    }

    public void setApplicableDate(Timestamp applicableDate) {
        this.applicableDate = applicableDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
