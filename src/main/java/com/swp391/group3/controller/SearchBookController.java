/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.swp391.group3.controller;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.book.BookDAO;
import com.swp391.group3.book.BookDTO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
 * @author PC
 */
public class SearchBookController extends HttpServlet {

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
        Properties siteMap = (Properties) context.getAttribute("SITEMAPS");
        BookDAO bookDAO = new BookDAO();
        GenreDAO genreDAO = new GenreDAO();
        AuthorDAO authorDAO = new AuthorDAO();
        String url = siteMap.getProperty(AppConstants.SearchBookFeatures.SEARCH_PAGE);

        float minPrice = 0;
        if (request.getParameter("minPrice") != null) {
            minPrice = Float.parseFloat(request.getParameter("minPrice"));
        }
        float maxPrice = 10000000;
        if (request.getParameter("maxPrice") != null) {
            maxPrice = Float.parseFloat(request.getParameter("maxPrice"));
        }
        String searchValue = request.getParameter("searchValue");
        String[] genres = request.getParameterValues("genres");
        String[] publishers = request.getParameterValues("publishers");
        String[] authors = request.getParameterValues("authors");
        String[] languages = request.getParameterValues("languages");
        String[] layouts = request.getParameterValues("layouts");
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        String orderBy = request.getParameter("orderBy");
        if (orderBy == null) {
            orderBy = "none";
        }
        List<BookDTO> filteredList = new ArrayList<>();

        try {
            List<BookDTO> bookList = bookDAO.getAllBook();
            List<GenreDTO> genreList2 = genreDAO.getAllGenre();
            Map<String, Boolean> genreList = genreDAO.getAllGenreToMap();
            Map<String, Boolean> authorList = authorDAO.getAllAuthorToMap();
            Map<String, Boolean> publisherList = new HashMap<>();
            Map<String, Boolean> layoutList = new HashMap<>();
            Map<String, Boolean> languageList = new HashMap<>();
            for (int i = 0; i < bookList.size(); ++i) {
                BookDTO dto = bookList.get(i);//System.out.println(dto.getRating());
                List<AuthorDTO> authorsOfBook = authorDAO.getAuthorByBookISBN(dto.getISBN());
                List<GenreDTO> genreOfBook = genreDAO.getGenreByBookISBN(dto.getISBN());
                dto.setAuthors(authorsOfBook);
                dto.setGenres(genreOfBook);
                publisherList.put(dto.getPublisherName(), false);
                layoutList.put(dto.getBookLayout(), false);
                languageList.put(dto.getLanguage(), false);

                boolean passSearchCondition = true;
                if (checkBookWithCondition(minPrice, maxPrice, dto.getPrice()) == false) {
                    passSearchCondition = false;
                }
                if (searchValue != null) {
                    searchValue = searchValue.trim();
                    searchValue = searchValue.replace("<", "&lt;");
                    searchValue = searchValue.replace(">", "&gt;");
                    System.out.println(searchValue);
                    if (!dto.getName().toLowerCase().contains(searchValue.toLowerCase())) {
                        passSearchCondition = false;
                    }
                }

                if (genres != null) {
                    for (String s : genres) {
                        genreList.put(s, true);
                    }
                    boolean check = false;
                    for (int j = 0; j < genres.length; ++j) {
                        for (int k = 0; k < dto.getGenres().size(); ++k) {
                            if (genres[j].equals(dto.getGenres().get(k).getName())) {
                                check = true;
                            }
                        }
                    }
                    if (check == false) {
                        passSearchCondition = false;
                    }
                }
                if (authors != null) {
                    for (String s : authors) {
                        authorList.put(s, true);

                    }
                    boolean check = false;
                    for (int j = 0; j < authors.length; ++j) {
                        for (int k = 0; k < dto.getAuthors().size(); ++k) {
                            if (authors[j].equals(dto.getAuthors().get(k).getAliasName())) {
                                check = true;
                            }
                        }
                    }
                    if (check == false) {
                        passSearchCondition = false;
                    }
                }
                if (publishers != null) {
                    for (String s : publishers) {
                        publisherList.put(s, true);
                    }
                    if (checkBookWithCondition(dto.getPublisherName(), publishers) == false) {
                        passSearchCondition = false;
                    }
                }
                if (languages != null) {
                    for (String s : languages) {
                        languageList.put(s, true);
                    }
                    if (checkBookWithCondition(dto.getLanguage(), languages) == false) {
                        passSearchCondition = false;
                    }
                }
                if (layouts != null) {
                    for (String s : layouts) {
                        layoutList.put(s, true);
                    }
                    if (checkBookWithCondition(dto.getBookLayout(), layouts) == false) {
                        passSearchCondition = false;
                    }
                }
                if (passSearchCondition == true) {
                    filteredList.add(dto);
                }
            }

            if (orderBy.equalsIgnoreCase("price descending")) {
                Collections.sort(filteredList, new PriceDesc());
            }
            if (orderBy.equalsIgnoreCase("price ascending")) {
                Collections.sort(filteredList, new PriceAsc());
            }
            if (orderBy.equalsIgnoreCase("rating")) {
                Collections.sort(filteredList, new RatingDesc());
            }
            if (searchValue != null && !searchValue.isEmpty()) {
                request.setAttribute("SEARCH_VALUE", searchValue);
            }
            int len = filteredList.size();
            int itemPerPage = 24;
            int numPage = len / itemPerPage;
            if (len % itemPerPage != 0) {
                ++numPage;
            }
            if (page > numPage) {
                page = 1;
            }
            if (page < 1) {
                page = numPage;
            }
            filteredList = filteredList.subList(itemPerPage * (page - 1), Math.min(itemPerPage * (page - 1) + itemPerPage, len));

            request.setAttribute("BOOK_LIST", filteredList);
            request.setAttribute("PAGE", page);
            request.setAttribute("NUM_OF_PAGE", numPage);
            request.setAttribute("GENRE_LIST", genreList);
            request.setAttribute("GENRE_LIST2", genreList2);
            //for(String s : publisherList.keySet()) System.out.print(s);
            request.setAttribute("AUTHOR_LIST", authorList);
            request.setAttribute("PUBLISHER_LIST", publisherList);
            request.setAttribute("LAYOUT_LIST", layoutList);
            request.setAttribute("LANGUAGE_LIST", languageList);//System.out.println("good");
            request.setAttribute("MIN_PRICE", (int) (minPrice));
            request.setAttribute("MAX_PRICE", (int) (maxPrice));
            request.setAttribute("ORDER_BY", orderBy);
        } catch (SQLException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(StartAppController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    class PriceDesc implements Comparator<BookDTO> {

        @Override
        public int compare(BookDTO o1, BookDTO o2) {
            return (int) (o2.getCurrentPrice() - o1.getCurrentPrice());
        }

    }

    class RatingDesc implements Comparator<BookDTO> {

        @Override
        public int compare(BookDTO o1, BookDTO o2) {
            float r1 = o1.getRating().getAvg();
            float r2 = o2.getRating().getAvg();
            if (r1 < r2) {
                return 1;
            } else if (r1 > r2) {
                return -1;
            } else {
                return 0;
            }
        }

    }

    class PriceAsc implements Comparator<BookDTO> {

        @Override
        public int compare(BookDTO o1, BookDTO o2) {
            return (int) (o1.getCurrentPrice() - o2.getCurrentPrice());
        }

    }

    private boolean checkBookWithCondition(String bookProperties, String[] checkList) {
        for (int j = 0; j < checkList.length; ++j) {
            if (checkList[j].equals(bookProperties)) {
                return true;
            }
        }
        return false;
    }

    private boolean checkBookWithCondition(float min, float max, float checkVal) {
        if (checkVal > max || checkVal < min) {
            return false;
        }
        return true;
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
