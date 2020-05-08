package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class GetToysUseCase {

    private ToyReadRepository toyRepository;

    public GetToysUseCase(ToyReadRepository toyRepository) {
        this.toyRepository = toyRepository;
    }

    /**
     * TODO : Add pagination
     *
     * @return
     */
    public List<Toy> getAllToys() {
        return toyRepository.findAll();
    }

    public Optional<Toy> findToy(UUID id) {
        return toyRepository.findById(new ToyId(id));
    }
}
