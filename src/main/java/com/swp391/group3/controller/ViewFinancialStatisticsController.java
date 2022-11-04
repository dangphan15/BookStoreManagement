package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.order.OrderDTO;
import com.swp391.group3.publisher.PublisherDAO;
import com.swp391.group3.publisher.PublisherDTO;
import com.swp391.group3.services.FinancialStatisticsService;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Properties;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author QuanMX
 */
@WebServlet(name = "ViewFinancialStatisticsController", urlPatterns = {"/admin/ViewFinancialStatisticsController"})
public class ViewFinancialStatisticsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ManagerFinancialStatisticsFeatures.FINANCIAL_STATISTICS_PAGE;
        String genre = request.getParameter("txtGenre");
        String publisher = request.getParameter("txtPublisher");
        String author = request.getParameter("txtAuthor");
        String txtFromDate = request.getParameter("txtFromDate");
        String txtToDate = request.getParameter("txtToDate");

        if (txtFromDate == null || txtFromDate.length() == 0) {
            txtFromDate = "2022-1-1";
        }
        Date fromDate = Date.valueOf(txtFromDate);
        Date toDate = null;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (txtToDate == null) {
            toDate = Date.valueOf(dtf.format(LocalDateTime.now()));
        } else if (txtToDate != null && txtToDate.length() > 0) {
            toDate = Date.valueOf(txtToDate);
        }
        if (genre == null) {
            genre = "All";
        }
        if (publisher == null) {
            publisher = "All";
        }
        if (author == null) {
            author = "All";
        }
        try {
            List<GenreDTO> genres = null;
            List<PublisherDTO> publishers = null;
            List<AuthorDTO> authors = null;
            GenreDAO genreDao = new GenreDAO();
            genres = genreDao.getAllGenre();
            AuthorDAO authorDao = new AuthorDAO();
            authors = authorDao.getAllAuthor();
            PublisherDAO publisherDao = new PublisherDAO();
            publishers = publisherDao.getAllPublishers();
            request.setAttribute("GENRES", genres);
            request.setAttribute("PUBLISHERS", publishers);
            request.setAttribute("AUTHORS", authors);

            //Get all orders with criteria
            FinancialStatisticsService financialStatisticsService = new FinancialStatisticsService();
            List<OrderDTO> orders = financialStatisticsService.getTurnoverWithCriteria(genre, publisher, author, fromDate, toDate);
            if (orders != null) {
                //number of orders
                int numberOfOrders = orders.size();
                request.setAttribute("NUMBER_OF_ORDERS", numberOfOrders);
                //Get total and data for each day
                TreeMap<String, Float> totalPerDay = new TreeMap<>();
                DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyy-MM");
                Timestamp ss = new Timestamp(0);
                Timestamp ee = new Timestamp(System.currentTimeMillis());
                
                float sumOfTotal = 0;
                for (OrderDTO order : orders) {
//                    System.out.println(order.getOrderId());
                    if (ss.compareTo(order.getCompletedDate()) < 0) {
                        ss = order.getCompletedDate();
                    }
                    if (ee.compareTo(order.getCompletedDate()) > 0) {
                        ee= order.getCompletedDate();
                    }
                    String completedDate = dtf2.format(order.getCompletedDate().toLocalDateTime());
//                    System.out.println(completedDate);
                    if (totalPerDay.containsKey(completedDate)) {
                        Float newTotal = totalPerDay.get(completedDate) + order.getTotal();
                        totalPerDay.put(completedDate, newTotal);
                    } else {
                        totalPerDay.put(completedDate, order.getTotal());
                    }
                    sumOfTotal += order.getTotal();
                }
                
              //  System.out.println(ss.toLocalDateTime());
//                System.out.println(ee.toLocalDateTime());
                for (Timestamp t = ee; t.before(ss);t.setTime(t.getTime() + ((14 * 60) + 59) * 1000 * 30)) {
                    String s = dtf2.format(t.toLocalDateTime());
                    if (! totalPerDay.containsKey(s)) {
                        totalPerDay.put(s, 0f);
                    }
                }
                String label = "[";
                String data = "[";
                for (String s : totalPerDay.keySet()) {
                    label = label + "'" + s + "',";
                    data = data + totalPerDay.get(s) + ",";
                }
                label = label + "]";
                data = data + "]";
                request.setAttribute("LABEL", label);
                request.setAttribute("DATA", data);
                request.setAttribute("TOTAL_PER_DAY", totalPerDay);
                request.setAttribute("SUM_OF_TOTAL", sumOfTotal);
            } else {
                request.setAttribute("NUMBER_OF_ORDERS", 0);
                request.setAttribute("SUM_OF_TOTAL", 0);
            }
            

        } catch (SQLException ex) {
            Logger.getLogger(ViewFinancialStatisticsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewFinancialStatisticsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ViewFinancialStatisticsController.class.getName()).log(Level.SEVERE, null, ex);
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
