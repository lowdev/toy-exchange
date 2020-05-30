package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class CrudToysUseCase {

    private ToyReadRepository toyRepository;
    private ToyWriteRepository toyWriteRepository;

    public CrudToysUseCase(ToyReadRepository toyRepository, ToyWriteRepository toyWriteRepository) {
        this.toyRepository = toyRepository;
        this.toyWriteRepository = toyWriteRepository;
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

    public ToyId save(Toy toy) {
        return toyWriteRepository.save(toy);
    }
}
