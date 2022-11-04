package com.swp391.group3.comment;

import com.swp391.group3.user.UserDAO;
import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class CommentDAO implements Serializable {

    public int insertComment(String isbn, String username, String content, String status, float star, Timestamp postedTime)
            throws ClassNotFoundException, SQLException, NamingException {
        int id = -1;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO [comments] ([ISBN], [username], [content], [status], [star], [posted_time]) "
                        + "OUTPUT INSERTED.[id] "
                        + "VALUES (?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                stm.setString(2, username);
                stm.setString(3, content);
                stm.setString(4, status);
                if (star <= 0) {
                    stm.setNull(5, Types.FLOAT);
                } else {
                    stm.setFloat(5, star);
                }
                stm.setTimestamp(6, postedTime);
                rs = stm.executeQuery();
                if (rs.next()) {
                    id = rs.getInt("id");
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
        return id;
    }

    public boolean editCommentById(int id, String username, String content, Timestamp postedTime)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [comments] "
                        + "SET [content] = ?, [posted_time] = ? "
                        + "WHERE [id] = ? AND [username] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, content);
                stm.setTimestamp(2, postedTime);
                stm.setInt(3, id);
                stm.setString(4, username);
                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
                    result = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean deleteCommentById(int id, String username)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "DELETE FROM [comments] "
                        + "WHERE [id] = ? AND [username] = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, username);
                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
                    result = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public List<CommentDTO> getMoreActiveComments(String isbn, String username, int n, int amount, String filter)
            throws NamingException, SQLException, ClassNotFoundException {
        List<CommentDTO> result = null;

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                switch (filter) {
                    case "newest":
                        sql = "SELECT [id], [username], [content], [status], [star], [posted_time] "
                                + "FROM [comments] "
                                + "WHERE [ISBN] = ? AND [status] = 'Active'"
                                + "ORDER BY [posted_time] DESC "
                                + "OFFSET ? ROWS "
                                + "FETCH NEXT ? ROWS ONLY ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, isbn);
                        stm.setInt(2, amount);
                        stm.setInt(3, n);
                        break;
                    case "oldest":
                        sql = "SELECT [id], [username], [content], [status], [star], [posted_time] "
                                + "FROM [comments] "
                                + "WHERE [ISBN] = ? AND [status] = 'Active'"
                                + "ORDER BY [posted_time] ASC "
                                + "OFFSET ? ROWS "
                                + "FETCH NEXT ? ROWS ONLY ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, isbn);
                        stm.setInt(2, amount);
                        stm.setInt(3, n);
                        break;
                    case "user":
                        sql = "SELECT [id], [username], [content], [status], [star], [posted_time] "
                                + "FROM [comments] "
                                + "WHERE [ISBN] = ? AND [username] = ? AND [status] = 'Active'"
                                + "ORDER BY [posted_time] DESC "
                                + "OFFSET ? ROWS "
                                + "FETCH NEXT ? ROWS ONLY ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, isbn);
                        stm.setString(2, username);
                        stm.setInt(3, amount);
                        stm.setInt(4, n);
                        break;
                }
                rs = stm.executeQuery();
                UserDAO userDAO = new UserDAO();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    username = rs.getString("username");
                    String fullname = userDAO.getUserFullname(username);
                    String status = rs.getString("status");
                    float star = rs.getFloat("star");
                    Timestamp postedTime = rs.getTimestamp("posted_time");
                    String content = rs.getString("content");
                    CommentDTO dto = new CommentDTO(id, isbn, username, fullname, content, status, star, postedTime);
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

    public float getRatingByISBN(String ISBN) throws ClassNotFoundException, SQLException, NamingException {
        float res = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select isnull(avg(star),0) as rating "
                        + "from comments "
                        + "where ISBN = ? and status = \'Active\' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ISBN);
                rs = stm.executeQuery();
                UserDAO userDAO = new UserDAO();
                if (rs.next()) {
                    res = rs.getFloat("rating");
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
}
