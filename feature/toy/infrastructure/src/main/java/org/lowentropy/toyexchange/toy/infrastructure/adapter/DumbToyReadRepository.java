package org.lowentropy.toyexchange.toy.infrastructure.adapter;

import org.lowentropy.toyexchange.toy.domain.model.Description;
import org.lowentropy.toyexchange.toy.domain.model.Title;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;

public class DumbToyReadRepository implements ToyReadRepository {
    @Override
    public List<Toy> findAll() {
        return Arrays.asList(Toy.builder()
                .withId(new ToyId(UUID.randomUUID()))
                .withTitle(new Title("Vaiana"))
                .withDescription(new Description(""))
                .build()
        );
    }
}
