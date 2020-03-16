package org.lowentropy.toyexchanging.user.domain.application;

import org.lowentropy.toyexchanging.user.domain.model.UserId;
import org.lowentropy.toyexchanging.user.domain.model.UserReadRepository;
import org.lowentropy.toyexchanging.user.domain.model.User;

import java.util.Optional;

public class GetUserUseCase {

    private UserReadRepository userRepository;

    public GetUserUseCase(UserReadRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Optional<User> getUser(UserId userId) {
        return userRepository.findById(userId);
    }
}
