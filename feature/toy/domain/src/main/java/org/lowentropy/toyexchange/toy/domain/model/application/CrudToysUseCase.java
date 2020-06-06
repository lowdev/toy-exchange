package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Email;
import org.lowentropy.toyexchange.toy.domain.model.Owner;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;

import java.util.List;
import java.util.Optional;

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

    public Optional<Toy> findToy(ToyId id) {
        return toyRepository.findById(id);
    }

    public ToyId save(Toy toy) {
        return toyWriteRepository.save(toy);
    }

    public void delete(ToyId toyId) {
        toyWriteRepository.delete(toyId);
    }

    public List<Toy> findAllMyToys(Owner owner) {
        return toyRepository.findAllMyToys(owner);
    }
}
