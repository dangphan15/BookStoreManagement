package com.swp391.group3.rating;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

public class RatingDAO implements Serializable {

    public int getTotalReviewByISBN(String isbn) 
            throws ClassNotFoundException, SQLException, NamingException {
        int result = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(id) AS [total] "
                        + "FROM [comments] "
                        + "WHERE [ISBN] = ? AND [status] = 'Active' AND [star] IS NOT NULL ";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("total");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public float getAvgRatingByISBN(String isbn) 
            throws ClassNotFoundException, NamingException, SQLException {
        if (isbn == null) {
            return -1;
        }
        float result = -1;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT AVG(star) AS [avg_rating] "
                        + "FROM [comments] "
                        + "WHERE [ISBN] = ? AND [status] = 'Active' AND [star] IS NOT NULL ";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = Math.round(rs.getFloat("avg_rating") * 100) / 100.00f; // round to 2 decimal
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public int getReviewAmountByISBN(String isbn, float star) 
            throws ClassNotFoundException, SQLException, NamingException {
        int result = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT([star]) AS [amount] "
                        + "FROM [comments] "
                        + "WHERE [ISBN] = ? AND [status] = 'Active' AND [star] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                stm.setFloat(2, star);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("amount");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }
    
    public RatingDTO getRatingByISBN(String isbn) 
            throws ClassNotFoundException, SQLException, NamingException {
        RatingDTO result = null;
        
        int totalReview = getTotalReviewByISBN(isbn);
        float avgRating = getAvgRatingByISBN(isbn);
        int oneStar = getReviewAmountByISBN(isbn, 1);
        int twoStar = getReviewAmountByISBN(isbn, 2);
        int threeStar = getReviewAmountByISBN(isbn, 3);
        int fourStar = getReviewAmountByISBN(isbn, 4);
        int fiveStar = getReviewAmountByISBN(isbn, 5);
        result = new RatingDTO(isbn, totalReview, avgRating, oneStar, twoStar, threeStar, fourStar, fiveStar);
        
        return result;
    }
}
