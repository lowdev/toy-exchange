package org.lowentropy.toyexchange.toy.infrastructure.web;

import com.google.firebase.auth.FirebaseToken;
import org.lowentropy.toyexchange.toy.domain.model.*;
import org.lowentropy.toyexchange.toy.domain.model.application.CrudToysUseCase;
import org.lowentropy.toyexchange.toy.domain.model.application.DeleteToyCommand;
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

@RestController
@RequestMapping("me/toys")
public class MeController implements BaseToyController {

    private CrudToysUseCase crudToysUseCase;

    public MeController(CrudToysUseCase crudToysUseCase) {
        this.crudToysUseCase = crudToysUseCase;
    }

    @GetMapping
    public ResponseEntity<CollectionModel<EntityModel<ToyRepresentationModel>>> getToys(Authentication authentication) {
        FirebaseToken firebaseToken = (FirebaseToken) authentication.getPrincipal();

        Owner owner = new Owner(new Email(firebaseToken.getEmail()));
        List<EntityModel<ToyRepresentationModel>> toyRepresentationModels =
                crudToysUseCase.findAllMyToys(owner).stream()
                        .map(toy -> resourceWithLinkToCheckoutSelf(toy))
                        .collect(Collectors.toList());

        return ResponseEntity.ok(new CollectionModel<>(toyRepresentationModels, linkTo(methodOn(MeController.class).getToys(authentication)).withSelfRel()));
    }

    @PostMapping
    public ResponseEntity save(Authentication authentication, @RequestBody NewToyRequest newToyRequest) {
        FirebaseToken firebaseToken = (FirebaseToken) authentication.getPrincipal();

        ToyId toyId = crudToysUseCase.save(Toy.builder()
                .withId(new ToyId(UUID.randomUUID()))
                .withOwner(new Owner(new Email(firebaseToken.getEmail())))
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
    public ResponseEntity deleteToy(Authentication authentication, @PathVariable UUID toyId) {
        FirebaseToken firebaseToken = (FirebaseToken) authentication.getPrincipal();

        DeleteToyCommand command = new DeleteToyCommand(crudToysUseCase, new Owner(new Email(firebaseToken.getEmail())), new ToyId(toyId));
        command.execute();

        return ResponseEntity.noContent().build();
    }
}
