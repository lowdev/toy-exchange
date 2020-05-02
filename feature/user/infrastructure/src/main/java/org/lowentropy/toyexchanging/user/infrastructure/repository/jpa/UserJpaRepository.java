package org.lowentropy.toyexchanging.user.infrastructure.repository.jpa;

import org.lowentropy.toyexchanging.user.domain.model.User;
import org.lowentropy.toyexchanging.user.domain.model.UserId;
import org.lowentropy.toyexchanging.user.domain.model.UserReadRepository;

import java.util.Optional;

public class UserJpaRepository implements UserReadRepository {
    @Override
    public Optional<User> findById(UserId userId) {
        return Optional.empty();
    }

    @Override
    public void save(User user) {
    }
}
