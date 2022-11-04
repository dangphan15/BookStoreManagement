
package com.swp391.group3.publisher;

import java.io.Serializable;

/**
 *
 * @author ACER
 */
public class PublisherDTO implements Serializable{

    private String publisherName;

    private String publisherAddress;

    public PublisherDTO() {
    }

    public PublisherDTO(String publisherName, String publisherAddress) {
        this.publisherName = publisherName;
        this.publisherAddress = publisherAddress;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getPublisherAddress() {
        return publisherAddress;
    }

    public void setPublisherAddress(String publisherAddress) {
        this.publisherAddress = publisherAddress;
    }

}
