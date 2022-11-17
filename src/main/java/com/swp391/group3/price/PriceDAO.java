package com.swp391.group3.price;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

public class PriceDAO implements Serializable {

    public void changePriceOfBook(PriceDTO priceDto) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connection = DBHelper.makeConnection();
            connection.setAutoCommit(false);
            //Update status of other prices before insert new one
            String sqlUpdate = "UPDATE prices SET [status] = 'Inactive' WHERE ISBN = ?";
            stm = connection.prepareStatement(sqlUpdate);
            stm.setString(1, priceDto.getIsbn());
            stm.executeUpdate();
            //insert new price
            String sqlInsert = "INSERT INTO prices(ISBN, price, applicable_date, [status]) VALUES(?,?,?,?)";
            stm = connection.prepareStatement(sqlInsert);
            stm.setString(1, priceDto.getIsbn());
            stm.setFloat(2, priceDto.getPrice());
            stm.setTimestamp(3, priceDto.getApplicableDate());
            stm.setString(4, priceDto.getStatus());
            stm.executeUpdate();
            connection.commit();
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
    }

    public float getStartingPriceOfBook(String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        float result = -1;

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [price] "
                        + "FROM [books] "
                        + "WHERE [ISBN] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getFloat("price");
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

    public float getCurrentPriceOfBook(String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        float result = -1;

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [price] "
                        + "FROM [prices] "
                        + "WHERE [ISBN] = ? AND [status] = 'Active'";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getFloat("price");
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

    public int getSaleOffPercentOfBook(String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        int result = -1;
        float startingPrice = getStartingPriceOfBook(isbn);
        float currentPrice = getCurrentPriceOfBook(isbn);
        float saleOffPrice = startingPrice - currentPrice;
        if (saleOffPrice > 0) {
            result = (int) ((saleOffPrice / startingPrice) * 100);
        }
        return result;
    }

    // get All Price Of Book
    public float[] getAllPrice(String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        float[] result = null;
        int index = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [price] "
                        + "FROM [prices] "
                        + "WHERE [ISBN] = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result[index] = rs.getFloat("price");
                    index++;
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

    public void insertPriceBook(String ISBN, int price, String appilcableDate) throws SQLException, ClassNotFoundException, NamingException {
        int res = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into prices(ISBN,price,applicable_date,status) values (?,?,?,'Inactive')";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setInt(2, price);
                stm.setString(3, appilcableDate);
                stm.executeUpdate();
                con.close();
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
    }

    public void insertPriceBook(Connection con, String ISBN, float price, Date appilcableDate) throws SQLException, ClassNotFoundException, NamingException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                String sql = "insert into prices(ISBN,price,applicable_date,status) values (?,?,?,'Active')";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setFloat(2, price);
                stm.setDate(3, appilcableDate);
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }

}
