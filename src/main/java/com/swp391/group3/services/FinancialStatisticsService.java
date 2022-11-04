/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.services;

import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Dell
 */
public class FinancialStatisticsService {
//    String genre = request.getParameter("txtGenre");
//        String publisher = request.getParameter("txtPublisher");
//        String author = request.getParameter("txtAuthor");
//        String txtFromDate = request.getParameter("txtFromDate");
//        String txtToDate = request.getParameter("txtToDate");

    public List<OrderDTO> getTurnoverWithCriteria(String genre, String publisher, String author, Date fromDate, Date toDate) throws ClassNotFoundException, SQLException, NamingException {

        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> result = null;
        try {
            Set<String> isbns = getBookISBN_ByPublisherAndAuthorAndGenre(publisher, author, genre);
            String isbnString = "";
            if (isbns != null) {
                for (String isbn : isbns) {
                    if (isbnString.length() == 0) {
                        isbnString += '\'' + isbn + '\'';
                    } else {
                        isbnString += "," + '\'' + isbn + '\'';
                    }
                }

//                System.out.println("isbnString: " + isbnString);
                connection = DBHelper.makeConnection();
                String sql = "SELECT DISTINCT ord.order_id, ord.total, ord.completed_date "
                        + "FROM "
                        + "(SELECT orders.order_id, orders.total, orders.completed_date "
                        + "FROM orders WHERE orders.completed_date BETWEEN ? AND ?) ord "
                        + "INNER JOIN "
                        + "(SELECT order_id FROM order_details WHERE ISBN IN (" + isbnString + ")) det ON ord.order_id = det.order_id "
                        + "ORDER BY ord.completed_date ASC";
                stm = connection.prepareStatement(sql);
                stm.setDate(1, fromDate);
                stm.setDate(2, toDate);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt("order_id");
                    float total = rs.getFloat("total");
                    Timestamp completed_date = rs.getTimestamp("completed_date");
                    OrderDTO orderDto = new OrderDTO();
                    orderDto.setOrderId(orderId);
                    orderDto.setTotal(total);
                    orderDto.setCompletedDate(completed_date);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(orderDto);
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;

    }

    public Set<String> getBookISBN_ByGenre(String genre) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Set<String> result = null;
        try {
            connection = DBHelper.makeConnection();
            if (genre.equals("All")) {
                String sql = "SELECT DISTINCT ISBN FROM book_genres";
                stm = connection.prepareStatement(sql);
            } else {
                String sql = "SELECT DISTINCT ISBN FROM book_genres WHERE [name] = ?";
                stm = connection.prepareStatement(sql);
                stm.setString(1, genre);
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                if (result == null) {
                    result = new HashSet<String>();
                }
                result.add(rs.getString("ISBN"));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }

    public Set<String> getBookISBN_ByAuthor(String author) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Set<String> result = null;
        try {
            connection = DBHelper.makeConnection();
            if (author.equals("All")) {
                String sql = "SELECT DISTINCT ISBN FROM book_authors";
                stm = connection.prepareStatement(sql);
            } else {
                String sql = "SELECT DISTINCT ISBN FROM book_authors WHERE author_alias = ?";
                stm = connection.prepareStatement(sql);
                stm.setString(1, author);
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                if (result == null) {
                    result = new HashSet<String>();
                }
                result.add(rs.getString("ISBN"));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }

    public Set<String> getBookISBN_ByPublisherAndAuthorAndGenre(String publisher, String author, String genre) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Set<String> result = null;
        try {

            Set<String> isbnsByGenre = getBookISBN_ByGenre(genre);
            Set<String> isbnsByAuthor = getBookISBN_ByAuthor(author);
            String isbnsByGenreAndAuthor = "";
            for (String isbn : isbnsByAuthor) {
                if (isbnsByGenre.contains(isbn)) {
                    if (isbnsByGenreAndAuthor.length() > 0) {
                        isbnsByGenreAndAuthor += "," + '\'' + isbn + '\'';
                    } else {
                        isbnsByGenreAndAuthor += '\'' + isbn + '\'';
                    }
                }
            }
            if (isbnsByGenreAndAuthor.length() > 0) {

                connection = DBHelper.makeConnection();
                String sql;
                if (publisher.equals("All")) {
                    sql = "SELECT ISBN FROM books WHERE ISBN IN (" + isbnsByGenreAndAuthor
                            + " )";
                    stm = connection.prepareStatement(sql);
                } else {
                    sql = "SELECT ISBN FROM books WHERE ISBN IN (" + isbnsByGenreAndAuthor
                            + " ) AND publisher_name = ?";
                    stm = connection.prepareStatement(sql);
                    stm.setString(1, publisher);
                }
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new HashSet<String>();
                    }
                    result.add(rs.getString("ISBN"));
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }
}
