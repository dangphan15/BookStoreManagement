
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.book;

import com.swp391.group3.author.AuthorDAO;
import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.bookImport.BookImportDAO;
import com.swp391.group3.genre.GenreDAO;
import com.swp391.group3.inventory.InventoryDAO;
import com.swp391.group3.price.PriceDAO;
import com.swp391.group3.publisher.PublisherDAO;
import com.swp391.group3.rating.RatingDAO;
import com.swp391.group3.rating.RatingDTO;
import com.swp391.group3.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class BookDAO implements Serializable {
    // get all book from database
    public List<BookDTO> getAllBook() throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT * "
                        + "FROM books ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getRecommendedBook(int top) throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT TOP(?) * "
                        + "FROM books ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getHighRatingBook(int top) throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select top(?) b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "from books b left join "
                        + "(select ISBN, star "
                        + "from comments "
                        + "where status = \'Active\') c on b.ISBN = c.ISBN "
                        + "group by b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "order by avg(c.star) desc ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getSaleOffBook(int top) throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select top(?) b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "from books b inner join "
                        + "prices p "
                        + "on b.ISBN = p.ISBN "
                        + "where p.status = ? and p.price < b.price ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                stm.setString(2, "Active");
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getBestSellingBook(int top) throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select top(?) b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "from books b left join order_details od "
                        + "on b.ISBN = od.ISBN "
                        + "group by b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "order by sum(od.quantity) desc ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getTrendingBook(int top, int numberOfDay)
            throws SQLException, ClassNotFoundException, NamingException {
        // list for storing book
        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "select top(?) b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "from books b inner join order_details od "
                        + "on b.ISBN = od.ISBN inner join orders o "
                        + "on od.order_id = o.order_id "
                        + "where DATEDIFF(DAY, o.order_time, GETDATE()) < ? "
                        + "group by b.ISBN, b.name, b.language, b.description, b.translator, b.price, b.weight, b.size, b.year_of_publish, b.number_of_page, b.book_layout, b.publisher_name, b.image_url "
                        + "order by sum(od.quantity) desc ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                stm.setInt(2, numberOfDay);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                            saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public BookDTO getBookByISBN(String bookISBN) throws SQLException, ClassNotFoundException, NamingException {
        if (bookISBN == null) {
            return null;
        }
        // list for storing book
        BookDTO result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT * "
                        + "FROM books "
                        + "WHERE ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, bookISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                if (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    if (result == null) {
                        result = new BookDTO(ISBN, name, language, description, translator, price, currentPrice,
                                saleOffPercent,
                                weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress,
                                rating);
                    }
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getBookByCategory(String category, int top) throws SQLException, ClassNotFoundException, NamingException {

        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT top(?) * "
                        + "FROM books b inner join book_genres bg on b.ISBN = bg.ISBN "
                        + "inner join genres g on bg.name = g.name "
                        + "where g.name = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, top);
                stm.setString(2, category);

                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice, saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public List<BookDTO> getBookByName(String bookName) throws SQLException, ClassNotFoundException, NamingException {

        List<BookDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // query string
                String sql = "SELECT * "
                        + "FROM books "
                        + "where name like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%"+ bookName +"%");

                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                while (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    BookDTO dto = new BookDTO(ISBN, name, language, description, translator, price, currentPrice, saleOffPercent,
                            weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }
    
    public BookDTO getBookByISBN(Connection con, String bookISBN) throws SQLException, ClassNotFoundException, NamingException {
        if (bookISBN == null) {
            return null;
        }
        // list for storing book 
        BookDTO result = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                // query string
                String sql = "SELECT * "
                        + "FROM books "
                        + "WHERE ISBN = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, bookISBN);
                rs = stm.executeQuery();
                // get data from result set end add to list
                PriceDAO priceDAO = new PriceDAO();
                RatingDAO ratingDAO = new RatingDAO();
                if (rs.next()) {
                    String ISBN = rs.getString("ISBN");
                    String name = rs.getString("name");
                    String language = rs.getString("language");
                    String description = rs.getString("description");
                    String translator = rs.getString("translator");
                    float price = rs.getFloat("price");
                    float currentPrice = priceDAO.getCurrentPriceOfBook(ISBN);
                    int saleOffPercent = priceDAO.getSaleOffPercentOfBook(ISBN);
                    float weight = rs.getFloat("weight");
                    String size = rs.getString("size");
                    int yearOfPublish = rs.getInt("year_of_publish");
                    int numberOfPage = rs.getInt("number_of_page");
                    String bookLayout = rs.getString("book_layout");
                    String publisherName = rs.getString("publisher_name");
                    String imageAddress = rs.getString("image_url");
                    RatingDTO rating = ratingDAO.getRatingByISBN(ISBN);
                    if (result == null) {
                        result = new BookDTO(ISBN, name, language, description, translator, price, currentPrice, saleOffPercent,
                                weight, size, yearOfPublish, numberOfPage, bookLayout, publisherName, imageAddress, rating);
                    }
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return result;
    }

    public boolean insertBook(BookDTO book, String[] genres, String bookAuthorAlias, int bookQuantity) throws SQLException {
        boolean result = false;
        Connection connection = null;
        try {
            // make connection
            connection = DBHelper.makeConnection();
            if (connection != null) {
                connection.setAutoCommit(false);
                BookDAO bookDAO = new BookDAO();
                InventoryDAO inventoryDAO = new InventoryDAO();
                PublisherDAO publisherDAO = new PublisherDAO();
                AuthorDAO authorDAO = new AuthorDAO();
                GenreDAO genreDAO = new GenreDAO();
                PriceDAO priceDAO = new PriceDAO();
                BookImportDAO bookImportDAO=new BookImportDAO();
                Date dateNow = new Date(System.currentTimeMillis());
                if (bookDAO.getBookByISBN(connection, book.getISBN()) == null) {
                    inventoryDAO.insertQuantityBook(connection, book.getISBN(), bookQuantity);
                    if (publisherDAO.checkPublisherByName(connection, book.getPublisherName()) == null) {
                        publisherDAO.insertPublisherBook(connection, book.getPublisherName(), "unknown");
                    }

                    //insert book_import
                    bookImportDAO.insertBookImport(connection, book.getISBN(), book.getPublisherName(), bookQuantity, dateNow, book.getPrice());

                    //insert table books
                    String sql = "insert into books(ISBN,name,language,\n"
                            + "description,translator,\n"
                            + "price,weight,size,\n"
                            + "year_of_publish,number_of_page,\n"
                            + "book_layout,\n"
                            + "publisher_name,\n"
                            + "image_url)\n"
                            + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement pst = connection.prepareStatement(sql);
                    //gan input params vao dau ?
                    pst.setString(1, book.getISBN());
                    pst.setString(2, book.getName());
                    pst.setString(3, book.getLanguage());
                    pst.setString(4, book.getDescription());
                    pst.setString(5, book.getTranslator());
                    pst.setFloat(6, book.getPrice());
                    pst.setFloat(7, book.getWeight());
                    pst.setString(8, book.getSize());
                    pst.setInt(9, book.getYearOfPublishl());
                    pst.setInt(10, book.getNumberOfPage());
                    pst.setString(11, book.getBookLayout());
                    pst.setString(12, book.getPublisherName());
                    pst.setString(13, book.getImageAddress());
                    pst.executeUpdate();
                    pst.close();

                    //insert table authors and book_authors
                    int flag = -1;
                    List<AuthorDTO> authorList = authorDAO.getAllAuthor();
                    for (AuthorDTO author : authorList) {
                        if (author.getAliasName().equals(bookAuthorAlias)) {
                            flag = 1;
                        }
                    }

                    if (flag == 1) {
                        authorDAO.insertBookAuthor(connection, book.getISBN(), bookAuthorAlias);
                    } else {
                        authorDAO.insertAuthor(connection, bookAuthorAlias, "unknown", 0);
                        authorDAO.insertBookAuthor(connection, book.getISBN(), bookAuthorAlias);
                    }
                    //insert table genres and book_genres
                    for (String genre : genres) {
                        genreDAO.insertBookGenres(connection, book.getISBN(), genre);
                    }

                    //insert table prices
                    priceDAO.insertPriceBook(connection, book.getISBN(), book.getPrice(), dateNow);

                    //result
                    result = true;
                    connection.commit();
                } else {
                    result = false;
                }
            } else {
                System.out.println("khong chen duoc");
            }

        } catch (SQLException | ClassNotFoundException | NamingException ex) {
            connection.rollback();
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }

}
