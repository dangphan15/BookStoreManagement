package com.swp391.group3.publisher;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class PublisherDAO implements Serializable {

    public static void insertPublisherBook(String bookPublisher, String publisherAddress)
            throws SQLException, ClassNotFoundException, NamingException {
        int res = 0;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into publishers(name,address) values (?,?)";
                stm = con.prepareStatement(sql);
                // gan input params vao dau ?
                stm.setString(1, bookPublisher);
                stm.setString(2, publisherAddress);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void insertPublisherBook(Connection con, String bookPublisher, String publisherAddress)
            throws SQLException, ClassNotFoundException, NamingException {
        int res = 0;
        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert into publishers(name,address) values (?,?)";
                stm = con.prepareStatement(sql);
                // gan input params vao dau ?
                stm.setString(1, bookPublisher);
                stm.setString(2, publisherAddress);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    public String checkPublisherByName(String publisherName)
            throws SQLException, ClassNotFoundException, NamingException {

        Connection con=null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select p.name\n"
                        + "from dbo.books b full join dbo.publishers p\n"
                        + "on p.name=b.publisher_name\n"
                        + "group by p.name\n"
                        + "having p.name=? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, publisherName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("name");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return result;
    }

    public List<PublisherDTO> getAllPublishers() throws ClassNotFoundException, SQLException, NamingException {
        List<PublisherDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [name], [address] FROM [publishers] ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new PublisherDTO(name, address));
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
}
