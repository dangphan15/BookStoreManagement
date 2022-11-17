package com.swp391.group3.author;

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
public class AuthorDAO implements Serializable {

    public List<AuthorDTO> getAllAuthor() throws SQLException, ClassNotFoundException, NamingException {
        List<AuthorDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT * "
                        + "FROM authors ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String aliasName = rs.getString("alias_name");
                    String name = rs.getString("name");
                    int yearOfBirth = rs.getInt("year_of_birth");
                    AuthorDTO dto = new AuthorDTO(aliasName, name, yearOfBirth);
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

    public Map<String, Boolean> getAllAuthorToMap() throws SQLException, ClassNotFoundException, NamingException {
        Map<String, Boolean> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT alias_name "
                        + "FROM authors ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String aliasName = rs.getString("alias_name");
                    if (result == null) {
                        result = new HashMap<>();
                    }
                    result.put(aliasName, false);
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

    public List<AuthorDTO> getAuthorByBookISBN(String ISBN) throws ClassNotFoundException, SQLException, NamingException {
        List<AuthorDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select a.alias_name, a.name, a.year_of_birth "
                        + "from book_authors ba inner join authors a on ba.author_alias = a.alias_name "
                        + "where ba.ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String aliasName = rs.getString("alias_name");
                    String name = rs.getString("name");
                    int yearOfBirth = rs.getInt("year_of_birth");
                    AuthorDTO dto = new AuthorDTO(aliasName, name, yearOfBirth);
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

    public AuthorDTO getAuthorByISBN(String ISBN) throws ClassNotFoundException, SQLException, NamingException {
        AuthorDTO result = null;
        PreparedStatement stm = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select a.alias_name, a.name, a.year_of_birth "
                        + "from book_authors ba inner join authors a on ba.author_alias = a.alias_name "
                        + "where ba.ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String aliasName = rs.getString("alias_name");
                    String name = rs.getString("name");
                    int yearOfBirth = rs.getInt("year_of_birth");
                    result = new AuthorDTO(aliasName, name, yearOfBirth);
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

    public AuthorDTO getAuthorByISBN(Connection con, String ISBN) throws ClassNotFoundException, SQLException, NamingException {
        AuthorDTO result = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                // query string
                String sql = "select a.alias_name, a.name, a.year_of_birth "
                        + "from book_authors ba inner join authors a on ba.author_alias = a.alias_name "
                        + "where ba.ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                while (rs.next()) {
                    String aliasName = rs.getString("alias_name");
                    String name = rs.getString("name");
                    int yearOfBirth = rs.getInt("year_of_birth");
                    result = new AuthorDTO(aliasName, name, yearOfBirth);
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

    // INSERT AuthorAlias
    // Insert table authors
    public boolean checkAuthorByAlias(String bookAuthorAlias) throws SQLException, ClassNotFoundException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result=false;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select alias_name \n"
                        + "from authors "
                        + "where alias_name=?";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookAuthorAlias);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return result;
    }
    
    public void insertAuthor(String bookAuthorAlias, String bookAuthorName, int yearOfBirth, String web, String biography) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into authors(alias_name,name,year_of_birth,website,biography)\n"
                        + "values (?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookAuthorAlias);
                stm.setString(2, bookAuthorName);
                stm.setInt(3, yearOfBirth);
                stm.setString(4, web);
                stm.setString(5, biography);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    public void insertAuthor(Connection con, String bookAuthorAlias, String bookAuthorName, int yearOfBirth) throws SQLException, ClassNotFoundException, NamingException {

        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert into authors(alias_name,name,year_of_birth)\n"
                        + "values (?,?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookAuthorAlias);
                stm.setString(2, bookAuthorName);
                stm.setInt(3, yearOfBirth);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    //insert table book_authors
    public void insertBookAuthor(Connection con, String bookISBN, String bookAuthorAlias) throws SQLException, ClassNotFoundException, NamingException {
        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "insert into book_authors(ISBN,author_alias)\n"
                        + "values(?,?)";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookISBN);
                stm.setString(2, bookAuthorAlias);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    public void updateBookAuthor(Connection con, String bookISBN, String bookAuthorAlias) throws SQLException, ClassNotFoundException, NamingException {
        PreparedStatement stm = null;
        try {
            if (con != null) {
                String sql = "update book_authors\n"
                        + " set "
                        + "author_alias=?\n"
                        + "where ISBN=?";
                stm = con.prepareStatement(sql);
                //gan input params vao dau ?
                stm.setString(1, bookAuthorAlias);
                stm.setString(2, bookISBN);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }
}
