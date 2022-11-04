package com.swp391.group3.controller;

import com.swp391.group3.book.BookDTO;
import com.swp391.group3.cart.CartObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="RemoveFromCartController", urlPatterns={"/RemoveFromCartController"})
public class RemoveFromCartController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                CartObject cart = (CartObject)session.getAttribute("CART");
                if (cart != null) {
                    Map<BookDTO, Integer> items = cart.getItems();
                    if (items != null) {
                        String selectedItem = request.getParameter("ISBN");
                        if (selectedItem != null) {
                            cart.removeBookFromCart(selectedItem);
                            session.setAttribute("CART", cart);
                            out.print(cart.getTotalPrice());
                            out.flush();
                        }
                    }
                }
            }
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
