/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp391.group3.controller;

import com.swp391.group3.price.PriceDAO;
import com.swp391.group3.price.PriceDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "UpdateBookPriceController", urlPatterns = {"/admin/UpdateBookPriceAction"})
public class UpdateBookPriceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String ISBN = request.getParameter("txtISBN").trim();
            String txtNewPrice = request.getParameter("txtNewPrice").trim();
            url = request.getServletContext().getContextPath() + "/" + AppConstants.ViewBookDetailFeature.VIEW_BOOK_DETAIL_CONTROLLER + "?ISBN=" + ISBN;
            if (txtNewPrice == null || txtNewPrice.length() == 0) {
                
            } else {
                PriceDTO price = new PriceDTO();
                float newPrice = 0;
                try {
                    price.setIsbn(ISBN);
                    newPrice = Float.parseFloat(txtNewPrice);
                    if (newPrice > 0) {
                        price.setPrice(newPrice);
                        Timestamp applicableDate = Timestamp.valueOf(LocalDateTime.now());
                        price.setApplicableDate(applicableDate);
                        price.setStatus("Active");
                        PriceDAO priceDao = new PriceDAO();
                        priceDao.changePriceOfBook(price);
                    }
                } catch (NumberFormatException ex) {
                    ex.printStackTrace();
                } catch (SQLException ex) {
                    Logger.getLogger(UpdateBookPriceController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(UpdateBookPriceController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NamingException ex) {
                    Logger.getLogger(UpdateBookPriceController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } finally {
            System.out.println(url);
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
