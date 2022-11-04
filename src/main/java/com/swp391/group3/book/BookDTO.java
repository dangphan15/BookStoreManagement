/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.group3.book;

import com.swp391.group3.author.AuthorDTO;
import com.swp391.group3.genre.GenreDTO;
import com.swp391.group3.rating.RatingDTO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author PC
 */
public class BookDTO implements Serializable{
    private String ISBN;
    private String name;
    private String language;
    private String description;
    private String translator;
    private float price;
    private float currentPrice;
    private int saleOffPercent;
    private RatingDTO rating;

    public RatingDTO getRating() {
        return rating;
    }

    public void setRating(RatingDTO rating) {
        this.rating = rating;
    }
    private float weight;
    private String size;
    private int yearOfPublishl;
    private int numberOfPage;
    private String bookLayout;
    private String publisherName;
    private String imageAddress;
    private List<AuthorDTO> authors;
    private List<GenreDTO> genres;
            
    public BookDTO() {
    }

    public BookDTO(String ISBN, String name, float currentPrice, String imageAddress) {
        this.ISBN = ISBN;
        this.name = name;
        this.currentPrice = currentPrice;
        this.imageAddress = imageAddress;
    }
    
    public BookDTO(String ISBN, String name, String language, String description, String translator,
            float price, float currentPrice, int saleOffPercent, float weight, String size, int yearOfPublishl, 
            int numberOfPage, String bookLayout, String publisherName, String imageAddress, RatingDTO rating) {
        this.ISBN = ISBN;
        this.name = name;
        this.language = language;
        this.description = description;
        this.translator = translator;
        this.price = price;
        this.currentPrice = currentPrice;
        this.saleOffPercent = saleOffPercent;
        this.weight = weight;
        this.size = size;
        this.yearOfPublishl = yearOfPublishl;
        this.numberOfPage = numberOfPage;
        this.bookLayout = bookLayout;
        this.publisherName = publisherName;
        this.imageAddress = imageAddress;
        this.rating = rating;
    }

    public BookDTO(String ISBN, String name, String language, String description, String translator,
            float price, float weight, String size, int yearOfPublishl, int numberOfPage, 
            String bookLayout, String publisherName, String imageAddress) {
        this.ISBN = ISBN;
        this.name = name;
        this.language = language;
        this.description = description;
        this.translator = translator;
        this.price = price;
        this.weight = weight;
        this.size = size;
        this.yearOfPublishl = yearOfPublishl;
        this.numberOfPage = numberOfPage;
        this.bookLayout = bookLayout;
        this.publisherName = publisherName;
        this.imageAddress = imageAddress;
    }

    public int getSaleOffPercent() {
        return saleOffPercent;
    }

    public void setSaleOffPercent(int saleOffPercent) {
        this.saleOffPercent = saleOffPercent;
    }

    public float getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(float currentPrice) {
        this.currentPrice = currentPrice;
    }

    public BookDTO(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getYearOfPublishl() {
        return yearOfPublishl;
    }

    public void setYearOfPublishl(int yearOfPublishl) {
        this.yearOfPublishl = yearOfPublishl;
    }

    public int getNumberOfPage() {
        return numberOfPage;
    }

    public void setNumberOfPage(int numberOfPage) {
        this.numberOfPage = numberOfPage;
    }

    public String getBookLayout() {
        return bookLayout;
    }

    public void setBookLayout(String bookLayout) {
        this.bookLayout = bookLayout;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getImageAddress() {
        return imageAddress;
    }

    public void setImageAddress(String imageAddress) {
        this.imageAddress = imageAddress;
    }

    public List<AuthorDTO> getAuthors() {
        return authors;
    }

    public void setAuthors(List<AuthorDTO> authors) {
        this.authors = authors;
    }

    public List<GenreDTO> getGenres() {
        return genres;
    }

    public void setGenres(List<GenreDTO> genres) {
        this.genres = genres;
    }
    
    @Override
    public int hashCode() {
        return this.ISBN.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final BookDTO other = (BookDTO) obj;
        
        return (this.ISBN.equals(other.ISBN));
    }
}
