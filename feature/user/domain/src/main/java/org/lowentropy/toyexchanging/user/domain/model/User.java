package org.lowentropy.toyexchanging.user.domain.model;

import java.util.List;
import java.util.Map;

public class User {
    private UserId id;
    private Name name;
    private List<ToyId> toyIds;

    public Map<String, String> toMap() {
        return Map.of(
                "id", id.toString(),
                "name", name.toString()
        );
    }

    public boolean hasToy(ToyId toyAId) {
        return toyIds.contains(toyAId);
    }

    public void give(ToyId toyAId) {
        toyIds.remove(toyAId);
    }

    public void take(ToyId toyBId) {
        toyIds.add(toyBId);
    }
}
