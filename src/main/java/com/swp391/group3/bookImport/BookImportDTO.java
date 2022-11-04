package com.swp391.group3.bookImport;

public class BookImportDTO {
    private String publisher;
    private String importMonthYear;
    private int quantity;
    private float originalPrice;

    public BookImportDTO() {
    }

    public BookImportDTO(String publisher, String importMonthYear, int quantity, float originalPrice) {
        this.publisher = publisher;
        this.importMonthYear = importMonthYear;
        this.quantity = quantity;
        this.originalPrice = originalPrice;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getImportMonthYear() {
        return importMonthYear;
    }

    public void setImportMonthYear(String importMonthYear) {
        this.importMonthYear = importMonthYear;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(float originalPrice) {
        this.originalPrice = originalPrice;
    }
    
}
