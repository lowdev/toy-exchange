package org.lowentropy.toyexchanging.user.domain.model;

import java.util.UUID;

public class ToyId {
    private UUID toyId;

    public ToyId(UUID toyId) {
        this.toyId = toyId;
    }

    public UUID getToyId() {
        return toyId;
    }

    @Override
    public String toString() {
        return toyId.toString();
    }
}
