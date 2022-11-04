package com.swp391.group3.blog;

import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class BlogDAO implements Serializable {

    public boolean createBlog(String author, String isbn, String title, String content)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO [blogs] ([author], [ISBN], [title], [content], [posted_time], [status]) "
                        + "VALUES (?, ?, ?, ?, ?, ?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, author);
                stm.setString(2, isbn);
                stm.setString(3, title);
                stm.setString(4, content);
                stm.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                stm.setString(6, "pending");
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

    public List<BlogDTO> getApprovedBlogsByISBN(String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        List<BlogDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [id], [author], u.[full_name] AS [author_fullname], \n"
                        + "[title], [content], [posted_time], [staff], [status]\n"
                        + "FROM [blogs] AS b INNER JOIN [users] AS u\n"
                        + "ON b.[author] = u.[username]\n"
                        + "WHERE b.[ISBN] = ? AND b.[status] = 'approved'";
                stm = con.prepareStatement(sql);
                stm.setString(1, isbn);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String author = rs.getString("author");
                    String authorFullname = rs.getString("author_fullname");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp postedTime = rs.getTimestamp("posted_time");
                    String staff = rs.getString("staff");
                    String status = rs.getString("status");
                    BlogDTO blog = new BlogDTO(id, title, content, isbn, author, authorFullname, staff, postedTime, status);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(blog);
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
    
    public List<BlogDTO> getBlogsByStatus(String status)
            throws ClassNotFoundException, SQLException, NamingException {
        List<BlogDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [id], [ISBN], [author], u.[full_name] AS [author_fullname], \n"
                        + "[title], [content], [posted_time], [staff], [status]\n"
                        + "FROM [blogs] AS b INNER JOIN [users] AS u\n"
                        + "ON b.[author] = u.[username]\n"
                        + "WHERE b.[status] = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, status);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String isbn = rs.getString("ISBN");
                    String author = rs.getString("author");
                    String authorFullname = rs.getString("author_fullname");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp postedTime = rs.getTimestamp("posted_time");
                    String staff = rs.getString("staff");
                    BlogDTO blog = new BlogDTO(id, title, content, isbn, author, authorFullname, staff, postedTime, status);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(blog);
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
    
    public boolean deleteBlogById(int id, String staff)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [blogs] SET [status] = 'deleted', [staff] = ? WHERE [id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, staff);
                stm.setInt(2, id);
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
    
    public boolean approveBlogById(int id, String staff)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [blogs] SET [status] = 'approved', [staff] = ? WHERE [id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, staff);
                stm.setInt(2, id);
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
    
    public BlogDTO getBlogById(int id) 
            throws ClassNotFoundException, SQLException, NamingException {
        BlogDTO result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [id], [ISBN], [author], u.[full_name] AS [author_fullname], \n"
                        + "[title], [content], [posted_time], [staff], [status]\n"
                        + "FROM [blogs] AS b INNER JOIN [users] AS u\n"
                        + "ON b.[author] = u.[username]\n"
                        + "WHERE b.[id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String isbn = rs.getString("ISBN");
                    String author = rs.getString("author");
                    String authorFullname = rs.getString("author_fullname");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp postedTime = rs.getTimestamp("posted_time");
                    String staff = rs.getString("staff");
                    String status = rs.getString("status");
                    result = new BlogDTO(id, title, content, isbn, author, authorFullname, staff, postedTime, status);
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
