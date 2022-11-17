package com.swp391.group3.user;

import com.swp391.group3.utils.AppConstants;
import com.swp391.group3.utils.DBHelper;
import com.swp391.group3.utils.PasswordEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Dell
 */
public class UserDAO {

    public UserDTO getUserByEmail(String email) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql query
            String sql = "SELECT username, full_name, email, gender, [address], role_id FROM users "
                    + "WHERE email = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            //4. execute
            rs = stm.executeQuery();
            //5. process result set
            if (rs.next()) {
                String phone = rs.getString("username");
                String fullName = rs.getString("full_name");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                int role = rs.getInt("role_id");
                user = new UserDTO(phone, fullName, address, gender, email, role);

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
        return user;
    }

    public int updateUserPassword(String password, String username) throws ClassNotFoundException, SQLException, NamingException {

        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            password = PasswordEncoder.hashPassword(password);
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "UPDATE users SET [password] = ? WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, username);
            //4. execute
            result = stm.executeUpdate();
            //5. process result

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
     public int updateUserRole(int role, String username) throws ClassNotFoundException, SQLException, NamingException {

        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "UPDATE users SET [role_id] = ? WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setInt(1, role);
            stm.setString(2, username);
            //4. execute
            result = stm.executeUpdate();
            //5. process result

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
    public List<UserDTO> getUsersByRole (int roleId) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<UserDTO> users = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql query
            String sql = "Select * from " +
                         "users where role_id = ? ";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setInt(1, roleId);
            //4. execute
            rs = stm.executeQuery();
            //5. process result set
            while (rs.next()) {
                String phone = rs.getString("username");
                String fullName = rs.getString("full_name");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                int role = rs.getInt("role_id");
                UserDTO user = new UserDTO(phone, fullName, address, gender, email, role);
                if (users == null) {
                    users = new ArrayList<UserDTO>();
                }
                users.add(user);
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
        return users;
    }
    public int updateUserInfor(UserDTO dto) throws ClassNotFoundException, SQLException, NamingException {

        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "UPDATE users SET full_name = ?, email = ?, [address] = ?, [gender] = ? WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, dto.getFullName());
            stm.setString(2, dto.getEmail());
            stm.setString(3, dto.getAddress());
            stm.setString(4, dto.getGender());
            stm.setString(5, dto.getUsername());
            //4. execute
            result = stm.executeUpdate();
            //5. process result

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

    public UserDTO getUserInforByUsername(String username) throws ClassNotFoundException, SQLException, NamingException {
        UserDTO dto = null;
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT full_name, email, [address], [gender], role_id FROM users "
                    + "WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            if (rs.next()) {
                String fullName = rs.getString("full_name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int role = rs.getInt("role_id");
                String gender = rs.getString("gender");
                dto = new UserDTO(username, fullName, address, gender, email, role);
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
        return dto;
    }

    public String getUserFullname(String username)
            throws NamingException, SQLException, ClassNotFoundException {
        String result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT [full_name] "
                        + "FROM [users] "
                        + "WHERE [username] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("full_name");
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

    public UserDTO checkLogin(String username, String password) throws SQLException, ClassNotFoundException, NamingException {
        UserDTO dto = null;
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT full_name, role_id, email, [address], [gender], [password] FROM users "
                    + "WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (PasswordEncoder.checkPassword(password, hashedPassword)) {
                    int role = rs.getInt("role_id");
                    String fullName = rs.getString("full_name");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    dto = new UserDTO(username, fullName, address, gender, email, role);
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
        return dto;

    }

    public boolean isAllowedToRateBook(String username, String isbn)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT od.[id] "
                        + "FROM [orders] AS o "
                        + "RIGHT JOIN [order_details] AS od "
                        + "ON o.[order_id] = od.[order_id] "
                        + "WHERE o.[username] = ? AND od.[ISBN] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, isbn);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
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

    public void insertNewUser(UserDTO dto, String password) throws SQLException, ClassNotFoundException, NamingException {
        int DEFAULT_ROLE = dto.getRoleId();
        Connection connection = null;
        PreparedStatement stm = null;
        int result;
        try {
            password = PasswordEncoder.hashPassword(password);
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "INSERT INTO users(username, full_name, email, [address], [password], role_id, [gender]) VALUES(?, ?, ?, ?, ?, ?, ?)";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, dto.getUsername());
            stm.setString(2, dto.getFullName());
            stm.setString(3, dto.getEmail());
            stm.setString(4, dto.getAddress());
            stm.setString(5, password);
            stm.setInt(6, DEFAULT_ROLE);
            stm.setString(7, dto.getGender());
            //4. execute
            result = stm.executeUpdate();
            //5 process result
            if (result > 0) {

            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    // getAmountOfGenderByOrderTime
    public int getAmountOfGenderByOrderTime(String gender, String fromDate, String toDate)
            throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(us.gender) as amount\n"
                        + "from orders ord join users us\n"
                        + "on ord.username = us.username\n"
                        + "where us.gender=? and ord.order_time >= ? and ord.order_time <= ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, gender);
                stm.setString(2, fromDate);
                stm.setString(3, toDate);
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
}
