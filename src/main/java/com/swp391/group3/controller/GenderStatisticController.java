package com.swp391.group3.controller;

import com.swp391.group3.user.UserDAO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
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
 * @author ACER
 */
public class GenderStatisticController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String url = AppConstants.GenderStatiisticFeatures.GENDER_STATISTIC_PAGE;
            String male = request.getParameter("txtMale");
            String female = request.getParameter("txtFemale");
            String FromDate = request.getParameter("txtFromDate");
            String ToDate = request.getParameter("txtToDate");

            if (FromDate == null || FromDate.length() == 0) {
                FromDate = "2022-01-01";
            }
//            if (ToDate == null || ToDate.length() == 0) {
//                ToDate = "2022-12-31";
//            }
            try {
                UserDAO userDAO = new UserDAO();
                int amountOfMaleUser = 0;
                int amountOfFemaleUser = 0;
                int amountOfOther = 0;
//                amountOfMaleUser = userDAO.getAmountOfGenderByOrderTime("male", FromDate, ToDate);
//                amountOfFemaleUser = userDAO.getAmountOfGenderByOrderTime("female", FromDate, ToDate);               
//                amountOfOther = userDAO.getAmountOfGenderByOrderTime("other", FromDate, ToDate);
//                
//                request.setAttribute("amountOfMaleUser", amountOfMaleUser);
//                request.setAttribute("amountOfFemaleUser", amountOfFemaleUser);
//                request.setAttribute("amountOfOther", amountOfOther);

                Date dateNow=Date.valueOf(FromDate);
                int year=dateNow.toLocalDate().getYear();
                int month=dateNow.toLocalDate().getMonthValue();
                List<String> dateList=new ArrayList<>();
                List<Integer> amountOfMaleList=new ArrayList<>();
                List<Integer> amountOfFemaleList=new ArrayList<>();
                List<Integer> amountOfOtherList=new ArrayList<>();
                for(int i=1;i<=12;i++){
                    String firstDate=year+"-"+month+"-01";
                    String lastDate;
                    if(month==2){
                        lastDate=year+"-"+month+"-28";
                    }else{
                        lastDate=year+"-"+month+"-30";                        
                    }
                    dateList.add(firstDate);
                    amountOfMaleList.add(userDAO.getAmountOfGenderByOrderTime("male", firstDate, lastDate));               
                    amountOfFemaleList.add(userDAO.getAmountOfGenderByOrderTime("female", firstDate, lastDate));
                    amountOfOtherList.add(userDAO.getAmountOfGenderByOrderTime("other", firstDate, lastDate));
                    if(month==1){
                        month=12;
                        year--;
                    }else{
                        month--;
                    }
                }
                request.setAttribute("dateList", dateList);
                request.setAttribute("amountOfMaleList", amountOfMaleList);
                request.setAttribute("amountOfFemaleList", amountOfFemaleList);
                request.setAttribute("amountOfOtherList", amountOfOtherList);
                
            } catch (SQLException ex) {
                Logger.getLogger(GenderStatisticController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(GenderStatisticController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(GenderStatisticController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ServletContext context = request.getServletContext();
                Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
                String actualUrl = siteMaps.getProperty(url);
                RequestDispatcher rd = request.getRequestDispatcher(actualUrl);
                rd.forward(request, response);

            }
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
