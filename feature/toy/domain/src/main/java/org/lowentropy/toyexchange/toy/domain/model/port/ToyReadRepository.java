package org.lowentropy.toyexchange.toy.domain.model.port;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;

import java.util.List;
import java.util.Optional;

public interface ToyReadRepository {
    List<Toy> findAll();

    Optional<Toy> findById(ToyId id);
}
