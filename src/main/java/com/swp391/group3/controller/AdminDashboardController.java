/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class AdminDashboardController extends HttpServlet {

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
        String url = "managerPage";
        try {
            String label = "";
            String data = "";
            OrderDAO dao = new OrderDAO();
            BookDAO bDAO = new BookDAO();
            GenreDAO gDAO = new GenreDAO();
            List<OrderDTO> orders = dao.getAllOrders(6);
            List<BookDTO> books = bDAO.getTrendingBook(5, 7);
            LocalDateTime endDate = LocalDateTime.now();
            LocalDateTime startDate = endDate.minusDays(6);
            label = "[";
            data = "[";
            for (LocalDateTime t = startDate; !t.isAfter(endDate); t = t.plusDays(1)) {//System.out.println(t.toString());
                label = label + "'" + t.format(DateTimeFormatter.ISO_LOCAL_DATE) + "',";
                int cnt = 0;
                for (OrderDTO dto : orders) {
                    //System.out.println(dto.getOrderTime().toLocalDateTime().toString());
                    //dto.getOrderTime().toLocalDateTime().toLocalDate()
                    if (dto.getOrderTime().toLocalDateTime().toLocalDate().compareTo(t.toLocalDate()) == 0) {
                        ++cnt;
                    }
                }
                data = data + cnt + ",";
            }
            label = label + "]";
            data = data + "]";
            request.setAttribute("LABEL1", label);
            request.setAttribute("DATA1", data);
            Map<String, Integer> gb = new HashMap<>();
            int lessThan = 0;
            int from = 0;
            int moreThan = 0;
            for (BookDTO book : books) {
                List<GenreDTO> genres = gDAO.getGenreByBookISBN(book.getISBN());
                for (GenreDTO genre : genres) {
                    if (! gb.containsKey(genre.getName())){
                        gb.put(genre.getName(), 1);
                    }
                    else {
                        gb.put(genre.getName(), gb.get(genre.getName()) + 1);
                    }
                }
                if (book.getPrice() < 200000f) {
                    ++ lessThan;
                }
                else if (book.getPrice() >= 200000f && book.getPrice() <= 5000000f) {
                    ++ from;
                }
                else {
                    ++ moreThan;
                }
            }
            label = "[";
            data = "[";
            for (String k : gb.keySet()) {
                label = label + "'" + k + "',";
                data = data + gb.get(k) + ",";
            }
            label = label + "]";
            data = data + "]";
             request.setAttribute("LABEL2", label);
            request.setAttribute("DATA2", data);
            int totalOrder = 0;
            int totalCompleteOrder = 0;
            int totalCanceledOrder = 0;
            double totalRevenue = 0f;
            for (OrderDTO dto : orders) {
                ++totalOrder;
                if (dto.getStatus().equals("Completed")) {
                    ++totalCompleteOrder;
                    totalRevenue += dto.getTotal();
                } else if (dto.getStatus().equals("Cancelled")) {
                    ++totalCanceledOrder;
                }
            }
            request.setAttribute("BOOKS", books);
            request.setAttribute("COMPLETED_ORDER", totalCompleteOrder);
            request.setAttribute("CANCELLED_ORDER", totalCanceledOrder);
            request.setAttribute("OTHER", totalOrder - totalCompleteOrder - totalCanceledOrder);
            request.setAttribute("REVENUE", totalRevenue);
            request.setAttribute("LESS", lessThan);
            request.setAttribute("EQUAL", from);
            request.setAttribute("MORE", moreThan);

        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ServletContext context = request.getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
            rd.forward(request, response);
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
