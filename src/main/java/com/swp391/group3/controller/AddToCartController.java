package com.swp391.group3.controller;

import com.google.gson.Gson;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.cart.CartError;
import com.swp391.group3.cart.CartObject;
import com.swp391.group3.inventory.InventoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        String isbn = request.getParameter("ISBN");
        boolean isError = false;
        CartError errors = new CartError();
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession(true);
            CartObject cart = (CartObject) session.getAttribute("CART");
            if (cart == null) {
                cart = new CartObject();
            }
            BookDAO bookDAO = new BookDAO();
            BookDTO book = bookDAO.getBookByISBN(isbn);
            if (book != null) {
                String name = book.getName();
                float currentPrice = book.getCurrentPrice();
                String imageAddress = book.getImageAddress();
                InventoryDAO inventoryDAO = new InventoryDAO();
                int holdingQuantity = inventoryDAO.getQuantityByBookISBN(isbn);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity <= 0) {
                    isError = true;
                    errors.setInvalidQuantityErr("Quantity must be greater than 0!");
                } else if (quantity > holdingQuantity) {
                    isError = true;
                    errors.setExceedHoldingQuantityErr("Requested quantity exceeds holding quantity!");
                } else {
                    cart.addBookToCart(isbn, name, currentPrice, imageAddress, quantity);
                    session.setAttribute("CART", cart);
                }
                if (isError) {
                    String json = new Gson().toJson(errors);
                    out.print(json);
                } else {
                    out.print(cart.getItems().size());
                }
                out.flush();
            }
        } catch (NumberFormatException ex) {
            log("AddToCartController _ NumberFormat _ " + ex.getMessage());
        } catch (SQLException ex) {
            log("AddToCartController _ SQLException _ " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("AddToCartController _ ClassNotFoundException _ " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddToCartController _ NamingException _ " + ex.getMessage());
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
