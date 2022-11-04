package com.swp391.group3.comment;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommentDTO implements Serializable {
    private int id;
    private String isbn;
    private String username;
    private String fullname;
    private String content;
    private String status;
    private float star;
    private Timestamp postedTime;

    public CommentDTO() {
    }

    public CommentDTO(int id, String isbn, String username, String fullname, String content, String status, float star, Timestamp postedTime) {
        this.id = id;
        this.isbn = isbn;
        this.username = username;
        this.fullname = fullname;
        this.content = content;
        this.status = status;
        this.star = star;
        this.postedTime = postedTime;
    }

    public CommentDTO(int id, String content, Timestamp postedTime) {
        this.id = id;
        this.content = content;
        this.postedTime = postedTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getStar() {
        return star;
    }

    public void setStar(float star) {
        this.star = star;
    }

    public Timestamp getPostedTime() {
        return postedTime;
    }

    public void setPostedTime(Timestamp postedTime) {
        this.postedTime = postedTime;
    }
}
