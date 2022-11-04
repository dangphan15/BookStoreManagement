/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.order.OrderDAO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.user.UserDAO;
import com.swp391.group3.user.UserDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
public class ViewOrdersOfStaffController extends HttpServlet {

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
        ServletContext context = request.getServletContext();
        Properties sitemap = (Properties) context.getAttribute("SITEMAPS");
        String username = request.getParameter("id").trim();
        //System.out.println(username);
        OrderDAO dao = new OrderDAO();
        UserDAO uDao = new UserDAO();
        String url = sitemap.getProperty(AppConstants.ManageStaffFeatures.STAFF_ORDER_PAGE);
        try {
            List<OrderDTO> orders = dao.getAllOrderByStaffISBN(username);

//            System.out.println(orders);
            int total = 0;
//            System.out.println(total);
            Timestamp ss = new Timestamp(0);
            Timestamp ee = new Timestamp(System.currentTimeMillis());
            Map<String, Integer> map = new TreeMap<>();
            if (orders != null) {
                for (OrderDTO dto : orders) {
                    if (ss.compareTo(dto.getToConfirmDate()) < 0) {
                        ss = dto.getToConfirmDate();
                    }
                    if (ee.compareTo(dto.getToConfirmDate()) > 0) {
                        ee= dto.getToConfirmDate();
                    }
                    String time = new SimpleDateFormat("yyyy-MM").format(dto.getToConfirmDate());
                    //System.out.println(time);
                    ++total;
                    if (map.get(time) == null) {
                        map.put(time, 1);
                    } else {
                        map.put(time, map.get(time) + 1);
                    }
                }
            }
            UserDTO user = uDao.getUserInforByUsername(username);
              System.out.println(ss.toLocalDateTime());
               System.out.println(ee.toLocalDateTime());
             for (Timestamp t = ee; t.before(ss);t.setTime(t.getTime() + ((14 * 60) + 59) * 1000 * 30)) {
                    String s = new SimpleDateFormat("yyyy-MM").format(t);
                    System.out.println(s);
                    if (! map.containsKey(s)) {
                        map.put(s, 0);
                    }
                }
            String label = "[";
            String data = "[";
            for (String s : map.keySet()) {
                label = label + "'" + s + "',";
                data = data + map.get(s) + ",";
            }
            label = label + "]";
            data = data + "]";
            request.setAttribute("LABEL", label);
            request.setAttribute("DATA", data);
            request.setAttribute("TOTAL", total);
            request.setAttribute("USER", user);

        } catch (SQLException ex) {
            Logger.getLogger(ViewOrdersOfStaffController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewOrdersOfStaffController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewOrdersOfStaffController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
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
