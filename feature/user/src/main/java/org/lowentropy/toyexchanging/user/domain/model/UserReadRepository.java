package org.lowentropy.toyexchanging.user.domain.model;

import java.util.Optional;

public interface UserReadRepository {
    Optional<User> findById(UserId userId);
}
