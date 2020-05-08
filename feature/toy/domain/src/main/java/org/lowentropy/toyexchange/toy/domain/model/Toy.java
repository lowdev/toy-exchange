package org.lowentropy.toyexchange.toy.domain.model;

import java.util.Map;

public class Toy {
    public static Builder builder() {
        return new Builder();
    }

    private ToyId id;
    private Title title;
    private Description description;
    private MainImage mainImage;

    public Toy(Builder builder) {
        this.id = builder.toyId;
        this.title = builder.title;
        this.description = builder.description;
        this.mainImage = builder.mainImage;
    public boolean hasSameId(ToyId id) {
        return this.id.equals(id);
    }

    public static class Builder {
        public ToyId toyId;
        private Title title;
        private Description description;
        private MainImage mainImage = MainImage.NO_IMAGE;;

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

        public Builder withImage(MainImage image) {
            this.mainImage = image;
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
                ToyField.THUMBNAIL, mainImage.toString());
    }
}
