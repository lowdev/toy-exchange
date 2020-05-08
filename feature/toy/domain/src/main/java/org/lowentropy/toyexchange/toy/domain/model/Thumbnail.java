package org.lowentropy.toyexchange.toy.domain.model;

public class Thumbnail {
    public static final Thumbnail NO_THUMBNAIL = new Thumbnail("");

    private String source;

    public Thumbnail(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return source;
    }
}
