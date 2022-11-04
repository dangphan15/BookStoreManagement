package com.swp391.group3.services;

import com.swp391.group3.cart.CartObject;
import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.orderDetail.OrderDetailDAO;
import com.swp391.group3.utils.DBHelper;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author QuanMX
 */
public class CheckoutService {

    public boolean insertOrderInformation(CartObject cart, OrderDTO orderDto) {
        boolean result = false;
        Connection connection = null;

        try {
            connection = DBHelper.makeConnection();
            connection.setAutoCommit(false);
            OrderDAO orderDao = new OrderDAO();
            int lastOrderId = orderDao.insertNewOrder(connection, orderDto);
            int rowInserted = 0;
            if (lastOrderId > 0) {
                OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                rowInserted = orderDetailDao.insertOrderDetail(connection, cart, lastOrderId);
                if (rowInserted != cart.getItems().size()) {
                    result = false;
                } else {
                    result = true;
                }

            } else {
                result = false;
            }
        } catch (SQLException | ClassNotFoundException | NamingException ex) {
            Logger.getLogger(CheckoutService.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null && !result) {
                try {
                    connection.rollback();
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CheckoutService.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (connection != null && result) {
                try {
                    connection.commit();
                } catch (SQLException ex) {
                    Logger.getLogger(CheckoutService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
        return result;
    }
}
