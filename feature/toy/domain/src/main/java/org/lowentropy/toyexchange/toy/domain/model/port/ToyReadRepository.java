package org.lowentropy.toyexchange.toy.domain.model.port;

import org.lowentropy.toyexchange.toy.domain.model.Toy;

import java.util.List;

public interface ToyReadRepository {
    List<Toy> findAll();
}
