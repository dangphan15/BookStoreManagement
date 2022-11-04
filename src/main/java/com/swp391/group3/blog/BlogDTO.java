package com.swp391.group3.blog;

import java.io.Serializable;
import java.sql.Timestamp;

public class BlogDTO implements Serializable {
    private int id;
    private String title;
    private String content;
    private String ISBN;
    private String author;
    private String authorFullname;
    private String staff;
    private Timestamp postedTime;
    private String status;

    public BlogDTO() {
    }

    public BlogDTO(int id, String title, String content, String ISBN, String author, 
            String authorFullname, String staff, Timestamp postedTime, String status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.ISBN = ISBN;
        this.author = author;
        this.authorFullname = authorFullname;
        this.staff = staff;
        this.postedTime = postedTime;
        this.status = status;
    }

    public String getAuthorFullname() {
        return authorFullname;
    }

    public void setAuthorFullname(String authorFullname) {
        this.authorFullname = authorFullname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public Timestamp getPostedTime() {
        return postedTime;
    }

    public void setPostedTime(Timestamp postedTime) {
        this.postedTime = postedTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
