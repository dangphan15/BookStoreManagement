package com.swp391.group3.controller;

import com.swp391.group3.bookImport.BookImportDAO;
import com.swp391.group3.bookImport.BookImportDTO;
import com.swp391.group3.publisher.PublisherDAO;
import com.swp391.group3.publisher.PublisherDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
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

@WebServlet(name = "ViewImportStatisticController", urlPatterns = {"/admin/ViewImportStatisticController"})
public class ViewImportStatisticController extends HttpServlet {

    public static Timestamp addDays(Timestamp date, int months) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, months);
        return new Timestamp(cal.getTime().getTime());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = AppConstants.ViewImportStatistcFeature.IMPORT_STATISTIC_PAGE;
        try {
            PublisherDAO dao = new PublisherDAO();
            List<PublisherDTO> publishers = dao.getAllPublishers();
            request.setAttribute("PUBLISHERS", publishers);
            String publisher = request.getParameter("publisher");
            if (publisher == null) {
                publisher = "all";
            }
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            if (startDate != null && endDate != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                if (dateFormat.parse(startDate).compareTo(new Date()) > 0) {
                    request.setAttribute("ERRORS", "Invalid start date!");
                } else if (dateFormat.parse(endDate).compareTo(new Date()) > 0) {
                    request.setAttribute("ERRORS", "Invalid end date!");
                } else if (dateFormat.parse(startDate).compareTo(dateFormat.parse(endDate)) > 0) {
                    request.setAttribute("ERRORS", "Invalid start date and end date!");
                } else {
                    Date parsedDate = dateFormat.parse(startDate.substring(0, 8) + "01");
                    Timestamp start = new java.sql.Timestamp(parsedDate.getTime());
                    parsedDate = dateFormat.parse(endDate.substring(0, 8) + "01");
                    Timestamp end = new java.sql.Timestamp(parsedDate.getTime());
                    List<BookImportDTO> bookImports = new ArrayList<>();
                    BookImportDAO bookImportDAO = new BookImportDAO();
                    int totalQuantity = 0;
                    float totalPrice = 0.0f;
                    for (Timestamp t = start; t.compareTo(end) <= 0; t = addDays(t, 1)) {
                        BookImportDTO dto = bookImportDAO.getBookImportByPublisher(publisher, t);
                        totalQuantity += dto.getQuantity();
                        totalPrice += dto.getOriginalPrice();
                        bookImports.add(dto);
                    }
                    String label = "[";
                    String data = "[";
                    for (BookImportDTO dto : bookImports) {
                        label = label + "'" + dto.getImportMonthYear() + "',";
                        data = data + dto.getQuantity() + ",";
                    }
                    label = label + "]";
                    data = data + "]";
                    request.setAttribute("LABEL", label);
                    request.setAttribute("DATA", data);
                    request.setAttribute("BOOK_IMPORTS", bookImports);
                    request.setAttribute("TOTAL_QUANTITY", totalQuantity);
                    request.setAttribute("TOTAL_PRICE", totalPrice);
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException | ParseException ex) {
            Logger.getLogger(ViewImportStatisticController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ServletContext context = getServletContext();
            Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
            String actualUrl = siteMaps.getProperty(url);
            RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
            rd.forward(request, response);
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
