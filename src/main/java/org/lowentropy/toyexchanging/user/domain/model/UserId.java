package org.lowentropy.toyexchanging.user.domain.model;

import java.util.UUID;

public class UserId {
    private UUID userId;

    public UserId(UUID userId) {
        this.userId = userId;
    }

    public UUID getUserId() {
        return userId;
    }

    @Override
    public String toString() {
        return userId.toString();
    }
}
