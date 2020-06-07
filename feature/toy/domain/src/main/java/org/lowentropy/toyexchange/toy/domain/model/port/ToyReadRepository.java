package org.lowentropy.toyexchange.toy.domain.model.port;

import org.lowentropy.toyexchange.toy.domain.model.Email;
import org.lowentropy.toyexchange.toy.domain.model.Owner;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;

import java.util.List;
import java.util.Optional;

public interface ToyReadRepository {
    Optional<Toy> findById(ToyId id);

    List<Toy> findAllMyToys(Owner owner);

    List<Toy> findAll(Owner owner, Boolean excludeMyToys);
}
