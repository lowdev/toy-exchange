package org.lowentropy.toyexchange.toy.domain.model.port;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;

public interface ToyWriteRepository {
    ToyId save(Toy toy);
}
