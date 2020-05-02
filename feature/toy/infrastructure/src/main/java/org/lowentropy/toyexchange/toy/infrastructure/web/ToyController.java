package org.lowentropy.toyexchange.toy.infrastructure.web;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyField;
import org.lowentropy.toyexchange.toy.domain.model.application.GetToysUseCase;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("toys")
public class ToyController {
    private GetToysUseCase getToysUseCase;

    public ToyController(GetToysUseCase getToysUseCase) {
        this.getToysUseCase = getToysUseCase;
    }

    @GetMapping
    public ResponseEntity<CollectionModel<EntityModel<ToyRepresentationModel>>> getToys() {
        List<EntityModel<ToyRepresentationModel>> toyRepresentationModels =
                getToysUseCase.getAllToys().stream()
                        .map(toy -> resourceWithLinkToCheckoutSelf(toy))
                        .collect(Collectors.toList());

        return ResponseEntity.ok(new CollectionModel<>(toyRepresentationModels, linkTo(methodOn(ToyController.class).getToys()).withSelfRel()));
    }

    @GetMapping("/{toyId}")
    public ResponseEntity<ToyRepresentationModel> findToy(@PathVariable UUID toyId) {
        return null;
    }

    private EntityModel<ToyRepresentationModel> resourceWithLinkToCheckoutSelf(Toy toy) {
        return new EntityModel<>(
                new ToyRepresentationModel(toy.toMap()),
                linkTo(
                        methodOn(ToyController.class).findToy(UUID.fromString(toy.toMap().get(ToyField.ID))))
                        .withSelfRel());
    }
}
