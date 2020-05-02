package org.lowentropy.toyexchange.toy.domain.model;

public class MainImage {
    public static final MainImage NO_IMAGE = new MainImage("");

    private String source;

    public MainImage(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return source;
    }
}
