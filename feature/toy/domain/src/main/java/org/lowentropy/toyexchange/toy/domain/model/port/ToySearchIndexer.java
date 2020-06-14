package org.lowentropy.toyexchange.toy.domain.model.port;

import org.lowentropy.toyexchange.toy.domain.model.Toy;

public interface ToySearchIndexer {
    void index(Toy toy);
}
