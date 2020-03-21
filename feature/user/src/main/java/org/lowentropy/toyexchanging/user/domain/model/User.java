package org.lowentropy.toyexchanging.user.domain.model;

import java.util.Map;

public class User {
    private UserId id;
    private Name name;

    public Map<String, String> toMap() {
        return Map.of(
                "id", id.toString(),
                "name", name.toString()
        );
    }
}
