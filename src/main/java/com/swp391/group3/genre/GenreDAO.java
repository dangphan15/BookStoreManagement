
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.genre;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class GenreDAO implements Serializable {

    public List<GenreDTO> getAllGenre() throws SQLException, ClassNotFoundException, NamingException {
        List<GenreDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT name "
                        + "FROM genres ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String name = rs.getString("name");
                    GenreDTO dto = new GenreDTO(name);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
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

    public Map<String, Boolean> getAllGenreToMap() throws SQLException, ClassNotFoundException, NamingException {
        Map<String, Boolean> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT name "
                        + "FROM genres ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String name = rs.getString("name");
                    if (result == null) {
                        result = new HashMap<>();
                    }
                    result.put(name, false);
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

    public List<GenreDTO> getGenreByBookISBN(String ISBN) throws ClassNotFoundException, SQLException, NamingException {
        List<GenreDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select g.name, g.description "
                        + "from book_genres bg inner join genres g on bg.name = g.name "
                        + "where bg.ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    GenreDTO dto = new GenreDTO(name, description);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
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

    //INSERT Genre
    //insert table book_genres
    public void insertBookGenres(Connection con, String bookISBN, String genreName) throws SQLException, ClassNotFoundException, NamingException {

        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert into book_genres(ISBN,[name])\n"
                        + "values(?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookISBN);
                stm.setString(2, genreName);
                int executeUpdate = stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }
}
