package org.lowentropy.toyexchange.toy.infrastructure.web;

import com.google.firebase.auth.FirebaseToken;
import org.lowentropy.toyexchange.toy.domain.model.Email;
import org.lowentropy.toyexchange.toy.domain.model.Owner;
import org.lowentropy.toyexchange.toy.domain.model.application.CrudToysUseCase;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
public class MeController implements BaseToyController {

    private CrudToysUseCase crudToysUseCase;

    public MeController(CrudToysUseCase crudToysUseCase) {
        this.crudToysUseCase = crudToysUseCase;
    }

    @GetMapping("me/toys")
    public ResponseEntity<CollectionModel<EntityModel<ToyRepresentationModel>>> getToys(Authentication authentication) {
        FirebaseToken firebaseToken = (FirebaseToken) authentication.getPrincipal();

        Owner owner = new Owner(new Email(firebaseToken.getEmail()));
        List<EntityModel<ToyRepresentationModel>> toyRepresentationModels =
                crudToysUseCase.findAllMyToys(owner).stream()
                        .map(toy -> resourceWithLinkToCheckoutSelf(toy))
                        .collect(Collectors.toList());

        return ResponseEntity.ok(new CollectionModel<>(toyRepresentationModels, linkTo(methodOn(MeController.class).getToys(authentication)).withSelfRel()));
    }
}
