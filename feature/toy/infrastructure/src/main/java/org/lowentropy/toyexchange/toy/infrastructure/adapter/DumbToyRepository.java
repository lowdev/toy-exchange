package org.lowentropy.toyexchange.toy.infrastructure.adapter;

import org.lowentropy.toyexchange.toy.domain.model.*;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class DumbToyRepository implements ToyReadRepository {

    private List<Toy> toys = Arrays.asList(
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Photo de groupe Disney (Panorama)"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/15109.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Vélos à Amsterdam"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19606.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Lumière mystique"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19538.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle cadre 30-48 p - Visite au zoo"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19538.jpg"))
                    .withNumberOfPieces(45)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Cerf fantastique"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/1024/15018.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - New York (Puzzle Highlights)"))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/14086.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build()
    );

    @Override
    public List<Toy> findAll() {
        return toys;
    }

    @Override
    public Optional<Toy> findById(ToyId id) {
        return toys.stream()
                .filter(toy -> toy.hasSameId(id))
                .findFirst();
    }
}
