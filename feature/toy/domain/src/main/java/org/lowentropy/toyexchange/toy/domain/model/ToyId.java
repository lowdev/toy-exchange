package org.lowentropy.toyexchange.toy.domain.model;

import java.util.Objects;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ToyId toyId1 = (ToyId) o;
        return Objects.equals(toyId, toyId1.toyId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(toyId);
    }

    @Override
    public String toString() {
        return toyId.toString();
    }
}
