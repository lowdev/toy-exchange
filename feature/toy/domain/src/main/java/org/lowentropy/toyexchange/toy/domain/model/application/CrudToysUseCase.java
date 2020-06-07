package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Email;
import org.lowentropy.toyexchange.toy.domain.model.Owner;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;

import java.util.Arrays;
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
    public List<Toy> getAllToys(Owner owner, Boolean excludeMyToys) {
        return toyRepository.findAll(owner, excludeMyToys);
    }

    public Optional<Toy> findToy(ToyId id) {
        return toyRepository.findById(id);
    }

    public ToyId save(Toy toy) {
        return toyWriteRepository.save(toy);
    }

    public void delete(Owner owner, ToyId toyId) {
        checkIfUserCanDeleteToy(owner, toyId);
        toyWriteRepository.delete(toyId);
    }

    private void checkIfUserCanDeleteToy(Owner owner, ToyId toyId) {
        Optional<Toy> toyOptional = toyRepository.findById(toyId);
        Toy toy = toyOptional.orElseThrow(() -> new IllegalArgumentException("Toy has been already deleted"));

        if (!toy.isOwner(owner)) {
            throw new IllegalArgumentException("You are not owner of this toy !!!");
        }
    }

    public List<Toy> findAllMyToys(Owner owner) {
        return toyRepository.findAllMyToys(owner);
    }
}
