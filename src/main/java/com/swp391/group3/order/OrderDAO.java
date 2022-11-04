package com.swp391.group3.order;

import com.swp391.group3.inventory.InventoryDAO;
import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Dell
 */
public class OrderDAO implements Serializable {

    public List<OrderDTO> getAllOrders() throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> orders = null;

        try {
            //make connection
            connection = DBHelper.makeConnection();
            //sql query string
            String sql = "SELECT order_id, receiver_name, [address], phone, order_time, total, username, staff_username, [status], status_note, payment, "
                    + "to_confirm_date, to_ship_date, to_receive_date, expected_date, delivery_company, completed_date, cancelled_date, return_refund_date "
                    + "FROM orders "
                    + "ORDER BY order_time DESC";
            //prepare statement
            stm = connection.prepareStatement(sql);
            //execute
            rs = stm.executeQuery();
            //process result
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String receiverName = rs.getString("receiver_name");
                String addresss = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderTime = rs.getTimestamp("order_time");
                float total = rs.getFloat("total");
                String username = rs.getString("username");
                String staffUsername = rs.getString("staff_username");
                String statusNote = rs.getString("status_note");
                String payment = rs.getString("payment");
                Timestamp toConfirmDate = rs.getTimestamp("to_confirm_date");
                Timestamp toShipDate = rs.getTimestamp("to_ship_date");
                Timestamp toReceiveDate = rs.getTimestamp("to_receive_date");
                Timestamp expectedDate = rs.getTimestamp("expected_date");
                String deliveryCompany = rs.getString("delivery_company");
                Timestamp completedDate = rs.getTimestamp("completed_date");
                Timestamp cancelledDate = rs.getTimestamp("cancelled_date");
                Timestamp returnRefundDate = rs.getTimestamp("return_refund_date");
                String status = rs.getString("status");
                OrderDTO order = new OrderDTO(orderId, receiverName, addresss, phone, orderTime, total, username, staffUsername, status, statusNote, payment);
                order.setToConfirmDate(toConfirmDate);
                order.setToShipDate(toShipDate);
                order.setToReceiveDate(toReceiveDate);
                order.setDeliveryCompany(deliveryCompany);
                order.setExpectedDate(expectedDate);
                order.setCompletedDate(completedDate);
                order.setCancelledDate(cancelledDate);
                order.setReturnRefundDate(returnRefundDate);
                if (orders
                        == null) {
                    orders = new ArrayList<>();
                }

                orders.add(order);
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
        return orders;
    }

    public List<OrderDTO> getAllOrdersByStatus(String status) throws ClassNotFoundException, SQLException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> orders = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. query string
            String sql = "SELECT order_id, receiver_name, [address], phone, order_time, total, username, staff_username, [status], status_note, payment, "
                    + "to_confirm_date, to_ship_date, to_receive_date, expected_date, delivery_company, completed_date, cancelled_date, return_refund_date "
                    + "FROM orders "
                    + "WHERE [status] = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String receiverName = rs.getString("receiver_name");
                String addresss = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderTime = rs.getTimestamp("order_time");
                float total = rs.getFloat("total");
                String username = rs.getString("username");
                String staffUsername = rs.getString("staff_username");
                String statusNote = rs.getString("status_note");
                String payment = rs.getString("payment");
                Timestamp toConfirmDate = rs.getTimestamp("to_confirm_date");
                Timestamp toShipDate = rs.getTimestamp("to_ship_date");
                Timestamp toReceiveDate = rs.getTimestamp("to_receive_date");
                Timestamp expectedDate = rs.getTimestamp("expected_date");
                String deliveryCompany = rs.getString("delivery_company");
                Timestamp completedDate = rs.getTimestamp("completed_date");
                Timestamp cancelledDate = rs.getTimestamp("cancelled_date");
                Timestamp returnRefundDate = rs.getTimestamp("return_refund_date");
                OrderDTO order = new OrderDTO(orderId, receiverName, addresss, phone, orderTime, total, username, staffUsername, status, statusNote, payment);
                order.setToConfirmDate(toConfirmDate);
                order.setToShipDate(toShipDate);
                order.setToReceiveDate(toReceiveDate);
                order.setDeliveryCompany(deliveryCompany);
                order.setExpectedDate(expectedDate);
                order.setCompletedDate(completedDate);
                order.setCancelledDate(cancelledDate);
                order.setReturnRefundDate(returnRefundDate);
                if (orders
                        == null) {
                    orders = new ArrayList<>();
                }

                orders.add(order);
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
        return orders;
    }

    public int insertNewOrder(Connection connection, OrderDTO dto) throws SQLException {
        PreparedStatement stm = null;
        PreparedStatement cStm = null;
        ResultSet rs = null;
        int orderId = 0;
        try {
            String sql = "INSERT INTO orders(receiver_name, [address], phone, order_time, total, username, [status], payment) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, dto.getReceiverName());
            stm.setString(2, dto.getAddress());
            stm.setString(3, dto.getPhone());
            stm.setTimestamp(4, dto.getOrderTime());
            stm.setFloat(5, dto.getTotal());
            stm.setString(6, dto.getUsername());
            stm.setString(7, dto.getStatus());
            stm.setString(8, dto.getPayment());
            int rowAffected = stm.executeUpdate();
            // process result
            if (rowAffected > 0) {
                sql = "SELECT IDENT_CURRENT(?)";
                cStm = connection.prepareCall(sql);
                cStm.setString(1, "orders");
                rs = cStm.executeQuery();
                if (rs.next()) {
                    orderId = rs.getInt(1);
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
        return orderId;
    }

    public OrderDTO getOrderInforDetailByOrderId(int id)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO order = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT order_id, receiver_name, [address], phone, order_time, total, username, staff_username, [status], status_note, payment, "
                    + "to_confirm_date, to_ship_date, to_receive_date, expected_date, delivery_company, completed_date, cancelled_date, return_refund_date "
                    + "FROM orders "
                    + "WHERE order_id = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String receiverName = rs.getString("receiver_name");
                String addresss = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderTime = rs.getTimestamp("order_time");
                float total = rs.getFloat("total");
                String username = rs.getString("username");
                String staffUsername = rs.getString("staff_username");
                String status = rs.getString("status");
                String statusNote = rs.getString("status_note");
                String payment = rs.getString("payment");
                Timestamp toConfirmDate = rs.getTimestamp("to_confirm_date");
                Timestamp toShipDate = rs.getTimestamp("to_ship_date");
                Timestamp toReceiveDate = rs.getTimestamp("to_receive_date");
                Timestamp expectedDate = rs.getTimestamp("expected_date");
                String deliveryCompany = rs.getString("delivery_company");
                Timestamp completedDate = rs.getTimestamp("completed_date");
                Timestamp cancelledDate = rs.getTimestamp("cancelled_date");
                Timestamp returnRefundDate = rs.getTimestamp("return_refund_date");
                order = new OrderDTO(orderId, receiverName, addresss, phone, orderTime, total, username, staffUsername, status, statusNote, payment);
                order.setToConfirmDate(toConfirmDate);
                order.setToShipDate(toShipDate);
                order.setToReceiveDate(toReceiveDate);
                order.setDeliveryCompany(deliveryCompany);
                order.setExpectedDate(expectedDate);
                order.setCompletedDate(completedDate);
                order.setCancelledDate(cancelledDate);
                order.setReturnRefundDate(returnRefundDate);
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
        return order;
    }

    public List<OrderDTO> getOrdersByUsername(String username)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> orderList = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT order_id, total,order_time, [status] FROM orders WHERE username = ?";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            OrderDTO order = null;
            while (rs.next()) {
                int id = rs.getInt("order_id");
                float total = rs.getFloat("total");
                String status = rs.getString("status");
                Timestamp orderTime = rs.getTimestamp("order_time");
                order = new OrderDTO();
                order.setOrderId(id);
                order.setTotal(total);
                order.setStatus(status);
                order.setOrderTime(orderTime);
                if (orderList == null) {
                    orderList = new ArrayList<>();
                }

                orderList.add(order);
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
        return orderList;
    }

    public List<OrderDTO> getOrdersByUsernameAndStatus(String username, String p_status) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> orderList = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT order_id, total, order_time, [status] FROM orders WHERE username = ? and [status] = ? ";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, p_status);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            OrderDTO order = null;
            while (rs.next()) {
                int id = rs.getInt("order_id");
                float total = rs.getFloat("total");
                String status = rs.getString("status");
                Timestamp orderTime = rs.getTimestamp("order_time");
                order = new OrderDTO();
                order.setOrderId(id);
                order.setTotal(total);
                order.setStatus(status);
                order.setOrderTime(orderTime);
                if (orderList == null) {
                    orderList = new ArrayList<>();
                }

                orderList.add(order);
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
        return orderList;
    }

    public boolean approvalToConfirmOrderById(String username, int id)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        if (!isAvailable(id)) {
            return result;
        }
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [status] = 'To Ship', [staff_username] = ?, [to_confirm_date] = GETDATE() "
                        + "WHERE [order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
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

    public boolean isAvailable(int id)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = true;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT od.[ISBN], od.[quantity] "
                        + "FROM [orders] AS o "
                        + "INNER JOIN [order_details] AS od "
                        + "ON o.[order_id] = od.[order_id] "
                        + "WHERE o.[order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                InventoryDAO inventoryDAO = new InventoryDAO();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN");
                    int orderQuantity = rs.getInt("quantity");
                    int availableQuantity = inventoryDAO.getQuantityByBookISBN(isbn);
                    if (orderQuantity > availableQuantity) {
                        result = false;
                        break;
                    }
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

    public boolean cancelOrderById(String username, int id, String note)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [status] = 'Cancelled', [staff_username] = ?, [status_note] = ?, [cancelled_date] = GETDATE() "
                        + "WHERE [order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, note);
                stm.setInt(3, id);
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

    public boolean approvalToShipOrderById(String username, int id, String deliveryCompany)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        if (!isAvailable(id)) {
            return result;
        }
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [status] = 'To Receive', [staff_username] = ?, "
                        + "[delivery_company] = ?, [to_ship_date] = GETDATE() "
                        + "WHERE [order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, deliveryCompany);
                stm.setInt(3, id);
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

    public boolean setExpectedReceiveDate(String username, int id, String expectedDate)
            throws ClassNotFoundException, SQLException, NamingException, ParseException {
        boolean result = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(new Date());
        Connection con = null;
        PreparedStatement stm = null;

        try {
            System.out.println(sdf.parse(today).compareTo(sdf.parse(expectedDate)));
            if (sdf.parse(today).compareTo(sdf.parse(expectedDate)) > 0) {
                return result;
            }
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [expected_date] = ?, [staff_username] = ? "
                        + "WHERE [order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setTimestamp(1, (new Timestamp(sdf.parse(expectedDate).getTime())));
                stm.setString(2, username);
                stm.setInt(3, id);
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

    public boolean approvalToReceiveOrderById(String username, int id)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [status] = 'Completed', [staff_username] = ?, [to_receive_date] = GETDATE(), [completed_date] = GETDATE() "
                        + "WHERE [order_id] = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
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

    public boolean cancelOrderByUserWithOrderId(int id, String note)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean result = false;
        if (!isAvailable(id)) {
            return result;
        }
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [orders] "
                        + "SET [status] = 'Cancelled', [status_note] = ? "
                        + "WHERE [order_id] = ? and [status] = 'To Confirm' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, note);
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
    public List<OrderDTO> getAllOrderByStaffISBN(String sUsername) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> orders = null;

        try {
            //make connection
            connection = DBHelper.makeConnection();
            //sql query string
            String sql = "SELECT order_id, receiver_name, [address], phone, order_time, total, username, staff_username, [status], status_note, payment, "
                    + "to_confirm_date, to_ship_date, to_receive_date, expected_date, delivery_company, completed_date, cancelled_date, return_refund_date "
                    + "FROM orders "
                    + "WHERE staff_username = ? "
                    + "ORDER BY order_time DESC";
            //prepare statement
            
            stm = connection.prepareStatement(sql);
            stm.setString(1, sUsername);
            //execute
            rs = stm.executeQuery();
            
            //process result
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String receiverName = rs.getString("receiver_name");
                String addresss = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderTime = rs.getTimestamp("order_time");
                float total = rs.getFloat("total");
                String username = rs.getString("username");
                String staffUsername = rs.getString("staff_username");
                String statusNote = rs.getString("status_note");
                String payment = rs.getString("payment");
                Timestamp toConfirmDate = rs.getTimestamp("to_confirm_date");
                Timestamp toShipDate = rs.getTimestamp("to_ship_date");
                Timestamp toReceiveDate = rs.getTimestamp("to_receive_date");
                Timestamp expectedDate = rs.getTimestamp("expected_date");
                String deliveryCompany = rs.getString("delivery_company");
                Timestamp completedDate = rs.getTimestamp("completed_date");
                Timestamp cancelledDate = rs.getTimestamp("cancelled_date");
                Timestamp returnRefundDate = rs.getTimestamp("return_refund_date");
                String status = rs.getString("status");
                OrderDTO order = new OrderDTO(orderId, receiverName, addresss, phone, orderTime, total, username, staffUsername, status, statusNote, payment);
                order.setToConfirmDate(toConfirmDate);
                order.setToShipDate(toShipDate);
                order.setToReceiveDate(toReceiveDate);
                order.setDeliveryCompany(deliveryCompany);
                order.setExpectedDate(expectedDate);
                order.setCompletedDate(completedDate);
                order.setCancelledDate(cancelledDate);
                order.setReturnRefundDate(returnRefundDate);
                if (orders == null) {
                    orders = new ArrayList<>();
                }

                orders.add(order);
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
        //System.out.println("querycc");
        return orders;
    }
}
