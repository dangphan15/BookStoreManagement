
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.inventory;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class InventoryDAO implements Serializable {

    public int getQuantityByBookISBN(String ISBN) throws SQLException, ClassNotFoundException, NamingException {
        int res = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT quantity "
                        + "FROM inventory "
                        + "WHERE ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                if (rs.next()) {
                    res = rs.getInt("quantity");

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
        return res;
    }

    public static void insertQuantityBook(String ISBN, int quantity) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert dbo.inventory(ISBN,quantity)\n"
                        + "values(?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setInt(2, quantity);
                stm.executeUpdate();
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

    public void insertQuantityBook(Connection con, String ISBN, int quantity) throws SQLException, ClassNotFoundException, NamingException {
        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert dbo.inventory(ISBN,quantity)\n"
                        + "values(?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, ISBN);
                stm.setInt(2, quantity);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    public void updateQuantityBook(String ISBN, int quantity) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update dbo.inventory set quantity=?\n"
                        + "where ISBN=?";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setInt(1, quantity);
                stm.setString(2, ISBN);
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
}
