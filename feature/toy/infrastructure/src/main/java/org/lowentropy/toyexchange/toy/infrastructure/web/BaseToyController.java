package org.lowentropy.toyexchange.toy.infrastructure.web;

import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyField;
import org.springframework.hateoas.EntityModel;

import java.util.UUID;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

interface BaseToyController {
    default EntityModel<ToyRepresentationModel> resourceWithLinkToCheckoutSelf(Toy toy) {
        return new EntityModel<>(
                new ToyRepresentationModel(toy.toMap()),
                linkTo(
                        methodOn(ToyController.class).findToy(UUID.fromString(toy.toMap().get(ToyField.ID))))
                        .withSelfRel());
    }
}
