package com.swp391.group3.cart;

import com.swp391.group3.book.BookDTO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class CartObject  implements Serializable {
    private Map<BookDTO, Integer> items;

    public Map<BookDTO, Integer> getItems() {
        return items;
    }
    
    public void addBookToCart(String ISBN, String name, float price, String imageAddress, int quantity) {
        if (items == null) {
            this.items = new HashMap<>();
        }
        BookDTO book = new BookDTO(ISBN, name, price, imageAddress);
        if (this.items.containsKey(book)) {
            quantity += this.items.get(book);
        }
        this.items.put(book, quantity);
    }
    
    public void removeBookFromCart(String ISBN) {
        if (this.items == null) {
            return;
        }
        BookDTO book = new BookDTO(ISBN);
        if (this.items.containsKey(book)) {
            this.items.remove(book);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
    
    public int getBookQuantityByISBN(String isbn) {
        int result = 0;
        if (this.items == null) {
            return result;
        }
        BookDTO book = new BookDTO(isbn);
        if (this.items.containsKey(book)) {
            result = this.items.get(book);
        }
        return result;
    }
    
    public float getTotalPrice() {
        float result = 0.f;
        if (items != null) {
            for (BookDTO book: items.keySet()) {
                result += (book.getCurrentPrice() * items.get(book));
            }
        }
        return result;
    }
}
