package org.lowentropy.toyexchange.toy.infrastructure.web;

import java.util.List;
import java.util.Map;

public class NewToyRequest {
    private String title;
    private String description;
    private int numberOfPieces;
    private List<String> images;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfPieces() {
        return numberOfPieces;
    }

    public void setNumberOfPieces(int numberOfPieces) {
        this.numberOfPieces = numberOfPieces;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public Map<String, Object> toMap() {
        return Map.of("title", title,
                "description", description,
                "numberOfPieces", Integer.valueOf(numberOfPieces).toString(),
                "images", images);
    }
}
