package com.swp391.group3.rating;

import java.io.Serializable;

public class RatingDTO implements Serializable {
    private String isbn;
    private int totalReview;
    private float avg;
    private int oneStar;
    private int twoStar;
    private int threeStar;
    private int fourStar;
    private int fiveStar;

    public RatingDTO() {
    }

    public RatingDTO(String isbn, int totalReview, float avg, int oneStar, int twoStar, int threeStar, int fourStar, int fiveStar) {
        this.isbn = isbn;
        this.totalReview = totalReview;
        this.avg = avg;
        this.oneStar = oneStar;
        this.twoStar = twoStar;
        this.threeStar = threeStar;
        this.fourStar = fourStar;
        this.fiveStar = fiveStar;
    }

    public int getTotalReview() {
        return totalReview;
    }

    public void setTotalReview(int totalReview) {
        this.totalReview = totalReview;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public float getAvg() {
        return avg;
    }

    public void setAvg(float avg) {
        this.avg = avg;
    }

    public int getOneStar() {
        return oneStar;
    }

    public void setOneStar(int oneStar) {
        this.oneStar = oneStar;
    }

    public int getTwoStar() {
        return twoStar;
    }

    public void setTwoStar(int twoStar) {
        this.twoStar = twoStar;
    }

    public int getThreeStar() {
        return threeStar;
    }

    public void setThreeStar(int threeStar) {
        this.threeStar = threeStar;
    }

    public int getFourStar() {
        return fourStar;
    }

    public void setFourStar(int fourStar) {
        this.fourStar = fourStar;
    }

    public int getFiveStar() {
        return fiveStar;
    }

    public void setFiveStar(int fiveStar) {
        this.fiveStar = fiveStar;
    }
    
}
