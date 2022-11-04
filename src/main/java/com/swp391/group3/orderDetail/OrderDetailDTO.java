package com.swp391.group3.orderDetail;

import java.io.Serializable;

public class OrderDetailDTO implements Serializable {
    private int id;
    private int orderId;
    private String isbn;
    private int quantity;
    private float price;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int id, int orderId, String isbn, int quantity, float price) {
        this.id = id;
        this.orderId = orderId;
        this.isbn = isbn;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
