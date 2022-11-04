package com.swp391.group3.order;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderDTO implements Serializable {

    private int orderId;
    private String receiverName;
    private String address;
    private String phone;
    private Timestamp orderTime;
    private float total;
    private String username;
    private String staffUsername;
    private String status;
    private String statusNote;
    private String payment;
    private Timestamp toConfirmDate;
    private Timestamp toShipDate;
    private Timestamp toReceiveDate;
    private Timestamp expectedDate;
    private String deliveryCompany;
    private Timestamp completedDate;
    private Timestamp cancelledDate;
    private Timestamp returnRefundDate;
    
    public Timestamp getToConfirmDate() {
        return toConfirmDate;
    }

    public void setToConfirmDate(Timestamp toConfirmDate) {
        this.toConfirmDate = toConfirmDate;
    }

    public Timestamp getToShipDate() {
        return toShipDate;
    }

    public void setToShipDate(Timestamp toShipDate) {
        this.toShipDate = toShipDate;
    }

    public Timestamp getToReceiveDate() {
        return toReceiveDate;
    }

    public void setToReceiveDate(Timestamp toReceiveDate) {
        this.toReceiveDate = toReceiveDate;
    }

    public Timestamp getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(Timestamp expectedDate) {
        this.expectedDate = expectedDate;
    }

    public String getDeliveryCompany() {
        return deliveryCompany;
    }

    public void setDeliveryCompany(String deliveryCompany) {
        this.deliveryCompany = deliveryCompany;
    }

    public Timestamp getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(Timestamp completedDate) {
        this.completedDate = completedDate;
    }

    public Timestamp getCancelledDate() {
        return cancelledDate;
    }

    public void setCancelledDate(Timestamp cancelledDate) {
        this.cancelledDate = cancelledDate;
    }

    public Timestamp getReturnRefundDate() {
        return returnRefundDate;
    }

    public void setReturnRefundDate(Timestamp returnRefundDate) {
        this.returnRefundDate = returnRefundDate;
    }

    public OrderDTO(int orderId, String receiverName, String address, String phone, Timestamp orderTime, float total, String username, String staffName, String status, String statusNote, String payment) {
        this.orderId = orderId;
        this.receiverName = receiverName;
        this.address = address;
        this.phone = phone;
        this.orderTime = orderTime;
        this.total = total;
        this.username = username;
        this.staffUsername = staffName;
        this.status = status;
        this.statusNote = statusNote;
        this.payment = payment;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getStatusNote() {
        return statusNote;
    }

    public void setStatusNote(String statusNote) {
        this.statusNote = statusNote;
    }

    public OrderDTO(int orderId, String receiverName, String address, String phone, Timestamp orderTime, float total, String username, String staffName, String status, String statusNote) {
        this.orderId = orderId;
        this.receiverName = receiverName;
        this.address = address;
        this.phone = phone;
        this.orderTime = orderTime;
        this.total = total;
        this.username = username;
        this.staffUsername = staffName;
        this.status = status;
        this.statusNote = statusNote;
    }

    public String getPaypalTotal() {
        return String.format("%.2f", total);
    }

    public OrderDTO(int orderId, String receiverName, String address, String phone, Timestamp orderTime, float total, String username, String staffName, String status) {
        this.orderId = orderId;
        this.receiverName = receiverName;
        this.address = address;
        this.phone = phone;
        this.orderTime = orderTime;
        this.total = total;
        this.username = username;
        this.staffUsername = staffName;
        this.status = status;
    }

    public String getStaffUsername() {
        return staffUsername;
    }

    public void setStaffUsername(String staffName) {
        this.staffUsername = staffName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public OrderDTO() {
    }

    public OrderDTO(int orderId, String receiverName, String address, String phone,
            Timestamp orderTime, float total, String username) {
        this.orderId = orderId;
        this.receiverName = receiverName;
        this.address = address;
        this.phone = phone;
        this.orderTime = orderTime;
        this.total = total;
        this.username = username;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
