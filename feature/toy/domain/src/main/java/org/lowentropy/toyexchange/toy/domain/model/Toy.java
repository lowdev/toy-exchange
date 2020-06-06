package org.lowentropy.toyexchange.toy.domain.model;

import java.util.Map;

public class Toy {
    public static Builder builder() {
        return new Builder();
    }

    private ToyId id;
    private Owner owner;
    private Title title;
    private Description description;
    private Thumbnail thumbnail;
    private int numberOfPieces;

    public Toy(Builder builder) {
        this.id = builder.toyId;
        this.title = builder.title;
        this.owner = builder.owner;
        this.description = builder.description;
        this.thumbnail = builder.thumbnail;
        this.numberOfPieces = builder.numberOfPieces;
    }

    public boolean hasSameId(ToyId id) {
        return this.id.equals(id);
    }

    public ToyId getId() {
        return this.id;
    }

    public boolean isOwner(Owner owner) {
        return this.owner.equals(owner);
    }

    public static class Builder {
        private ToyId toyId;
        private int numberOfPieces;
        private Title title;
        private Description description;
        private Thumbnail thumbnail = Thumbnail.NO_THUMBNAIL;;
        private Owner owner;

        public Builder withId(ToyId id) {
            this.toyId = id;
            return this;
        }

        public Builder withTitle(Title title) {
            this.title = title;
            return this;
        }

        public Builder withDescription(Description description) {
            this.description = description;
            return this;
        }

        public Builder withThumbnail(Thumbnail image) {
            this.thumbnail = image;
            return this;
        }

        public Builder withNumberOfPieces(int numberOfPieces) {
            this.numberOfPieces = numberOfPieces;
            return this;
        }

        public Builder withOwner(Owner owner) {
            this.owner = owner;
            return this;
        }

        public Toy build() {
            return new Toy(this);
        }
    }

    public Map<ToyField, String> toMap() {
        return Map.of(
                ToyField.ID, id.toString(),
                ToyField.TITLE, title.toString(),
                ToyField.DESCRIPTION, description.toString(),
                ToyField.THUMBNAIL, thumbnail.toString(),
                ToyField.NUMBER_OF_PIECES, Integer.toString(numberOfPieces));
    }
}
