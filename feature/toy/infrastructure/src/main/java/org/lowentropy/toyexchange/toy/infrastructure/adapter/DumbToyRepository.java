package org.lowentropy.toyexchange.toy.infrastructure.adapter;

import org.lowentropy.toyexchange.toy.domain.model.*;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;

import java.util.*;
import java.util.stream.Collectors;

public class DumbToyRepository implements ToyReadRepository, ToyWriteRepository {

    private List<Toy> toys = new ArrayList<>(Arrays.asList(
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Photo de groupe Disney (Panorama)"))
                    .withOwner(new Owner(new Email("toto@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/15109.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Vélos à Amsterdam"))
                    .withOwner(new Owner(new Email("toto@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19606.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Lumière mystique"))
                    .withOwner(new Owner(new Email("random@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19538.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle cadre 30-48 p - Visite au zoo"))
                    .withOwner(new Owner(new Email("random@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/19538.jpg"))
                    .withNumberOfPieces(45)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - Cerf fantastique"))
                    .withOwner(new Owner(new Email("random@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/1024/15018.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build(),
            Toy.builder()
                    .withId(new ToyId(UUID.randomUUID()))
                    .withTitle(new Title("Puzzle 1000 p - New York (Puzzle Highlights)"))
                    .withOwner(new Owner(new Email("random@gmail.com")))
                    .withThumbnail(new Thumbnail("https://cdn.ravensburger.de/images/produktseiten/360/14086.jpg"))
                    .withNumberOfPieces(1000)
                    .withDescription(new Description("No description"))
                    .build()
    ));

    @Override
    public List<Toy> findAll(Owner owner, Boolean excludeMyToys) {
        if (excludeMyToys) {
            return toys.stream()
                    .filter(toy -> !toy.isOwner(owner))
                    .collect(Collectors.toList());
        }

        return toys;
    }

    @Override
    public Optional<Toy> findById(ToyId id) {
        return toys.stream()
                .filter(toy -> toy.hasSameId(id))
                .findFirst();
    }

    @Override
    public List<Toy> findAllMyToys(Owner owner) {
        return toys.stream()
                .filter(toy -> toy.isOwner(owner))
                .collect(Collectors.toList());
    }

    @Override
    public ToyId save(Toy toy) {
        toys.add(toy);
        return toy.getId();
    }

    @Override
    public void delete(ToyId toyId) {
        toys.removeIf(toy -> toyId.equals(toy.getId()));
    }
}
