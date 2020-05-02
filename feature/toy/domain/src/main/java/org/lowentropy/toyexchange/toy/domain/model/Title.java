package org.lowentropy.toyexchange.toy.domain.model;

public class Title {
    private String title;

    public Title(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return title;
    }
}
