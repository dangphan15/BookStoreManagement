package com.swp391.group3.order;

import com.swp391.group3.orderDetail.OrderDetailBook;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;


/**
 *
 * @author QuanMX
 */
public class OrderHistory implements Serializable{

    private int id;
    private String status;
    private float total;
    private Timestamp orderTime;

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }
    private List<OrderDetailBook> books;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public List<OrderDetailBook> getBooks() {
        return books;
    }

    public void setBooks(List<OrderDetailBook> books) {
        this.books = books;
    }
    
    
}
