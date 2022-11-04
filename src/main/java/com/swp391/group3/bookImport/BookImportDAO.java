package com.swp391.group3.bookImport;

import com.swp391.group3.utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;

public class BookImportDAO {

    public BookImportDTO getBookImportByPublisher(String publisher, Timestamp date)
            throws ClassNotFoundException, SQLException, NamingException {
        BookImportDTO result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT ISNULL(SUM([quantity]), 0) AS [total_quantity], "
                        + "ISNULL(SUM([original_price]), 0) AS [total_price] "
                        + "FROM [book_import] "
                        + "WHERE YEAR([import_date]) = YEAR(?) AND MONTH([import_date]) = MONTH(?) ";
                if (!publisher.equals("all")) {
                    sql += "AND [publisher] = ? ";
                }
                stm = con.prepareStatement(sql);
                stm.setTimestamp(1, date);
                stm.setTimestamp(2, date);
                if (!publisher.equals("all")) {
                    stm.setString(3, publisher);
                }
                rs = stm.executeQuery();
                if (rs.next()) {
                    int quantity = rs.getInt("total_quantity");
                    float price = rs.getFloat("total_price");
                    result = new BookImportDTO(publisher, date.toString().split(" ", 2)[0].substring(0, 7), quantity, price);
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

    public void insertBookImport(String ISBN, String publisherName, int quantity, Date importDate, float originalPrice) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert dbo.book_import(ISBN,publisher,import_date,quantity,original_price)\n"
                        + "values(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setString(2, publisherName);
                stm.setDate(3, importDate);
                stm.setInt(4, quantity);
                stm.setFloat(5, originalPrice);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    public void insertBookImport(Connection con, String ISBN, String publisherName, int quantity, Date importDate, float originalPrice) throws SQLException, ClassNotFoundException, NamingException {
        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert dbo.book_import(ISBN,publisher,import_date,quantity,original_price)\n"
                        + "values(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setString(2, publisherName);
                stm.setDate(3, importDate);
                stm.setInt(4, quantity);
                stm.setFloat(5, originalPrice);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

}
