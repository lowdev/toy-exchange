package org.lowentropy.toyexchange.toy.domain.model.application;

import org.lowentropy.toyexchange.toy.domain.model.Owner;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;

public class DeleteToyCommand {
    private CrudToysUseCase crudToysUseCase;
    private Owner owner;
    private ToyId toyId;

    public DeleteToyCommand(CrudToysUseCase crudToysUseCase, Owner owner, ToyId toyId) {
        this.crudToysUseCase = crudToysUseCase;
        this.owner = owner;
        this.toyId = toyId;
    }

    public void execute() {
        this.crudToysUseCase.delete(this.owner, this.toyId);
    }
}
