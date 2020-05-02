package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import java.util.List;

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
}
