package org.lowentropy.toyexchange.toy.infrastructure.adapter;

public class AlgoliaToy {
    private String objectID;
    private String title;
    private String description;

    public AlgoliaToy(String toyId, String title, String description) {
        this.objectID = toyId;
        this.title = title;
        this.description = description;
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
}
