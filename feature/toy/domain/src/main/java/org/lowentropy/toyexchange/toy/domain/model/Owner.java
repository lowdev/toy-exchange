package org.lowentropy.toyexchange.toy.domain.model;

import java.util.Objects;

public class Owner {
    private Email email;

    public Owner(Email email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Owner owner = (Owner) o;
        return Objects.equals(email, owner.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email);
    }
}
