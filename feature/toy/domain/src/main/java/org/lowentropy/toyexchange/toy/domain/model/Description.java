package org.lowentropy.toyexchange.toy.domain.model;

public class Description {
    private String description;

    public Description(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return description.toString();
    }
}
