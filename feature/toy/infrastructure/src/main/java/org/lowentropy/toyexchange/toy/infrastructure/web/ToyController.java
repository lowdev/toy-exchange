package org.lowentropy.toyexchange.toy.infrastructure.web;

import com.google.firebase.auth.FirebaseToken;
import org.lowentropy.toyexchange.toy.domain.model.*;
import org.lowentropy.toyexchange.toy.domain.model.application.CrudToysUseCase;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;
import static org.springframework.http.ResponseEntity.notFound;

@RestController
@RequestMapping("toys")
public class ToyController implements BaseToyController {
    private CrudToysUseCase crudToysUseCase;

    public ToyController(CrudToysUseCase crudToysUseCase) {
        this.crudToysUseCase = crudToysUseCase;
    }

    @GetMapping
    public ResponseEntity<CollectionModel<EntityModel<ToyRepresentationModel>>> getToys() {
        List<EntityModel<ToyRepresentationModel>> toyRepresentationModels =
                crudToysUseCase.getAllToys().stream()
                        .map(toy -> resourceWithLinkToCheckoutSelf(toy))
                        .collect(Collectors.toList());

        return ResponseEntity.ok(new CollectionModel<>(toyRepresentationModels, linkTo(methodOn(ToyController.class).getToys()).withSelfRel()));
    }

    @GetMapping("/{toyId}")
    public ResponseEntity<EntityModel<ToyRepresentationModel>> findToy(@PathVariable UUID toyId) {
        return crudToysUseCase.findToy(new ToyId(toyId))
                .map(toy -> ResponseEntity.ok(resourceWithLinkToCheckoutSelf(toy)))
                .orElse(notFound().build());
    }

    @PostMapping
    public ResponseEntity save(@RequestBody NewToyRequest newToyRequest) {
        ToyId toyId = crudToysUseCase.save(Toy.builder()
                .withId(new ToyId(UUID.randomUUID()))
                .withTitle(new Title(newToyRequest.getTitle()))
                .withDescription(new Description(newToyRequest.getDescription()))
                .withNumberOfPieces(newToyRequest.getNumberOfPieces())
                .withThumbnail(new Thumbnail(newToyRequest.getImages().get(0)))
                .build()
        );

        return ResponseEntity.created(
            linkTo(
                methodOn(ToyController.class).findToy(toyId.getToyId())
            ).withSelfRel().toUri()
        ).build();
    }

    @DeleteMapping("/{toyId}")
    public ResponseEntity deleteToy(@PathVariable UUID toyId) {
        crudToysUseCase.delete(new ToyId(toyId));
        return ResponseEntity.noContent().build();
    }
}
