package com.swp391.group3.orderDetail;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class OrderDetailBook implements Serializable {

    private String isbn;
    private String name;
    private int quantity;
    private int availableQuantity;
    private float price;

    public OrderDetailBook(String isbn, String name, int quantity, int availableQuantity, float price) {
        this.isbn = isbn;
        this.name = name;
        this.quantity = quantity;
        this.availableQuantity = availableQuantity;
        this.price = price;
    }

    public OrderDetailBook() {
    }

    public int getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(int availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

}
