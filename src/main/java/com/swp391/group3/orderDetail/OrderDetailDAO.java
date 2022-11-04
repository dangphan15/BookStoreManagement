/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.orderDetail;

import com.swp391.group3.book.BookDTO;
import com.swp391.group3.cart.CartObject;
import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author QuanMX
 */
public class OrderDetailDAO implements Serializable {

    public int insertOrderDetail(Connection connection, CartObject cart, int orderId) throws SQLException {
        PreparedStatement stm = null;
        int insertedRow = 0;
        try {
            String sql = "INSERT INTO order_details(order_id, ISBN, quantity, price) VALUES(?, ?, ?, ?)";
            //prepare statment
            stm = connection.prepareStatement(sql);
            int result;
            Map<BookDTO, Integer> items = cart.getItems();
            for (BookDTO dto : items.keySet()) {
                stm.setInt(1, orderId);
                stm.setString(2, dto.getISBN());
                stm.setInt(3, items.get(dto));
                stm.setFloat(4, dto.getCurrentPrice() * items.get(dto));
                //execute
                result = stm.executeUpdate();
                //process result
                insertedRow += result;
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
        }
        return insertedRow;
    }

    public List<OrderDetailBook> getOrderDetailBooksByOrderId(int orderId) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDetailBook> orderDetailBooks = null;
        try {
            //1. make connection
            connection = DBHelper.makeConnection();
            //2. sql string
            String sql = "SELECT books.ISBN,books.[name], detail.quantity, inventory.quantity AS available, detail.price FROM books "
                    + "INNER JOIN (SELECT ISBN, quantity, price FROM order_details WHERE order_id = ?) detail "
                    + "ON(detail.ISBN = books.ISBN) "
                    + "INNER JOIN [inventory] "
                    + "ON [inventory].ISBN = [books].ISBN";
            //3. prepare statement
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            //4. execute
            rs = stm.executeQuery();
            //5. process result
            String isbn = null;
            String bookName = null;
            int quantity = 0;
            int availableQuantity = 0;
            float price = 0;
            OrderDetailBook orderDetailBook = null;
            while (rs.next()) {
                isbn = rs.getString("ISBN");
                bookName = rs.getString("name");
                quantity = rs.getInt("quantity");
                availableQuantity = rs.getInt("available");
                price = rs.getFloat("price");
                orderDetailBook = new OrderDetailBook(isbn, bookName, quantity, availableQuantity, price);
                if (orderDetailBooks == null) {
                    orderDetailBooks = new ArrayList<>();
                }
                orderDetailBooks.add(orderDetailBook);

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
        return orderDetailBooks;
    }
}
