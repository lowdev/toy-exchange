package org.lowentropy.toyexchange.toy.infrastructure.adapter;

public class AlgoliaToy {
    private String objectID;
    private String title;
    private String description;
    private String numberOfPieces;

    public AlgoliaToy(String toyId, String title, String description, String numberOfPieces) {
        this.objectID = toyId;
        this.title = title;
        this.description = description;
        this.numberOfPieces = numberOfPieces;
    }

    public String getObjectID() {
        return objectID;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getNumberOfPieces() {
        return numberOfPieces;
    }
}
